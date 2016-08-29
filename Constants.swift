//
//  Constants.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 30/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
//import UIKit
class Constants{
      enum ApiSearchQueries : String{
        case apiKey = "ce7724b78a09f5436d559f3e56ad4ffa"
        enum MovieRelated : String{
            case popularMovies = "https://api.themoviedb.org/3/movie/popular"
            case topRatedMovies = "https://api.themoviedb.org/3/movie/top_rated"
            case upcomingMovies = "https://api.themoviedb.org/3/movie/upcoming"
            
        }
        enum TvRelated:String{
            
            case airedToday="https://api.themoviedb.org/3/tv/airing_today"
            case onTheAir="https://api.themoviedb.org/3/tv/on_the_air"
            case latest="https://api.themoviedb.org/3/tv/latest"
            case topRated="https://api.themoviedb.org/3/tv/top_rated"
            case popular="https://api.themoviedb.org/3/tv/popular"
            
        }
        enum CelebsRelated:String {
            
            case popular = "https://api.themoviedb.org/3/person/popular"
            
        }
    }
    enum alertPopupsOptions{
        enum titles:String{
            
            case noInternetAlertTitle="No network Connectivity"

            
        }
        enum messages:String {
            
            case noInternetAlertMessage="Please check your internet connectivity and come back"
        
        }
        
    }
    
    struct viewControllerIdentifiers{
        
        static let rightSliderVc = "app_right"
        static let homeVc = "home"
        static let homeMainVc = "home_main"
        static let moviesVc = "movies"
        static let moviesMainVc = "movie_main"
        static let requestedMoviesVc = "movies_list"
        static let tvVc = "tv"
        static let tvMainVc = "tv_main"
        static let requestedTvVc = "tv_list"
        static let celebsVc = "celebs"
        static let celebsMainVc = "celebs_main"
        static let requestedCelebsVc = "celebs_list"
        static let celebDetailsVc="celeb_detail_vc"
        
    }
    struct cellIdentifiers{
        
        static let celebKnownForCell = "known_for_cell"
        static let homePopularMovieCell = "home_movie_cell"
        static let homePopularTvCell = "home_tv_cell"
        static let homePopularCelebsCell = "home_celeb_cell"
        static let homeMainTableViewCell = "table_cell"
        static let homeMainCollectionCellEmbeddedInTableCell = "collection_cell"
        static let movieMainCollectionCell = "popular_movie_cell"
        static let movieMainTableCell = "movie_table_cell"
        static let tvMainCollectionCell = "popular_tv_cell"
        static let tvMainTableCell = "tv_table_cell"
        static let celebsMainCollectionCell = "popular_celebs_cell"
        static let celebsMainTableCell = "celebs_table_cell"
        static let requestedListMovieCell = "movies_cell"
        static let requestedListTvCell = "tv_show_cell"
        static let requestedListCelebsCell = "celebs_cell"
        
    }
    struct imageIdentifiers{
        
        static let rightOptionMenuButtonImage = "si0010s"
        static let placeHolderImage = "placeHolderImage"
        static let toBeLiked = "toBeLiked"
        static let liked = "liked"
    }
    struct imageUrls{
        
        static let baseImageUrl = "http://image.tmdb.org/t/p/w500"
        
    }
}
