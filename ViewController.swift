//
//  ViewController.swift
//  AmaClone
//
//  Created by Colby Gatte on 11/5/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    var pageViewController: UIPageViewController!
    var pageTitles: [String]!
    var pageImages: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageTitles = ["Explore", "Today Widget"]
        self.pageImages = ["shopping_cart.png", "RangeRover.jpg"]
        
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(index: 0)
        let viewControllers = [startVC]
        
        self.pageViewController.setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: self.view.frame.size.height - 60)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func restartAction(_ sender: Any) {
        var startVC = self.viewControllerAtIndex(index: 0) as ContentViewController
        var viewControllers = [startVC]
        self.pageViewController.setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
    }
    
    
    func viewControllerAtIndex(index: Int) -> ContentViewController {
        if(self.pageTitles.count == 0) || (index >= self.pageTitles.count) {
            return ContentViewController()
        }
        
        let vc: ContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        vc.imageFile = self.pageImages[index] 
        vc.titleText = self.pageTitles[index] 
        vc.pageIndex = index
        
        return vc
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        
        var index = vc.pageIndex as Int
        
        if(index == 0 || index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        if(index == NSNotFound) {
            return nil
        }
        
        index += 1
        
        if(index == self.pageTitles.count) {
            return nil
        }
        
        return self.viewControllerAtIndex(index: index)
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    

}
