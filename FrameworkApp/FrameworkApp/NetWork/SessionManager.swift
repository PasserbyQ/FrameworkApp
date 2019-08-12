//
//  SessionManager.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import Alamofire
import ObjectMapper

// 请求闭包
enum Completion {
    case success(DataResponse<Any>)
    case fail(code: String, message: String)
}

// 成功的闭包
typealias Success = () -> Void
// 失败的闭包
typealias Fail = (String, String) -> Void

class PQSessionManager: SessionManager {
    
    /**
     * 初始化进行配置
     */
    static let shared: PQSessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = PQSessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 10
        return PQSessionManager(configuration: configuration)
    }()
    
    
    /**
     * get请求
     */
    func get(_ url: URLConvertible, completion: @escaping (Completion) -> Void) {
        httpRequest(url, method: .get, parameters: nil, completionHandler: completion)
    }
    
    /**
     * post请求
     */
    func post(_ url: URLConvertible, parameters: Parameters,
                     completion: @escaping (Completion) -> Void) {
        httpRequest(url, method: .post, parameters: parameters, completionHandler: completion)
    }
    
    /**
     * 统一请求
     */
    fileprivate func httpRequest(_ url: URLConvertible, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders? = nil, completionHandler: @escaping (Completion) -> Void) {
        

        super.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { response in
            
            let result = response.result
            
            switch result {
                
            case .success(_):
                if let data = Mapper<BaseModel>().map(JSONObject: response.result.value) {
                    
                    if data.status == false {
                        completionHandler(.fail(code: data.statusCode, message: data.message))
                    } else {
                        completionHandler(.success(response))
                    }
                }
            case let .failure(error):
                let statusCode = response.response?.statusCode ?? 1000
                var message = error.localizedDescription
                if statusCode == -1009 {
                    message = kRequestError
                }
                completionHandler(.fail(code: String(statusCode), message: message))
            }
        }
    }
}
