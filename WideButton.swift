//
//  WideButton.swift
//  AmaClone
//
//  Created by Colby Gatte on 11/4/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit

// self.sendActions(for: .touchUpInside)

class WideButton: UIButton {

    @IBOutlet weak var buttonImageView: UIImageView!
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet var view: UIView!
    
    
    @IBAction func touch(_ sender: Any) {
        
        let me = sender as! UIControl
        
        self.sendActions(for: .touchUpInside)
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        Bundle.main.loadNibNamed("WideButton", owner: self, options: [:])
        
        // we want it to fit perfectly into it's parent view
        // while making sure you don't change it's x & y position
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: view.frame.size.width, height: view.frame.size.height)
        
        
        self.addSubview(self.view)
        
        
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("WideButton", owner: self, options: [:])
        
        // Make sure it's parent view is the same size
        // while making sure you don't change it's x & y position
        self.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: view.frame.size.width, height: view.frame.size.height)
        
        self.addSubview(self.view)
        
    }
    

    
}
