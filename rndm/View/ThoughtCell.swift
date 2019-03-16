//
//  ThoughtCell.swift
//  rndm
//
//  Created by Ricardo Herrera Petit on 3/12/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import Firebase

protocol ThoughtDelegate {
    func thoughtOptionsTapped(thought: Thought)
}

class ThoughtCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var thoughtTxtLbl: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    @IBOutlet weak var likesNumLbl: UILabel!
    @IBOutlet weak var commentsNumLbl: UILabel!
    @IBOutlet weak var optionsMenu: UIImageView!
    
    //Variables
    private var thought : Thought!
    private var delegate : ThoughtDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        likesImg.addGestureRecognizer(tap)
        likesImg.isUserInteractionEnabled = true
    }
    
    @objc func likeTapped() {
    Firestore.firestore().document("thoughts/\(thought.documentId!)")
        .updateData([NUM_LIKES  : thought.numLikes + 1])
    
    }
    
    func configureCell(thought:Thought, delegate: ThoughtDelegate) {
        optionsMenu.isHidden = true
        self.delegate = delegate
        
        self.thought = thought
        self.usernameLbl.text = thought.username
        self.thoughtTxtLbl.text = thought.thoughTxt
        self.likesNumLbl.text = String(thought.numLikes)
        self.commentsNumLbl.text = String(thought.numComments)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, hh:mm"
        let timeStamp = formatter.string(from: thought.timestamp)
        self.timestampLbl.text = timeStamp
        
        if thought.userId == Auth.auth().currentUser?.uid {
            optionsMenu.isHidden = false
            optionsMenu.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(thoughtOptionsTapped))
            optionsMenu.addGestureRecognizer(tap)
        }
    }
    
    @objc func thoughtOptionsTapped() {
        delegate?.thoughtOptionsTapped(thought: thought)
    }
    
    
}
