//
//  HandyJSONViewController.swift
//  JSONDemo
//
//  Created by Telit on 2018/5/18.
//  Copyright © 2018年 iMaBiao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class HandyJSONViewController: UIViewController {

    var handyModel = HandyModel()
    
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


extension HandyJSONViewController {
    func loadData(completion: @escaping (() -> ()))  {
        
//         http://api.budejie.com/api/api_open.php?a=newlist&c=data&page=1&type=all&maxtime=
        
        let url  = URL(string: "http://api.budejie.com/api/api_open.php")
        let params = ["a":"newlist", "c":"data", "type":"all", "page":"1"]
        
        Alamofire.request(url!, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
 
            guard let dict : [String : Any] = response.result.value as? [String: Any] else {
                return
            }
            
            if let handyM = HandyModel.deserialize(from: dict) {
                self.handyModel = handyM
            }
            completion()
        }
    }
}

extension HandyJSONViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let list: [list_Handy] = self.handyModel.list else{
            return 0
        }
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        
        guard let listModel : list_Handy = self.handyModel.list?[indexPath.row] else {
            return cell!
        }
        
        cell?.textLabel?.text = listModel.name
        cell?.textLabel?.numberOfLines = 0
        
        guard let url  = URL(string: listModel.profile_image)else {
            return cell!
        }
        
        cell?.imageView?.frame = CGRect(x: 20, y: 10, width: 60, height: 60)
        cell?.imageView?.kf.setImage(with: url, placeholder: UIImage(named: "Two"), options: nil, progressBlock: nil, completionHandler: { (image , error, cacheType, url ) in
            
            if image != nil{
                cell?.imageView?.image = image
            }
        })
        return cell!
    }
}
extension HandyJSONViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
