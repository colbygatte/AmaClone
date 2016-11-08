//
//  ImageTemplateViewController.swift
//  AmaClone
//
//  Created by Colby Gatte on 11/6/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit

class ImageTemplateViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var setLabelText: String!
    var setImageViewImage: UIImage!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.label.text = self.setLabelText
        
        self.imageView.image = self.setImageViewImage
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
