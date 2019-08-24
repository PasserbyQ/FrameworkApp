//
//  HomeViewModel.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/10.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeViewModel: NSObject {

    // 数据源
    var dataList: [HomeModel] = []

    /**
     * 获取数据
     */
    func getData(success: @escaping Success,fail: @escaping Fail) {
        PQSessionManager.shared.get(URLs.jods) { (completion) in
            switch completion {
                
            case let .success(response):
                
                if let data = Mapper<BaseArrayModel<HomeModel>>().map(JSONObject: response.result.value)?.data {
                    self.dataList = data
                    print(data.first?.job,data.last?.salary)
                }
                success()
            case let .fail(code,message):
                fail(code,message)
            }
        }
    }
}
