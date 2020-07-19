//
//  TimeLineViewController.swift
//  docomo
//
//  Created by 萩　山登 on 2019/09/22.
//  Copyright © 2019 萩　山登. All rights reserved.
//

import UIKit
import Firebase

class TimeLineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var cellNumber = Int()
    
    var displayName = String()

    @IBOutlet weak var tableView: UITableView!
    
    let refleshControl = UIRefreshControl()
    
    var username_Array = [String]()
    
    var posts = [Post]()
    var posst = Post()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        refleshControl.attributedTitle = NSAttributedString(string: "引っ張って更新")
        refleshControl.addTarget(self, action: #selector(reflesh), for: .valueChanged)
        
        tableView.addSubview(refleshControl)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //データを取得
        fetchPost()
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let useNameLabel = cell.viewWithTag(1) as! UILabel
        useNameLabel.text = self.posts[indexPath.row].username
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    @objc func reflesh() {
        //更新された時
        fetchPost()
        tableView.reloadData()
        
    }
    func fetchPost() {
        self.posts = [Post]()
        self.username_Array = [String]()
        self.posst = Post()
        
        let ref = Database.database().reference()
        ref.child("group").observeSingleEvent(of: .value) { (snap,error) in
            
            let postwSnap = snap.value as? [String:NSDictionary]
            
            if postwSnap == nil{
                return
            }
            self.posts = [Post]()
            for(_,group) in postwSnap!{
                self.posst = Post()
                
                if let username = group["name"] as? String,let hikariSelect = group["hikariselect"] as? Bool{
                    
                    self.posst.username = username
                    self.posst.hikariSelect = hikariSelect
//                    self.username_Array.append(self.posst.username)
                }
                self.posts.append(self.posst)
                
            }
            self.tableView.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
           // セルの選択を解除
           tableView.deselectRow(at: indexPath, animated: true)
    
           // 別の画面に遷移
           performSegue(withIdentifier: "toDataView", sender: nil)
        
        cellNumber = Int(indexPath.row)
        
 

        // このメソッドで渡す
        func prepareForSegue(segue: UIStoryboardSegue, sender: Any?) {

          if segue.identifier == "toDataView" {

            let DataView:DataView = segue.destination as! DataView

            // 変数:遷移先ViewController型 = segue.destinationViewController as 遷移先ViewController型
            // segue.destinationViewController は遷移先のViewController
            DataView.sendselect = self.cellNumber

            DataView.sendPost = self.posst
          }

        }
       }
    
    

}
