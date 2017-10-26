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
import Result
import Moya

public func MappingJSON___VARIABLE_productName:identifier___() -> Mapping<Result<Moya.Response, MoyaError>,___VARIABLE_method:identifier___> {
    return MappingJSONResponse({ (json: JSON) -> (___VARIABLE_method:identifier___) in
        //todo: return response
    }, mappingError: {
        //todo: return mappingError
    },requestError: { (error) in
        //todo: return requestError
    })
}
