//
//  CharacterInfoTableViewCell.swift
//  CrusadersQuestDirectory
//
//  Created by CK Lam on 7/5/15.
//  Copyright (c) 2015 CK Lam. All rights reserved.
//

import UIKit

class CharacterInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var InfoTitle: UILabel!
    @IBOutlet weak var InfoContent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
