//
//  ProductViewController.swift
//  AmaClone
//
//  Created by Colby Gatte on 11/3/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = AmaAPI(.product, .get).url()
        
        URLSession.shared.dataTask(with: URL(string: url!)!) { data, response, error in
            // parse json
            
            DispatchQueue.main.async {
                self.textView.text = String(data: data!, encoding: .utf8)
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
