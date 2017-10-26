//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import SwiftyJSON
import T21Mapping

public func MappingJSONArray<OutputType>(_ itemMapping: Mapping<JSON,MappingResult<OutputType>>) -> Mapping<JSON,MappingResult<Array<OutputType>>> {
    let m: Mapping<JSON,MappingResult<Array<OutputType>>> = Mapping({ (input) in
        if input.type == .array {
            var results = Array<OutputType>()
            for (_,subJson):(String, JSON) in input {
                let result = itemMapping.map(subJson)
                if result.isSuccess {
                    results.append(result.value!)
                } else {
                    return MappingResult.failure(MappingError.expectedObjectType)
                }
            }
            return MappingResult.success(results)
        } else {
            return MappingResult.failure(MappingError.expectedArrayType)
        }
    })
    return m
}
