//
//  TableViewCell.swift
//  HackerNews
//
//  Created by Wen Niao Qu on 3/5/16.
//  Copyright © 2016 Wen Niao Qu. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var storyTitleLabel: UILabel!    
    @IBOutlet weak var storyAuthorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
