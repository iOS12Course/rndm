//
//  ThoughtCell.swift
//  rndm
//
//  Created by Ricardo Herrera Petit on 3/12/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import Firebase

class ThoughtCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var thoughtTxtLbl: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    @IBOutlet weak var likesNumLbl: UILabel!
    @IBOutlet weak var commentsNumLbl: UILabel!
    
    //Variables
    private var thought : Thought!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        likesImg.addGestureRecognizer(tap)
        likesImg.isUserInteractionEnabled = true
    }
    
    @objc func likeTapped() {
//       Method 1 Firestore.firestore().collection(THOUGHTS_REF).document(thought.documentId).setData([NUM_LIKES : thought.numLikes + 1], merge: true)
    
    //Method 12
    Firestore.firestore().document("thoughts/\(thought.documentId!)")
        .updateData([NUM_LIKES  : thought.numLikes + 1])
    
    }
    
    func configureCell(thought:Thought) {
        self.thought = thought
        self.usernameLbl.text = thought.username
        self.thoughtTxtLbl.text = thought.thoughTxt
        self.likesNumLbl.text = String(thought.numLikes)
        self.commentsNumLbl.text = String(thought.numComments)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timeStamp = formatter.string(from: thought.timestamp)
        self.timestampLbl.text = timeStamp
    }
    
}
