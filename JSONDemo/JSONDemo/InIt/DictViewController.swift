//
//  DictViewController.swift
//  JSONDemo
//
//  Created by Telit on 2018/5/18.
//  Copyright © 2018年 iMaBiao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
class DictViewController: UIViewController {

    var dictModel: DictModel?
    
    
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
        
        loadData { (model) in
            self.dictModel = model
            self.tableView.reloadData()
        }
    }
}

extension DictViewController {
    func loadData(completion: @escaping (_ dictM : DictModel) ->() )  {
        let url  = URL(string: "http://api.budejie.com/api/api_open.php")
        let params = ["a":"square", "c":"topic"]
        
        Alamofire.request(url!, method: HTTPMethod.get, parameters: params, encoding: URLEncoding.default , headers: nil).responseJSON { (response) in
            
            switch response.result{
    
            case .success(_):
                
                guard let result = response.result.value else {
                    return
                }
                
                guard let dict = result as? [String : Any] else{
                    return
                }

                let dictModel = DictModel(dict: dict)
                completion(dictModel)
                
            case let .failure(error):
                print(error)
                break
            }
            
        }
    }
}

extension DictViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        guard let  count = dictModel?.tag_list?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard  let count = dictModel?.square_list?.count else{
            return 0
        }
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        
        guard let squareM = dictModel?.square_list![indexPath.row] else {
            return cell!
        }
        
        cell?.textLabel?.text = squareM.name

        let url = URL(string: squareM.icon!)

        //        cell?.imageView?.kf.setImage(with: url)
        cell?.imageView?.kf.setImage(with: url, placeholder: UIImage(named: "One"), options: nil, progressBlock: nil) { (image, error, type, url) in
            if image != nil{
                cell?.imageView?.image = image
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view  = UILabel()
        
        guard let tag = dictModel?.tag_list![section] else {
            return view
        }
        view.text = tag.theme_name
        view.backgroundColor = UIColor.orange
        return view
        
    }
    
}
extension DictViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}




