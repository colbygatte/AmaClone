//
//  ProductViewController.swift
//  AmaClone
//
//  Created by Colby Gatte on 11/3/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    var products: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = AmaAPI(.product, .get).asUrl()!
        
        products = []
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let jsonProducts = JSON(data: data!)
            
            for product in jsonProducts {
                let pObj = Product(withJSONObject: product.1)
                self.products.append(pObj)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell")!
        cell.textLabel?.text = products[indexPath.row].title
        cell.detailTextLabel?.text = products[indexPath.row].description_p
        return cell
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
}
