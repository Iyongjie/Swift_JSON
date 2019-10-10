//
//  SwiftyJSONViewController.swift
//  JSONDemo
//
//  Created by Telit on 2018/5/18.
//  Copyright © 2018年 iMaBiao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyJSON

class SwiftyJSONViewController: UIViewController {

    var swiftyModel: SwiftyModel?
    
    
    lazy var tableView : UITableView = {
        let view = UITableView()
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData {
            self.tableView.reloadData()
        }
    }

}

extension SwiftyJSONViewController{
     func loadData(completion: @escaping (() -> ())){
//         http://api.budejie.com/api/api_open.php?a=list&c=subscribe&category_id=35&page=1
        let url  = URL(string: "http://api.budejie.com/api/api_open.php")
        let params = ["a":"list", "c":"subscribe", "category_id":"35", "page":"1"]
        
        Alamofire.request(url!, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            let json = JSON(response.result.value!)
            let model = SwiftyModel(json)
            self.swiftyModel = model
            
//            guard let array = json["list"].array else{
//                return
//            }
//            
//            var listArray :[listM] = [listM]()
//            
//            for dic in model.list! {
//                listArray.append(dic)
//            }
            
            completion()
        }
    }
}

extension SwiftyJSONViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard  let count = swiftyModel?.list?.count else{
            return 0
        }
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        
        guard let listModel : listM = self.swiftyModel?.list?[indexPath.row] else {
            return cell!
        }
        
        cell?.textLabel?.text = listModel.introduction
        cell?.textLabel?.numberOfLines = 0
        let url  = URL(string: listModel.header!)
        
        cell?.imageView?.frame = CGRect(x: 20, y: 10, width: 60, height: 60)
        cell?.imageView?.kf.setImage(with: url ?? nil, placeholder: UIImage(named: "Two"), options: nil, progressBlock: nil, completionHandler: { (image , error, cacheType, url ) in
            
            if image != nil{
                cell?.imageView?.image = image
            }
        })
        return cell!
    }
}
extension SwiftyJSONViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
