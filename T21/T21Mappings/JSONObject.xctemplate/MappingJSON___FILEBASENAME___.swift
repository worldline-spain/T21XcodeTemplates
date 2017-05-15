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

public func MappingJSON___FILEBASENAME___() -> Mapping<JSON,MappingResult<___VARIABLE_Method___>> {
    let m : Mapping<JSON,___VARIABLE_Method___> = Mapping({(input: JSON)->(MappingResult<___VARIABLE_Method___>) in
        if input.type == .dictionary {
            
            //todo: ...
            
            return MappingResult.success(output)
        }
        return MappingResult.failure(MappingError.expectedObjectType)
    })
    return m
}

