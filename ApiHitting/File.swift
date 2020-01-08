//
//  File.swift
//  ApiHitting
//
//  Created by deltaschool on 12/12/19.
//  Copyright © 2019 deltaschool. All rights reserved.
//

import Foundation
class User{
    var name : String
    var team : String
    var imageurl : String
    init?(dict : [String :Any])
    {
        guard let Name = dict["name"]  as? String
            else{
                return nil
        }
        guard let Team = dict["team"]  as? String
            else{
                return nil
        }
        guard let ImageUrl = dict["imageurl"]  as? String
            else{
                return nil
        }
    self.name = Name
    self.imageurl = ImageUrl
        self.team = Team
    
    }
}


//https://www.json4swift.com/results.php
