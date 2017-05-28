//
//  MovieMainViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 29/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import Kingfisher
class MovieMainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate,CustomImageViewDelegate{
    
    @IBOutlet weak var popularMoviesCollectionView: UICollectionView!
    @IBOutlet weak var movieCategoryTableView: UITableView!
    var placeHolderImage = UIImage(named:Constants.imageIdentifiers.placeHolderImage)
    let customView=CustomImageView()
    var defaults = UserDefaults.standard
    fileprivate var tableContent = ["Upcoming","Top Rated","Most Popular"]
    var popularMovies = [Movie](){
    
        didSet{
            
            popularMoviesCollectionView.reloadData()
            
        }
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.closeRight()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        popularMoviesCollectionView.dataSource = self
        popularMoviesCollectionView.delegate = self
        movieCategoryTableView.dataSource=self
        movieCategoryTableView.delegate=self
        customView.delegate=self
        AppModel.fetchPerticularMovies(Constants.ApiSearchQueries.MovieRelated.popularMovies){
            
            movies in
            self.popularMovies = movies
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func invertLike() {
        
       // defaults.setBool(true, forKey: )
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifiers.movieMainCollectionCell, for: indexPath) as! CollectionViewCell
        if let posterImageLink =  popularMovies[indexPath.row].posterImagePath{
            
            cell.customImageView.backgroundImageView.kf_setImageWithURL(URL(string:posterImageLink), placeholderImage: placeHolderImage)
            
        }
        cell.customImageView.likeImageView.image=UIImage(named: Constants.imageIdentifiers.toBeLiked)
        
        if let averageVote = popularMovies[indexPath.row].averageVote{
            
            cell.customImageView.popularityLabel.text="\(averageVote)"+"%"
            
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("qqqqq")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifiers.movieMainTableCell)!
        cell.textLabel?.text = tableContent[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        let destinationVc = self.storyboard?.instantiateViewController(withIdentifier: Constants.viewControllerIdentifiers.requestedMoviesVc) as! RequestedMovieListViewController
        switch row{
            
        case 0 : destinationVc.query = Constants.ApiSearchQueries.MovieRelated.upcomingMovies
        case 1:
            destinationVc.query = Constants.ApiSearchQueries.MovieRelated.topRatedMovies
        case 2:
            destinationVc.query = Constants.ApiSearchQueries.MovieRelated.popularMovies
        default: break
            
            
        }
        self.show(destinationVc, sender: nil)
        
    }
    
    
}
