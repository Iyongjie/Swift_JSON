//
//  ObjectMapperViewController.swift
//  JSONDemo
//
//  Created by Telit on 2018/5/18.
//  Copyright © 2018年 iMaBiao. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import Kingfisher

class ObjectMapperViewController: UIViewController {
    
    var objectModel : ObjectMapperModel?
    
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

extension ObjectMapperViewController{
    func loadData(completion: @escaping (() -> ())){
        //         http://api.budejie.com/api/api_open.php?a=list&c=subscribe&category_id=35&page=1
        let url  = URL(string: "http://api.budejie.com/api/api_open.php")
        let params = ["a":"list", "c":"subscribe", "category_id":"35", "page":"1"]
        
        Alamofire.request(url!, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            guard let dict : [String : Any] = response.result.value as? [String: Any] else {
                return
            }
            
            let objectM = Mapper<ObjectMapperModel>().map(JSON: dict)
            self.objectModel = objectM
            
            completion()
        }
    }
}

extension ObjectMapperViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard  let count = objectModel?.list?.count else{
            return 0
        }
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        
        guard let listModel : listModel_Map = self.objectModel?.list?[indexPath.row] else {
            return cell!
        }
        
        cell?.textLabel?.text = listModel.introduction
        cell?.textLabel?.numberOfLines = 0
        let url  = URL(string: listModel.header!)
        
        cell?.imageView?.frame = CGRect(x: 20, y: 10, width: 60, height: 60)
        cell?.imageView?.kf.setImage(with: url!, placeholder: UIImage(named: "Two"), options: nil, progressBlock: nil, completionHandler: { (image , error, cacheType, url ) in
            
            if image != nil{
                cell?.imageView?.image = image
            }
        })
        return cell!
    }
}
extension ObjectMapperViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

