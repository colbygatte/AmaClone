//
//  TestViewController.swift
//  AmaClone
//
//  Created by Colby Gatte on 11/6/16.
//  Copyright © 2016 colbyg. All rights reserved.
//
// Template for the ImageTemplateViewController
import UIKit

class TestViewController: UIViewController, UIPageViewControllerDataSource {

    @IBOutlet weak var imagesView: UIView!
    
    var PVC: UIPageViewController!
    var images: [ImageTemplateViewController]!
    var imagesIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagesIndex = 0
        self.PVC = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
        self.PVC.dataSource = self
        self.PVC.view.frame = CGRect(x: 0, y: 0, width: self.imagesView.frame.size.width, height: self.imagesView.frame.size.height)
        
        
        let imgTemp1 = self.storyboard?.instantiateViewController(withIdentifier: "ImageTemplateViewController") as! ImageTemplateViewController
        imgTemp1.setLabelText = "garblage"
        imgTemp1.setImageViewImage = UIImage(named: "RangeRover.jpg")
        imgTemp1.index = 1
        
        
        let imgTemp2 = self.storyboard?.instantiateViewController(withIdentifier: "ImageTemplateViewController") as! ImageTemplateViewController
        imgTemp2.setLabelText = "goop poop"
        imgTemp2.setImageViewImage = UIImage(named: "shopping_cart.png")
        imgTemp2.index = 0
        
        let imgTemp3 = self.storyboard?.instantiateViewController(withIdentifier: "ImageTemplateViewController") as! ImageTemplateViewController
        imgTemp3.setLabelText = "third turd"
        imgTemp3.setImageViewImage = UIImage(named: "shopping_cart.png")
        imgTemp3.index = 2
        
        
        self.images = [imgTemp2, imgTemp1, imgTemp3]
        
        let VCs = [imgTemp2]
        self.PVC.setViewControllers(VCs, direction: .forward, animated: true, completion: nil)
        
        self.addChildViewController(self.PVC)
        self.imagesView.addSubview(self.PVC.view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let VC = viewController as! ImageTemplateViewController
        if (VC.index + 1) < self.images.count {
            imagesIndex += 1
            
            return images[imagesIndex]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let VC = viewController as! ImageTemplateViewController
        if VC.index > 0 {
            imagesIndex -= 1
            
            return images[imagesIndex]
        } else {
            return nil
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return images.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

}

