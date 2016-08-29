//
//  RequestedTvListViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 01/08/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class RequestedTvListViewController: UITableViewController {
    
    var query: Constants.ApiSearchQueries.TvRelated!
    @IBOutlet var tvTableView: UITableView!
    var tvFetched = [Tv](){
        
        didSet{
            
            self.tvTableView.reloadData()
            
        }
        
    }
    @IBOutlet var tvList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tvList.dataSource = self
        self.tvList.delegate = self
        AppModel.fetchPerticularTvShows(query){
            
            tvShows in
            self.tvFetched = tvShows
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvFetched.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.cellIdentifiers.requestedListTvCell) as! RequestedTypeTableViewCell
        cell.customImageView.backgroundImageView.kf_setImageWithURL(NSURL(string: tvFetched[indexPath.row].posterImagePath!), placeholderImage: UIImage(named: Constants.imageIdentifiers.placeHolderImage))
        cell.cellInfo.text = tvFetched[indexPath.row].overView
        cell.customImageView.likeImageView.image=UIImage(named: Constants.imageIdentifiers.toBeLiked)
        cell.cellInfo.numberOfLines = 6
        return cell
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //further code
    }
    
}
