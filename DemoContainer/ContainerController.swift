//
//  ContainerController.swift
//  DemoContainer
//
//  Created by Nir.vana on 8/22/16.
//  Copyright © 2016 Nir.vana. All rights reserved.
//

import UIKit

protocol ContainerDelegate {
    func pageIndex(container:ContainerController,index:Int)
}

class ContainerController: UIPageViewController {
    
    var containerDelegate:ContainerDelegate?
    var pages = 1
    private var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func initview(){
        self.dataSource = self
        self.delegate = self
        let contentController = self.controllerAtIndex(0)
        let controllers = [contentController]
        self.setViewControllers(controllers, direction: .Forward, animated: true) { (isOk) in
            print("setViewControllers \(isOk)")
        }
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.brownColor()
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ContainerController:UIPageViewControllerDataSource{
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentController).pageIndex
        print("viewControllerAfterViewController \(index)")

        currentIndex = index
        containerDelegate?.pageIndex(self, index: self.currentIndex)
        if index == NSNotFound{
            return nil
        }
        index = index + 1
        if index == self.pages{
            return nil
        }

        return self.controllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentController).pageIndex
        print("viewControllerBeforeViewController \(index)")

        currentIndex = index
        containerDelegate?.pageIndex(self, index: self.currentIndex)
        if index == 0 || index == NSNotFound{
            return nil
        }
        index = index - 1
        return  self.controllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pages
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    private func controllerAtIndex(index:Int) -> UIViewController{
        let board = UIStoryboard(name: "Main", bundle: nil)
        let controller = board.instantiateViewControllerWithIdentifier("ContentController") as! ContentController
        controller.pageIndex = index
        return controller
    }
}

extension ContainerController:UIPageViewControllerDelegate{
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("didFinishAnimating \(completed) ")
//        containerDelegate?.pageIndex(self, index: self.currentIndex)
    }
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        print("willTransitionToViewControllers \\")
    }
}
