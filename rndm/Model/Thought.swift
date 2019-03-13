//
//  Thought.swift
//  rndm
//
//  Created by Ricardo Herrera Petit on 3/12/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import Foundation

class Thought {
    
    private (set) var username: String!
    private (set) var timestamp: Date!
    private (set) var thoughTxt: String!
    private (set) var numLikes: Int!
    private (set) var numComments: Int!
    private (set) var documentId: String!
    
    init(username:String, timestamp:Date, thoughtTxt:String, numLikes:Int, numComments:Int, documentId: String) {
        self.username = username
        self.timestamp = timestamp
        self.thoughTxt = thoughtTxt
        self.numLikes = numLikes
        self.numComments = numComments
        self.documentId = documentId
    }
    
    
}
