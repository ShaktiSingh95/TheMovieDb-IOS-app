//
//  RequestedCelebsViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 01/08/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class RequestedCelebsViewController: UITableViewController {
    var query: Constants.ApiSearchQueries.CelebsRelated!
    @IBOutlet var celebsList: UITableView!
    var celebsFetched = [Celeb](){
        
        didSet{
            
            self.celebsList.reloadData()
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.celebsList.dataSource = self
        self.celebsList.delegate = self
        AppModel.fetchPerticularCelebs(query){
            
            celebs in
            self.celebsFetched = celebs
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celebsFetched.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.cellIdentifiers.requestedListCelebsCell) as! RequestedTypeTableViewCell
        var moviesDone:String
        moviesDone = celebsFetched[indexPath.row].knownFor[0].title! + "," + celebsFetched[indexPath.row].knownFor[1].title! + "," + celebsFetched[indexPath.row].knownFor[2].title!
        cell.customImageView.backgroundImageView.kf_setImageWithURL(NSURL(string: celebsFetched[indexPath.row].profileImagePath!), placeholderImage: UIImage(named: Constants.imageIdentifiers.placeHolderImage))
       // print(celebsFetched[indexPath.row].popularity!)
        cell.cellInfo.text = celebsFetched[indexPath.row].name! + "\nPopular Movies:\n" + moviesDone
        cell.cellInfo.numberOfLines = 6
//+ celebsFetched[indexPath.row].popularity!
        
        return cell
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.celebDetailsVc) as! CelebdetailViewController
        destinationVc.celeb = self.celebsFetched[indexPath.row]
        showViewController(destinationVc, sender: nil)
    }
    
}
