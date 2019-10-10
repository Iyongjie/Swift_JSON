//
//  DictModel.swift
//  JSONDemo
//
//  Created by Telit on 2018/5/18.
//  Copyright © 2018年 iMaBiao. All rights reserved.
//

import UIKit

class DictModel: NSObject {

    var tag_list :[tagModel]?
    var square_list : [squareModel]?
    
    
    init(dict: [String : Any]) {
        super.init()
        
        guard let  tagList = dict["tag_list"] as? [[String : Any]] else{
            return
        }
        guard let squareList = dict["square_list"] as? [[String : Any]] else{
            return
        }
        
        var tagArray = [tagModel]()
        for dic in tagList {
            let tag = tagModel(dict: dic)
            tagArray.append(tag)
        }
        
        var squareArray = [squareModel]()
        for dic in squareList {
            let  square = squareModel(dict: dic)
            squareArray.append(square)
        }
        
        tag_list = tagArray
        square_list = squareArray
        
    }
}

class tagModel : NSObject {
    var theme_id : String?
    var theme_name: String?
    
    init(dict: [String : Any]) {
        super.init()
        
        theme_id = dict["theme_id"] as? String
        theme_name = dict["theme_name"] as? String
    }
    
}

class squareModel : NSObject {
    var ID : String?
    var name : String?
    var icon : String?
    var url : String?
    var android : String?
    var iphone : String?
    var ipad : String?
    var market : String?
    
    init(dict: [String : Any]) {
        super.init()
        
        ID = dict["id"] as? String
        name = dict["name"] as? String
        icon = dict["icon"] as? String
        url = dict["url"] as? String
        android = dict["android"] as? String
        iphone = dict["iphone"] as? String
        ipad = dict["ipad"] as? String
        market = dict["market"] as? String
    }
}

/**
{
    "tag_list": [
    {
    "theme_id": "3096",
    "theme_name": "红人频道"
    },
    {
    "theme_id": "9",
    "theme_name": "自拍交友"
    }
    ],
    "square_list": [
    {
    "id": "162",
    "name": "咪咕悦读会",
    "icon": "http://mstatic.spriteapp.cn//ugc/2017/07/12/BtaWlt.jpg",
    "url": "http://m.budejie.com/partner/migu.html",
    "android": "6.7.3|",
    "iphone": "10.0|",
    "ipad": "",
    "market": ""
    },
    {
    "id": "167",
    "name": "水晶直播",
    "icon": "http://mstatic.spriteapp.cn//ugc/2018/05/15/sPXsIk.jpg",
    "url": "http://h.sjlive.cn/?channel=92002&goroom=1",
    "android": "6.7.0|",
    "iphone": "",
    "ipad": "",
    "market": "guanwang|tencentyingyongbao|360zhushou|baidu|B—huawei|B-meizu|xiaomi|wandoujia|leshangdian|taobao|sougousjzs|C-jinli|S-samsung|B-chuizi|b-huawei|b-meizu|b-leshi|s-samsung|anzhi|c-jinli|b-chuizi"
    },
    {
    "id": "0",
    "name": "更多",
    "icon": "http://img.spriteapp.cn/ugc/2014/05/06/141211_3901.png",
    "url": "",
    "android": "",
    "iphone": "4.5.9|",
    "ipad": "",
    "market": ""
    }
    ]
}
*/
