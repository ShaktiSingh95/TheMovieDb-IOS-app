//
//  PerticularCelebViewController.swift
//  TheEntertainmentApp
//
//  Created by Shakti Pratap Singh on 07/08/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import Kingfisher
class PerticularCelebViewController: UIViewController {
    
    var celebToBeDisplayed: Celeb!
    override func viewDidLoad() {
        super.viewDidLoad()
       // ImageDownloader.downloadImageWithURL(NSURL(string: celebToBeDisplayed.profileImagePath!)!,progressBlock: nil,completionHandler: self)
        //        self.view.backgroundColor = UIColor(patternImage : Image)
        // Do any additional setup after loading the view.
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
