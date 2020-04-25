//
//  ViewController.swift
//  example_TableView
//
//  Created by Sergio Redondo on 25/04/2020.
//  Copyright © 2020 NBTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var tableView:UITableView!
    let myData = ["uno", "dos", "tres" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TVCDemo", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TVCDemo")
        tableView.delegate = self
        tableView.dataSource = self
    }

    //TableView funcs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCDemo", for: indexPath) as! TVCDemo
        cell.lblTitle?.text = myData[indexPath.row]
        cell.img?.backgroundColor = .green
        return cell
    }
}

