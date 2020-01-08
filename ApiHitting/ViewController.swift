//
//  ViewController.swift
//  ApiHitting
//
//  Created by deltaschool on 07/12/19.
//  Copyright © 2019 deltaschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var list = [user]()

    @IBOutlet weak var TableViewMain: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        data()
        var nib = UINib(nibName: "FirstNib", bundle: nil)
        TableViewMain.register(nib, forCellReuseIdentifier:"FirstNib")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "FirstNib", for: indexPath) as? FirstNib
    cell?.Name.text = list[indexPath.row].name
        cell?.Email.text = list[indexPath.row].email
        
        return cell!
    }
    


    func data(){
        let url = "https://jsonplaceholder.typicode.com/users"
        let urlString = URL(string: url)
        let request = URLRequest(url: urlString!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        let task = URLSession.shared.dataTask(with: request) { (data :Data?, response :URLResponse?, error : Error?) in
            guard let dataIs = data
                else{
                    return
            }
        
   
            let obj = try? JSONSerialization.jsonObject(with:dataIs , options: JSONSerialization.ReadingOptions.mutableContainers)
            guard let json = obj as? [[String:Any]]
            else{
                return
            }
            print(json)
            for i in json{
                if let user = user(dict: i)
                {
                    self.list.append(user)
                   
                }
                print(self.list)
                // self.list = temlist
                DispatchQueue.main.async {
                    self.TableViewMain.reloadData()
                }
            }
          
            
    }
        task.resume()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        sc?.array2 = [list[indexPath.row]]
        self.navigationController?.pushViewController(sc!, animated: true)
    }
}

