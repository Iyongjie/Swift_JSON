//
//  ObjectMapperModel.swift
//  JSONDemo
//
//  Created by Telit on 2018/5/21.
//  Copyright © 2018年 iMaBiao. All rights reserved.
//

import UIKit
import ObjectMapper

class ObjectMapperModel: Mappable {

    var count : Int?
    var next_page : Int?
    var  total : Int?
    var list : [listModel_Map]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        count       <- map["count"]
        next_page   <- map["next_page"]
        total       <- map["total"]
        list         <- map["list"]
    }
}
class listModel_Map : Mappable {
    var fans_count: Int?
    var header: String?
    var uid: Int?
    var is_vip: Bool?
    var is_follow: Int?
    var introduction: String?
    var gender: Int?
    var tiezi_count : Int?
    var screen_name: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        fans_count           <- map["fans_count"]
        header               <- map["header"]
        uid                  <- map["uid"]
        is_vip               <- map["is_vip"]
        is_follow            <- map["is_follow"]
        introduction         <- map["introduction"]
        gender              <- map["gender"]
        tiezi_count         <- map["tiezi_count"]
        screen_name         <- map["screen_name"]
    }
    
}

/**
 
 http://api.budejie.com/api/api_open.php?a=list&c=subscribe&category_id=35&page=1
 
 {
 "count": 97,
 "next_page": 2,
 "total": 97,
 "list": [
 {
 "fans_count": 82,
 "header": "http://wimg.spriteapp.cn/profile/large/2017/05/22/5922ae328603b_mini.jpg",
 "uid": 20802957,
 "is_vip": false,
 "is_follow": 0,
 "introduction": "这是由一群可（wu）爱（chi）的人创作的原创视频请大家多多支持，转发，谢谢。      鞠躬！成员回礼！",
 "gender": 2,
 "tiezi_count": 46,
 "screen_name": "达叔的街坊官方"
 },
 {
 "fans_count": 108,
 "header": "http://wimg.spriteapp.cn/profile/large/2016/03/16/56e9066ac784b_mini.jpg",
 "uid": 17796229,
 "is_vip": false,
 "is_follow": 0,
 "introduction": "",
 "gender": 2,
 "tiezi_count": 9,
 "screen_name": "唐攀攀"
 },
 {
 "fans_count": 892,
 "header": "http://wimg.spriteapp.cn/profile/large/2016/05/11/57329b0f427ce_mini.jpg",
 "uid": 7801342,
 "is_vip": false,
 "is_follow": 0,
 "introduction": "只希望每天自己都快快乐乐的",
 "gender": 1,
 "tiezi_count": 28,
 "screen_name": "猫九九"
 }
 ],
 "total_page": 5
 }

 
 */
