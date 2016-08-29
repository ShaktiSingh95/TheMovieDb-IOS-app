//
//  Tv.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 29/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import SwiftyJSON
class Tv{
    var popularity : Double?
    var averageVote : Double?
    var firstAirDate : String?
    var originCountry : String?
    var language : String?
    var vote : Double?
    var overView : String?
    var id : Int?
    var posterImagePath : String?
    init(json: JSON){

        self.popularity = json["popularity"].double
        self.averageVote = json["vote_average"].double
        self.firstAirDate = json["first_air_date"].string
        self.language = json["original_language"].string
        self.originCountry = json["origin_country"][0].string
        self.overView = json["overview"].string
        self.id = json["id"].int
        if let path = json["poster_path"].string
        {
            
            self.posterImagePath = Constants.imageUrls.baseImageUrl + path
            
            
        }
        else{
            
            self.posterImagePath = Constants.imageUrls.baseImageUrl
            
        }
        self.vote = json["vote_count"].double

    }
    
}