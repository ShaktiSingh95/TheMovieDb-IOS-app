//
//  DataToBeSaved.swift
//  TheEntertainmentApp
//
//  Created by Shakti Pratap Singh on 23/08/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
class DataToBeSaved {
    
    static var likedCelebsIds=[Int]()
    static var likedTvShowsIds=[Int]()
    static var likedMoviesIds=[Int]()

    class func appendToCelebsId(id:Int){
        
        likedCelebsIds.append(id)
    }
    class func appendToTvShowsId(id:Int){
        
        likedTvShowsIds.append(id)
    }
    class func appendToMoviesId(id:Int){
        
        likedMoviesIds.append(id)
    }

    class func deleteFromTvShowsId(id:Int){
        
        
    }
    class func deleteFromCelebsId(id:Int){
        
        
    }
    class func deleteFromMoviesId(id:Int){
        
        
    }
}