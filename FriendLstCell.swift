//
//  FriendLstCell.swift
//  CrusadersQuestDirectory
//
//  Created by CK Lam on 5/5/15.
//  Copyright (c) 2015 CK Lam. All rights reserved.
//

import UIKit

class FriendLstCell: UITableViewCell {
    @IBOutlet weak var friendListCell: UIView!

    @IBOutlet weak var addedDate: UILabel!
    @IBOutlet weak var friendContent: UILabel!
    @IBOutlet weak var friendTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
