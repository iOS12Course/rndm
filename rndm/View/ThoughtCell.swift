//
//  ThoughtCell.swift
//  rndm
//
//  Created by Ricardo Herrera Petit on 3/12/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit

class ThoughtCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var thoughtTxtLbl: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    @IBOutlet weak var likesNumLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(thought:Thought) {
//        self.usernameLbl.text = thought.username
//        self.timestampLbl.text = thought.timestamp
//        self.thoughtTxtLbl.text = thought.thoughTxt
//        self.likesImg
    }

}
