//
//  HomeViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 26/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import Kingfisher
class HomeMainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var popularMoviesCollectionView: UICollectionView!
    
    @IBOutlet weak var popularTvShowsCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCelebsCollectionView: UICollectionView!
    
    var popularMovies = [Movie](){
    
        didSet{
            
            self.popularMoviesCollectionView.reloadData()
            
        }
    
    }
    var popularTvShows = [Tv](){
        
        didSet{
            
            self.popularTvShowsCollectionView.reloadData()
            
        }
        
    }
    var popularCelebs = [Celeb](){
        
        didSet{
     
            self.popularCelebsCollectionView.reloadData()
            
        }
        
    }
    
    var placeHolderImage = UIImage(named:Constants.imageIdentifiers.placeHolderImage)
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.closeRight()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCelebsCollectionView.dataSource = self
        popularMoviesCollectionView.dataSource = self
        popularTvShowsCollectionView.dataSource = self
        popularTvShowsCollectionView.delegate = self
        popularMoviesCollectionView.delegate = self
        popularCelebsCollectionView.delegate = self
        
        AppModel.fetchPerticularCelebs(Constants.ApiSearchQueries.CelebsRelated.popular){
            
            celebs in
            self.popularCelebs = celebs
            
        }
        AppModel.fetchPerticularMovies(Constants.ApiSearchQueries.MovieRelated.popularMovies){
            
            movies in
            self.popularMovies = movies
            
        }
        AppModel.fetchPerticularTvShows(Constants.ApiSearchQueries.TvRelated.popular){
            
            tvShows in
            self.popularTvShows = tvShows
            
        }
        
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
                if collectionView == popularCelebsCollectionView{
        
                    return popularCelebs.count
        
                }
                else if collectionView == popularMoviesCollectionView{
        
                    return popularMovies.count
        
                }
                else {
        
                    return popularTvShows.count
        
                }
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if collectionView == popularCelebsCollectionView{
            
            let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.celebDetailsVc) as! CelebdetailViewController
            destinationVc.celeb = self.popularCelebs[indexPath.row]
            showViewController(destinationVc, sender: nil)
            
        }
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if collectionView == popularCelebsCollectionView{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.cellIdentifiers.homePopularCelebsCell, forIndexPath: indexPath) as! CollectionViewCell
            //cell.imageView.kf_setImageWithURL(NSURL(string: popularCelebs[indexPath.row].profileImagePath!), placeholderImage: placeHolderImage)
            if let posterImageLink = popularCelebs[indexPath.row].profileImagePath{
                
                cell.customImageView.backgroundImageView.kf_setImageWithURL(NSURL(string: posterImageLink), placeholderImage: placeHolderImage)
            
            }
            if let name = popularCelebs[indexPath.row].name{
                
            cell.customImageView.popularityLabel.text=name
                
            }
            cell.customImageView.likeImageView.image=UIImage(named: Constants.imageIdentifiers.toBeLiked)
           cell.customImageView.id=popularCelebs[indexPath.row].id
            cell.customImageView.delegate=self
            return cell
            
        }
        else if collectionView == popularMoviesCollectionView{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.cellIdentifiers.homePopularMovieCell, forIndexPath: indexPath) as! CollectionViewCell
            
            if let posterImageLink =  popularMovies[indexPath.row].posterImagePath{
                
                cell.customImageView.backgroundImageView.kf_setImageWithURL(NSURL(string:posterImageLink), placeholderImage: placeHolderImage)
            
            }
            cell.customImageView.likeImageView.image=UIImage(named: Constants.imageIdentifiers.toBeLiked)

            if let averageVote = popularMovies[indexPath.row].averageVote{
                
                cell.customImageView.popularityLabel.text="\(averageVote)"+"%"
                
            }
cell.customImageView.id=popularMovies[indexPath.row].id
            return cell
            
        }
        else{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.cellIdentifiers.homePopularTvCell, forIndexPath: indexPath) as! CollectionViewCell
            if let posterImageLink = popularTvShows[indexPath.row].posterImagePath{
            
            cell.customImageView.backgroundImageView.kf_setImageWithURL(NSURL(string: posterImageLink), placeholderImage: placeHolderImage)
                
            }
            cell.customImageView.likeImageView.image=UIImage(named: Constants.imageIdentifiers.toBeLiked)

            if let averageVote = popularTvShows[indexPath.row].averageVote{
                
                cell.customImageView.popularityLabel.text="\(averageVote)"+"%"
                
            }
cell.customImageView.id=popularTvShows[indexPath.row].id
            // cell.customImageView.popularityLabel.text="\(popularTvShows[indexPath.row].averageVote!)"+"/10"

            return cell
            
        }
        
    }
    
}
