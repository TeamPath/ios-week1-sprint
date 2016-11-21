//
//  NetworkModel.swift
//  Hikeit2
//
//  Created by Andrew Noble on 11/16/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import Foundation
import Alamofire
import Freddy

// Describes what you need to make a network request and read it
protocol NetworkModel: JSONDecodable {
    init(json: JSON) throws
    init()
    
    // what is HTTP method (get/post/put/etc)
    func method() -> Alamofire.HTTPMethod
    //Rest URL to resource i.e. http://server.com/posts/1
    func path () -> String
    //Convert the object to a dictionary for later conversion to Json
    func toDictionary() -> [String: AnyObject]?
    
}

