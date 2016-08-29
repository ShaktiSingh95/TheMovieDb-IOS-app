//
//  LeftViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 29/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class rightViewController: UITableViewController {
    
    @IBOutlet var rightTableView: UITableView!
    var viewControllersInStack : [UIViewController]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rightTableView.delegate=self
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        viewControllersInStack = self.navigationController?.viewControllers
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let viewControllerOnTop = viewControllersInStack![(viewControllersInStack?.count)!-1]
        
        if indexPath.row == 0{
            
            if let vc=viewControllerOnTop as? HomeViewController{
                
                vc.closeRight()
                
            }
                
            else{
                let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.homeVc) as! HomeViewController
                
                showViewController(destinationVc, sender: nil)
                
            }
        }
        else if indexPath.row == 1{
            if let vc=viewControllerOnTop as? MovieViewController{
                
                vc.closeRight()
                
            }
            else{
                let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.moviesVc) as! MovieViewController
                showViewController(destinationVc, sender: nil)
                
            }
            
        }
            
        else if indexPath.row == 2{
            
            if let vc=viewControllerOnTop as? TvViewController{
                
                vc.closeRight()
                
            }
            else{
            let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.tvVc) as! TvViewController
            showViewController(destinationVc, sender: nil)
            }
            
        }
        else if indexPath.row == 3{
            
            if let vc=viewControllerOnTop as? CelebsViewController{
                
                vc.closeRight()
                
            }
            else{
                let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.celebsVc) as! CelebsViewController
                showViewController(destinationVc, sender: nil)
            }
            
            
        }
        
    }
    
    
    
}
