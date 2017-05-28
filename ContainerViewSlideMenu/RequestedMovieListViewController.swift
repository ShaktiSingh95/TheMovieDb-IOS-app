//
//  RequestedMovieListViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 31/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class RequestedMovieListViewController: UITableViewController,CustomImageViewDelegate {
    func saveDataForId(_ id: Int) {
        
    }

    func deleteDataForId(_ id:Int)
    {
        
    }
    var query : Constants.ApiSearchQueries.MovieRelated!
    @IBOutlet var movieListTableView: UITableView!
    var moviesFetched = [Movie](){
        
        
        didSet{
            
            self.movieListTableView.reloadData()
            
        }
    }
    let customView=CustomImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieListTableView.dataSource = self
        self.movieListTableView.delegate = self
        AppModel.fetchPerticularMovies(query){
            
            movies in
            self.moviesFetched = movies
            
        }
        
        customView.delegate=self
    }
    func invertLike() {
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesFetched.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifiers.requestedListMovieCell) as! RequestedTypeTableViewCell
        cell.customImageView.backgroundImageView.kf.setImage(with: URL(string: moviesFetched[indexPath.row].posterImagePath!), placeholder: UIImage(named: Constants.imageIdentifiers.placeHolderImage))
        cell.cellInfo.text = moviesFetched[indexPath.row].overview
        cell.cellInfo.numberOfLines = 6
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
