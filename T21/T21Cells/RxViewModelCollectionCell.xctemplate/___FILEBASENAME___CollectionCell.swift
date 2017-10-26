//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import RxSwift
import RxCocoa

class ___VARIABLE_productName:identifier___CollectionCell: UICollectionViewCell {

    private(set) var disposeBag = DisposeBag()
    
    var viewModel = ___VARIABLE_productName:identifier___CollectionCellViewModel() {
        didSet {
            disposeBag = DisposeBag()
            //Create ViewModel bindings here...
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
