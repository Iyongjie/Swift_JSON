//
//  HandyModel.swift
//  JSONDemo
//
//  Created by Telit on 2018/5/21.
//  Copyright © 2018年 iMaBiao. All rights reserved.
//

import UIKit
import HandyJSON

class HandyModel : HandyJSON  {
    
    var info: infoModel_Handy = infoModel_Handy()
    var list: [list_Handy]? = [list_Handy]()
    
    //HandyJSON ：模型为类必须添加 init方法，结构体则省略
    required init() { }
}

struct infoModel_Handy : HandyJSON{
    var vendor: String = ""
    var count  : Int = 0
    var page : Int = 0
    var maxid: String = ""
    var maxtime: String = ""
}
struct list_Handy : HandyJSON{
    var id : String = ""
    var type : String = ""
    var text: String = ""
    var name: String = ""
    var profile_image: String = ""
}

/**
 
 http://api.budejie.com/api/api_open.php?a=newlist&c=data&page=1&type=all&maxtime=
 {
 "info": {
 "vendor": "six.jie.c",
 "count": 2000,
 "page": 100,
 "maxid": "1526535981",
 "maxtime": "1526535981"
 },
 "list": [
 {
 "id": "27937548",
 "type": "10",
 "text": "各位，大展才华得时候到了，请开始你们的表演！",
 "user_id": "21390415",
 "name": "苏小诺Paul",
 "screen_name": "苏小诺Paul",
 "profile_image": "http://wx.qlogo.cn/mmopen/vi_32/J5gOJWzDzovFx39apaJfH8PSDDpWkxucHuYtNzea5ib54EKlS2zZPdrcP17ia24pj1180XFt2RW1VOibDRib3rvMAA/0",
 "created_at": "2018-05-17 13:46:27",
 "create_time": "2018-05-17 13:07:08",
 "passtime": "2018-05-17 13:46:27",
 "love": "58",
 "hate": "5",
 "comment": "4",
 "repost": "0",
 "bookmark": "0",
 "bimageuri": "",
 "voiceuri": "",
 "voicetime": "0",
 "voicelength": "0",
 "status": "2",
 "theme_id": "16321",
 "theme_name": "知乎神回复",
 "theme_type": "1",
 "videouri": "",
 "videotime": "0",
 "original_pid": "0",
 "cache_version": 2,
 "cai": "5",
 "top_cmt": [],
 "weixin_url": "http://a.f.budejie.com/share/27937548.html?wx.qq.com&appname=",
 "themes": [],
 "image0": "http://wimg.spriteapp.cn/ugc/2018/05/17/5afd0dfc45002_1.jpg",
 "image2": "http://wimg.spriteapp.cn/ugc/2018/05/17/5afd0dfc45002_1.jpg",
 "image1": "http://wimg.spriteapp.cn/ugc/2018/05/17/5afd0dfc45002_1.jpg",
 "cdn_img": "http://wimg.spriteapp.cn/ugc/2018/05/17/5afd0dfc45002_1.jpg",
 "is_gif": "0",
 "width": "2080",
 "height": "1560",
 "tag": "",
 "t": 1526535987,
 "ding": "58",
 "favourite": "0"
 },
 {
 "id": "27937503",
 "type": "10",
 "text": "为了藏点私房钱我也是绞尽脑汁啊！",
 "user_id": "18072769",
 "name": "内涵污贼君",
 "screen_name": "内涵污贼君",
 "profile_image": "http://wimg.spriteapp.cn/profile/large/2017/09/10/59b4ced004cb2_mini.jpg",
 "created_at": "2018-05-17 13:46:21",
 "create_time": "2018-05-17 13:03:48",
 "passtime": "2018-05-17 13:46:21",
 "love": "63",
 "hate": "2",
 "comment": "0",
 "repost": "0",
 "bookmark": "0",
 "bimageuri": "",
 "voiceuri": "",
 "voicetime": "0",
 "voicelength": "0",
 "status": "2",
 "theme_id": "17083",
 "theme_name": "爆笑Gif",
 "theme_type": "1",
 "videouri": "",
 "videotime": "0",
 "original_pid": "0",
 "cache_version": 2,
 "cai": "2",
 "top_cmt": [],
 "weixin_url": "http://c.f.zk111.cn/share/27937503.html?wx.qq.com&appname=",
 "themes": [],
 "image0": "http://wimg.spriteapp.cn/ugc/2018/05/17/5afd0d346f182.gif",
 "image2": "http://wimg.spriteapp.cn/ugc/2018/05/17/5afd0d346f182.gif",
 "image1": "http://wimg.spriteapp.cn/ugc/2018/05/17/5afd0d346f182.gif",
 "cdn_img": "http://wimg.spriteapp.cn/ugc/2018/05/17/5afd0d346f182.gif",
 "is_gif": "1",
 "gifFistFrame": "http://wimg.spriteapp.cn/ugc/2018/05/17/5afd0d346f182_a_1.jpg",
 "width": "218",
 "height": "168",
 "tag": "",
 "t": 1526535981,
 "ding": "63",
 "favourite": "0"
 }
 ]
 }
 
 */
