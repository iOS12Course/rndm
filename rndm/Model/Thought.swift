//
//  Thought.swift
//  rndm
//
//  Created by Ricardo Herrera Petit on 3/12/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import Foundation
import Firebase

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
    
    class func parseData(snapshot: QuerySnapshot?) -> [Thought] {
        var thoughts = [Thought]()
        guard let snap = snapshot else { return thoughts }
        for document in snap.documents {
            let data = document.data()
            let username = data[USERNAME] as? String ?? "Anonymous"
            let timestamp = data[TIMESTAMP] as? Date ?? Date()
            let thoughtTxt = data[THOUGHT_TXT] as? String ?? ""
            let numLikes = data[NUM_LIKES] as? Int ?? 0
            let numComments = data[NUM_COMMENTS] as? Int ?? 0
            let documentId = document.documentID
            
            let thought = Thought(username: username, timestamp: timestamp, thoughtTxt: thoughtTxt, numLikes: numLikes, numComments: numComments, documentId: documentId)
            thoughts.append(thought)
            
        }
        
        return thoughts
    }
    
}
