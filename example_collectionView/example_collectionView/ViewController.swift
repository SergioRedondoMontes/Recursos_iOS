//
//  ViewController.swift
//  example_collectionView
//
//  Created by Sergio Redondo on 25/04/2020.
//  Copyright © 2020 NBTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet var table: UITableView!
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        models.append(Model(text: "Uno", imageName: "image_1"))
        models.append(Model(text: "Dos ", imageName: "image_2"))
        models.append(Model(text: "Tres", imageName: "image_3"))
        models.append(Model(text: "Cuatro", imageName: "image_4"))
        models.append(Model(text: "Uno", imageName: "image_1"))
        models.append(Model(text: "Dos ", imageName: "image_2"))
        models.append(Model(text: "Tres", imageName: "image_3"))
        models.append(Model(text: "Cuatro", imageName: "image_4"))
        models.append(Model(text: "Uno", imageName: "image_1"))
        models.append(Model(text: "Dos ", imageName: "image_2"))
        models.append(Model(text: "Tres", imageName: "image_3"))
        models.append(Model(text: "Cuatro", imageName: "image_4"))
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }

}

struct Model {
    let text: String
    let imageName: String
    
    init(text:String, imageName:String) {
        self.text = text
        self.imageName = imageName
    }
}
