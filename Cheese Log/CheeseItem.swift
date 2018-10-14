//
//  CheeseItem.swift
//  Cheese Log
//
//  Created by David Benhammou on 8/6/17.
//  Copyright © 2017 MobioDev. All rights reserved.
//

import Foundation
import RealmSwift

class CheeseItem : Object{
    
    dynamic var name = ""
    dynamic var type = ""
    dynamic var origin = ""
    dynamic var notes = ""
    dynamic var rating = 0.0
    //To Solve: how to store images to display in tableview
    
    //attempt: using this answer from https://stackoverflow.com/questions/33299523/how-to-put-an-image-in-a-realm-database
    
    //var cheeseImageData = NSData()
    //var labelImageData = NSData()
    
}
