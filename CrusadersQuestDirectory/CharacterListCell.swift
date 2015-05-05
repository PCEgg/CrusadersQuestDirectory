//
//  CharacterListCell.swift
//  CrusadersQuestDirectory
//
//  Created by CK Lam on 26/4/15.
//  Copyright (c) 2015 CK Lam. All rights reserved.
//

import UIKit

class CharacterListCell: UITableViewCell {

    @IBOutlet weak var JobImage: UIImageView!
    @IBOutlet weak var Lv5Pic: UIImageView!
    @IBOutlet weak var Lv4Pic: UIImageView!
    @IBOutlet weak var Lv6Pic: UIImageView!
    @IBOutlet weak var CharacterListCellRow: UIView!
    @IBOutlet weak var Sample: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
