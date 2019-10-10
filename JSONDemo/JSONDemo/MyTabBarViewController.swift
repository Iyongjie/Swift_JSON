//
//  MyTabBarViewController.swift
//  JSONDemo
//
//  Created by Telit on 2018/5/18.
//  Copyright © 2018年 iMaBiao. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addChildVCandRootVC(navTitle: "initWithDict", tabTitle: "Dict", rootVC: DictViewController(), img: #imageLiteral(resourceName: "One"), img_selected: #imageLiteral(resourceName: "One"))
        addChildVCandRootVC(navTitle: "SwiftyJSON", tabTitle: "Swifty", rootVC: SwiftyJSONViewController(), img: #imageLiteral(resourceName: "Two"), img_selected: #imageLiteral(resourceName: "Two"))
        addChildVCandRootVC(navTitle: "HandyJSON", tabTitle: "Handy", rootVC: HandyJSONViewController(), img: #imageLiteral(resourceName: "Three"), img_selected: #imageLiteral(resourceName: "Three"))
        addChildVCandRootVC(navTitle: "ObjectMapper", tabTitle: "Object", rootVC: ObjectMapperViewController(), img:#imageLiteral(resourceName: "Four"), img_selected: #imageLiteral(resourceName: "Four"))
        addChildVCandRootVC(navTitle: "Codable", tabTitle: "Codable", rootVC: CodableViewController(), img:#imageLiteral(resourceName: "Five"), img_selected: #imageLiteral(resourceName: "Five"))
        
    }

    func addChildVCandRootVC(navTitle:String,tabTitle:String,rootVC:UIViewController,img:UIImage,img_selected:UIImage){
        let rNav = UINavigationController.init(rootViewController: rootVC)
        rootVC.title = navTitle
        rootVC.tabBarItem.image = img
        rootVC.tabBarItem.selectedImage = img_selected
        rootVC.tabBarItem.title = tabTitle
        self.addChildViewController(rNav)
    }
    
    


}
