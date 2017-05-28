//
//  HomeViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 26/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import Kingfisher
class HomeMainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,CustomImageViewDelegate {
    func saveDataForId(_ id:Int){
        
    }
    func deleteDataForId(_ id:Int){
        
    }
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
    override func viewWillAppear(_ animated: Bool) {
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == popularCelebsCollectionView{
            
            let destinationVc = self.storyboard?.instantiateViewController(withIdentifier: Constants.viewControllerIdentifiers.celebDetailsVc) as! CelebdetailViewController
            destinationVc.celeb = self.popularCelebs[indexPath.row]
            show(destinationVc, sender: nil)
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == popularCelebsCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifiers.homePopularCelebsCell, for: indexPath) as! CollectionViewCell
            //cell.imageView.kf_setImageWithURL(NSURL(string: popularCelebs[indexPath.row].profileImagePath!), placeholderImage: placeHolderImage)
            if let posterImageLink = popularCelebs[indexPath.row].profileImagePath{
                cell.customImageView.backgroundImageView.kf.setImage(with: URL(string: posterImageLink), placeholder: placeHolderImage)
            
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
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifiers.homePopularMovieCell, for: indexPath) as! CollectionViewCell
            
            if let posterImageLink =  popularMovies[indexPath.row].posterImagePath{
                cell.customImageView.backgroundImageView.kf.setImage(with: URL(string:posterImageLink), placeholder: placeHolderImage)
            
            }
            cell.customImageView.likeImageView.image=UIImage(named: Constants.imageIdentifiers.toBeLiked)

            if let averageVote = popularMovies[indexPath.row].averageVote{
                
                cell.customImageView.popularityLabel.text="\(averageVote)"+"%"
                
            }
cell.customImageView.id=popularMovies[indexPath.row].id
            return cell
            
        }
        else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifiers.homePopularTvCell, for: indexPath) as! CollectionViewCell
            if let posterImageLink = popularTvShows[indexPath.row].posterImagePath{
            cell.customImageView.backgroundImageView.kf.setImage(with: URL(string: posterImageLink), placeholder: placeHolderImage)
                
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
