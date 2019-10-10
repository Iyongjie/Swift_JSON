//
//  CodableModel.swift
//  JSONDemo
//
//  Created by MaBiao on 2018/5/20.
//  Copyright © 2018年 iMaBiao. All rights reserved.
//

import UIKit

struct CodableModel: Codable {
    var info : infoModel
    var list : [listModel]
    var total : Int
    
}
struct infoModel: Codable {
    var count : Int
    var np : Int
}
struct listModel : Codable {
    var count : Int
    var id : Int
    var name : String
    
}


/**
http://api.budejie.com/api/api_open.php?a=category&c=subscribe
{
    "info": {
        "count": 10,
        "np": 20
    },
    "total": 10,
    "list": [
    {
    "count": 16,
    "id": 37,
    "name": "搞笑"
    },
    {
    "count": 7,
    "id": 36,
    "name": "精品"
    }
    ],
    "size": 10
}
 */
