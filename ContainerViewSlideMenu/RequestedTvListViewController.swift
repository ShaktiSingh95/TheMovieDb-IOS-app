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
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvFetched.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifiers.requestedListTvCell) as! RequestedTypeTableViewCell
        cell.customImageView.backgroundImageView.kf.setImage(with: URL(string: tvFetched[indexPath.row].posterImagePath!), placeholder: UIImage(named: Constants.imageIdentifiers.placeHolderImage))
        cell.cellInfo.text = tvFetched[indexPath.row].overView
        cell.customImageView.likeImageView.image=UIImage(named: Constants.imageIdentifiers.toBeLiked)
        cell.cellInfo.numberOfLines = 6
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //further code
    }
    
}
