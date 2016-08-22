//
//  MainController.swift
//  DemoContainer
//
//  Created by Nir.vana on 8/22/16.
//  Copyright © 2016 Nir.vana. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var labMain: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("fuck o ooo  ooo ")
        let controller = segue.destinationViewController as! ContainerController
        //传递参数和代理
        controller.containerDelegate = self
        controller.pages = 3
    }


}

extension MainController:ContainerDelegate{
    //代理返回当前索引
    func pageIndex(container: ContainerController, index: Int) {
        print("current index is \(index)")
        
        self.labMain.text = "current index is \(index)"
    }
}