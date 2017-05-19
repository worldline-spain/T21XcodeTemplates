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

class ___FILEBASENAME___CollectionCell: UICollectionViewCell {

    private(set) var disposeBag = DisposeBag()
    
    var viewModel = ___FILEBASENAME___CollectionCellViewModel() {
        didSet {
            disposeBag = DisposeBag()
            
            //Create ViewModel bindings here...
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}