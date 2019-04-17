//
//  ViewController.swift
//  Dictionary
//
//  Created by brq on 24/10/2018.
//  Copyright © 2018 brq. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    let contacts = ["Carlos", "João", "José", "Maria"]
    var dict = [String:[String]]()
    var tableview = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dictionary"
        view.backgroundColor = .white
        uiSetup()
        dict = configureDictionary() as! [String : [String]]
        constrains()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = CustomTableViewController()
        tableview.dataSource = self
        tableview.backgroundColor = .white
    }
    func uiSetup(){
        view.addSubview(tableview)
        
    }
    func constrains(){
    tableview.anchor(top: (view.topAnchor, 0),
                     left: (view.leftAnchor, 0),
                     right: (view.rightAnchor , 0),
                     bottom: (view.bottomAnchor, 0))
        
    }
    
    
    func configureDictionary()-> Dictionary<String, Any>{
        for contact in contacts{
            let key = String(contact.prefix(1))
            if var contacsValues = dict[key]{
                contacsValues.append(contact)
                print(dict[key])
                print(contacsValues)
                dict[key] = contacsValues
            }else{
                dict[key] = [contact]
            }
        }
        return dict
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return "Teste"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        return cell!
    }
}
