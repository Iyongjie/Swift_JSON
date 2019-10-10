//
//  CodableViewController.swift
//  JSONDemo
//
//  Created by Telit on 2018/5/18.
//  Copyright © 2018年 iMaBiao. All rights reserved.
//

import UIKit
import Alamofire

class CodableViewController: UIViewController {

    
    var codableModel : CodableModel?
    
    
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

extension CodableViewController {
    
//    http://api.budejie.com/api/api_open.php?a=category&c=subscribe
    
    func loadData ( completion: @escaping (() -> ()))  {
        let url  = URL(string: "http://api.budejie.com/api/api_open.php")
        let params = ["a" : "category", "c" : "subscribe"]
        
        Alamofire.request(url!, method: .get, parameters: params , encoding: URLEncoding.default, headers: nil).responseData { (data) in
            
//            do{
                self.codableModel = try! JSONDecoder().decode(CodableModel.self, from: data.result.value!)
//            }catch {
//                //异常处理
//            }
            
            completion()
        }
    }
}

extension CodableViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard  let count = codableModel?.list.count else{
            return 0
        }
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        
        guard let codModel = codableModel?.list[indexPath.row] else {
            return cell!
        }
        
        cell?.textLabel?.text = codModel.name
        let l = UILabel()
        l.text = "id = \(codModel.id)" + "---" +  "count = \(codModel.count)"
        l.textColor = UIColor.orange
        l.frame = CGRect(x: 150, y: 20, width: 200, height: 20)
        cell?.contentView.addSubview(l)
        
        print(codModel.count)
        return cell!
    }
}
extension CodableViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}

