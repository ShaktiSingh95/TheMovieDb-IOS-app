//
//  ErrorHandlerViewController.swift
//  TheEntertainmentApp
//
//  Created by Shakti Pratap Singh on 09/08/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class ErrorHandlerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    class func showAlertViewController(alertVcTitle:Constants.alertPopupsOptions.titles,alertVcMessage:Constants.alertPopupsOptions.messages,actions:[UIAlertAction]){
        
        let alertVc = UIAlertController(title: alertVcTitle.rawValue, message: alertVcMessage.rawValue, preferredStyle: .Alert)
        for action in actions{
            
            alertVc.addAction(action)
            
        }

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
