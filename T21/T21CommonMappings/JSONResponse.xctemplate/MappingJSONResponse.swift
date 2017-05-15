//
//  MappingJSONResponse.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import Moya
import Result
import SwiftyJSON
import T21Mapping
import T21HTTPRequester

public func MappingJSONResponse<OutputType>(_ innerMapping: @escaping (JSON) -> (OutputType),
                              mappingError: @escaping () -> (OutputType),
                              requestError: @escaping (MoyaError) -> (OutputType)) -> MoyaMapping<OutputType> {
    return Mapping({ (result) in
        switch result {
        case let .success(httpResponse):
            
            switch httpResponse.statusCode {
            case 200:
                let json = JSON(data: httpResponse.data)
                if json.type != .null {
                    return innerMapping(json)
                } else {
                    return mappingError()
                }
            default:
                return requestError(MoyaError.statusCode(httpResponse))
            }
            
        case let .failure(error):
            return requestError(error)
        }
    })
}
