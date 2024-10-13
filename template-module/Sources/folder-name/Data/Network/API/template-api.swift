//
//  TEMPLATE-API.swift
//
//
//  Created by AUTHOR-NAME on DATE.
//

import Moya
import Network

enum TEMPLATE-API {
    
    case requestName
}

extension TEMPLATE-API: DynamicTargetType {
    
    var path: String {
        switch self {
        case .requestName:
            return ""
        }
    }
    
    var method: Method {
        switch self {
        case .requestName:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .requestName:
            return .requestPlain
        }
    }
}

extension TEMPLATE-API: AccessTokenAuthorizable {

    var authorizationType: AuthorizationType? {
        .bearer
    }
}
