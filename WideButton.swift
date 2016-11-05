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
    
    
    func setup() {
        Bundle.main.loadNibNamed("WideButton", owner: self, options: [:])
        
        // delete the default text
        self.titleLabel?.text = ""
        
        // let it be equal to it's parent
        self.view.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
        self.addSubview(self.view)
    }
    
    @IBAction func touchUpInside() {
        self.sendActions(for: .touchUpInside)
    }

    @IBAction func touchDown() {
        self.sendActions(for: .touchDown)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    
}
