//
//  ProductViewController.swift
//  AmaClone
//
//  Created by Colby Gatte on 11/4/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit


class ProductViewController: UIViewController {

    @IBOutlet var productImageView: UIImageView!
    
    // XIB
    @IBOutlet var addToShoppingCartButton: WideButton!
    
    var productImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImage = UIImage(named: "RangeRover.jpg")
        productImageView.image = productImage
        
        
        // XIB
        let shoppingCartImage = UIImage(named: "shopping_cart.png")
        
        addToShoppingCartButton.buttonImageView.image = shoppingCartImage
        addToShoppingCartButton.buttonLabel.text = "Add to shopping cart"
        addToShoppingCartButton.view.backgroundColor = UIColor.lightGray
        
        
    }

    @IBAction func touched() {
        print ("pressed bitch")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
