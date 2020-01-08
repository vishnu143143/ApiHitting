//
//  UserModel.swift
//  ApiHitting
//
//  Created by deltaschool on 07/12/19.
//  Copyright © 2019 deltaschool. All rights reserved.
//

import Foundation
class Address{
    var city:String
    var street : String
    init?(dic : [String: Any])
    {
        guard let City = dic["city"] as? String,
            let Street = dic["street"] as? String
            else{
                return nil
        }
        self.city = City
        self.street = Street
    }

}

class user{
//    var name:String?
//    var email:String?
//    init(dict:[String : Any])
//    {
//        self.name = dict["name"] as! String
//        self.email = dict["email"] as! String
//    }
//    
    var name:String
    var email:String
    var address : Address
    init?(dict : [String : Any])
    {
        guard let name = dict["name"] as? String,
            let email = dict["email"] as? String,
            let address = dict["address"] as? [String : Any],
        let add = Address(dic: address)
            else{
                return nil
        }
        self.name = name
        self.email = email
        self.address = add
    }
    

}

