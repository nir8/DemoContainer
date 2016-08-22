//
//  ContentController.swift
//  DemoContainer
//
//  Created by Nir.vana on 8/22/16.
//  Copyright © 2016 Nir.vana. All rights reserved.
//

import UIKit

class ContentController: UIViewController {
    //当前页索引
    var pageIndex = 0
    @IBOutlet weak var labContent: UILabel!
    @IBOutlet weak var btnContent: UIButton!
    @IBAction func btnClick(sender: AnyObject) {
        print("content clicked")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("viewDidLoad index is \(pageIndex)")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear index is \(pageIndex)")
        labContent.text = "My page number is \(pageIndex)"
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("viewWillDisappear index is \(pageIndex)")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
