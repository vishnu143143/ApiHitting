//
//  SecondViewController.swift
//  ApiHitting
//
//  Created by deltaschool on 11/12/19.
//  Copyright © 2019 deltaschool. All rights reserved.
//

import UIKit

enum Section :Int ,CaseIterable{
    case nameText
    case emailText
    case addressText
}

class SecondViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
     var array2 = [user]()
    @IBOutlet weak var TableViewMain: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if let sec = Section(rawValue: section)
      {
        switch sec {
        case  .nameText :
            return 1
        case .emailText:
            return 1
        case .addressText:
            return 1
        }
    }
return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: "FirstNib", for: indexPath) as? FirstNib
////        cell?.Name.text = array2[indexPath.row].address.city
////        cell?.Email.text = array2[indexPath.row].email
//
//        return cell!
        var cell = tableView.dequeueReusableCell(withIdentifier: "SecondNib", for: indexPath) as? SecondNib
        if let  sec = Section(rawValue: indexPath.section)
        {
            switch sec {
            case  .nameText :
                cell?.secondText.text = array2[indexPath.row].name
            case .emailText:
             cell?.secondText.text = array2[indexPath.row].email
            case .addressText:
                   cell?.secondText.text = array2[indexPath.row].address.city
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if let sectiontype = Section(rawValue: section){
            switch sectiontype{
            case .nameText:
                return "name"
            case .emailText:
                return "email"
            case .addressText:
                return "Adress"
          
            }
        }
        return ""
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate =  self
        tableView.dataSource = self
//        var obj = ViewController()
//        array2 = obj.list
        var nib = UINib(nibName: "FirstNib", bundle: nil)
        TableViewMain.register(nib, forCellReuseIdentifier:"FirstNib")
        
        var nib2 = UINib(nibName: "SecondNib", bundle: nil)
        TableViewMain.register(nib2, forCellReuseIdentifier:"SecondNib")

    }
    

    
}
