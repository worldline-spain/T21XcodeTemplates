//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ___VARIABLE_productName:identifier___ItemCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel?
    @IBOutlet weak var itemImageView: UIImageView?
    
    var viewModel = ___VARIABLE_productName:identifier___ItemCellViewModel() {
        didSet {
            labelTitle?.text = viewModel.title
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
