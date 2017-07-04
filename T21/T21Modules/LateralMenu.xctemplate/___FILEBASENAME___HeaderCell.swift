//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol ___FILEBASENAME___HeaderEventHandler : class {
    func headerButtonPressed()
}

class ___FILEBASENAME___HeaderCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle : UILabel?
    @IBOutlet weak var labelSubtitle : UILabel?
    @IBOutlet weak var button : UIButton?
    @IBOutlet weak var headerImageView : UIImageView?
    weak var delegate : ___FILEBASENAME___HeaderEventHandler?
    
    var viewModel = ___FILEBASENAME___HeaderCellViewModel() {
        didSet {
            labelTitle?.text = viewModel.title
            labelSubtitle?.text = viewModel.subtitle
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
    
    @IBAction func buttonPressed() {
        delegate?.headerButtonPressed()
    }
}
