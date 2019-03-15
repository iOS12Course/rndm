//
//  CommentsVC.swift
//  rndm
//
//  Created by Ricardo Herrera Petit on 3/14/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit

class CommentsVC: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addCommentTxt: UITextField!
    @IBOutlet weak var keyboardView: UIView!
    
    //Variables
    var thought : Thought!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addCommentTapped(_ sender: Any) {
    }
}
