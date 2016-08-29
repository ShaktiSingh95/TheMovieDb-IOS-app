//
//  AppViewController.swift
//
//
//  Created by Shakti Pratap Singh on 26/07/16.
//
//

import UIKit
import SlideMenuControllerSwift
class HomeViewController: SlideMenuController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addRightBarButtonWithImage(UIImage(named: Constants.imageIdentifiers.rightOptionMenuButtonImage)!)
    }
    override func awakeFromNib(){
        
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.homeMainVc) {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.rightSliderVc) {
            self.rightViewController = controller
        }
        super.awakeFromNib()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}
