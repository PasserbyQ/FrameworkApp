//
//  BaseModel.swift
//  FrameworkApp
//
//  Created by yu qin on 2019/8/11.
//  Copyright © 2019 yu qin. All rights reserved.
//

import UIKit
import ObjectMapper

open class BaseModel: Mappable {
    open var status:Bool = false
    open var statusCode:String = "1000"
    open var message:String = ""
    
    public init(){
        
    }
    
    required public init?(map: Map) {
        
    }
    
    open func mapping(map: Map) {
        status <- map["status"]
        statusCode <- map["statusCode"]
        message <- map["message"]
    }
}
open class BaseFoundationModel<T>: BaseModel {
    open var data:T?
    
    public override init(){
        super.init()
    }
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    open override func mapping(map: Map) {
        super.mapping(map: map)
        data <- map["result"]
    }
}

open class BaseSingleModel<T:Mappable>: BaseModel {
    open var data:T?
    
    public override init(){
        super.init()
    }
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    open override func mapping(map: Map) {
        super.mapping(map: map)
        data <- map["result"]
    }
}

open class BaseArrayModel<T:Mappable>: BaseModel {
    open var data:[T]?
    
    public override init(){
        super.init()
    }
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    open override func mapping(map: Map) {
        super.mapping(map: map)
        data <- map["result"]
    }
}

open class BaseArrayArrayModel<T:Mappable>: BaseModel {
    open var data:[[T]]?
    
    public override init(){
        super.init()
    }
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    open override func mapping(map: Map) {
        super.mapping(map: map)
        data <- map["result"]
    }
}
