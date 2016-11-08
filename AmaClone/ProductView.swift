//
//  ProductView.swift
//  AmaClone
//
//  Created by Colby Gatte on 11/7/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit

class ProductView: UIView {
    
    @IBOutlet var productTitleLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var productQuantityLabel: UILabel!
    @IBOutlet var addToShoppingCartButton: WideButton!
    @IBOutlet var descriptionText: UITextView!
    @IBOutlet var productImagesView: UIView!
    
    @IBOutlet var view: UIView!
    @IBOutlet var subView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    
    
    @IBAction func productQuantityStepper(_ sender: Any) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        Bundle.main.loadNibNamed("ProductView", owner: self, options: nil)
        
        self.scrollView.contentSize = self.view.frame.size

        self.addSubview(self.scrollView)
    }
    
}

