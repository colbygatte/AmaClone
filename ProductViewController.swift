//
//  ProductViewController.swift
//  AmaClone
//
//  Created by Colby Gatte on 11/4/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit


class ProductViewController: UIViewController {

    //@IBOutlet var productView: UIView!
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var addToShoppingCartButton: WideButton!
    
    var productImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        productImage = UIImage(named: "RangeRover.jpg")
        productImageView.image = productImage
        productImageView.contentMode = UIViewContentMode.scaleAspectFit
        
        
        
        // XIB
        addToShoppingCartButton.buttonLabel.text = "Add to shopping cart"
        let shoppingCartImage = UIImage(named: "shopping_cart.png")
        addToShoppingCartButton.buttonImageView.image = shoppingCartImage
        addToShoppingCartButton.view.backgroundColor = UIColor.lightGray
        
        
        
    }


    @IBAction func touched() {
        addToShoppingCartButton.view.backgroundColor = UIColor.lightGray
        addToShoppingCartButton.buttonLabel.textColor = UIColor.black
    }
    
    @IBAction func changeColor() {
        addToShoppingCartButton.view.backgroundColor = UIColor.blue
        addToShoppingCartButton.buttonLabel.textColor = UIColor.white
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
