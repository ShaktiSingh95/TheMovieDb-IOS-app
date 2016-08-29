//
//  AppModel.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 28/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AppModel{
    
    private class func callIfNoConnectivity(){
        
        let setting = UIAlertAction(title: "GoTo Settings",style: .Default,handler: {
            handler in
            UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
        })
        let ok = UIAlertAction(title: "close",style: .Default,handler: nil)
        var actionsArray=[UIAlertAction]()
        actionsArray.append(setting)
        actionsArray.append(ok)
        ErrorHandlerViewController.showAlertViewController(Constants.alertPopupsOptions.titles.noInternetAlertTitle, alertVcMessage: Constants.alertPopupsOptions.messages.noInternetAlertMessage, actions: actionsArray)
    }
    
    
    
    class func fetchPerticularMovies(queryUrl:Constants.ApiSearchQueries.MovieRelated,handler: [Movie]->Void){
        if Internet.isConnectedToNetwork(){
            let parameters:[String:AnyObject] = ["api_key": Constants.ApiSearchQueries.apiKey.rawValue]
            Alamofire.request(.GET, queryUrl.rawValue, parameters: parameters).responseJSON(){
                
                response in
                var movies = [Movie]()
                
                let json = JSON(response.result.value!)
                print(json)
                for (_,subJson) in json["results"] {
                    
                    
                    movies.append(Movie(json: subJson))
                    
                }
                handler(movies)
            }
        }
            
        else {
            AppModel.callIfNoConnectivity()
        }
    }
    class func fetchPerticularTvShows(queryUrl:Constants.ApiSearchQueries.TvRelated,handler: [Tv]->Void){
        if(Internet.isConnectedToNetwork()){
            let parameters:[String:AnyObject]=["api_key":Constants.ApiSearchQueries.apiKey.rawValue]
            Alamofire.request(.GET, queryUrl.rawValue, parameters: parameters).responseJSON(){
                
                response in
                var tvShows = [Tv]()
                let json = JSON(response.result.value!)
                for (_,subJson) in json["results"]{
                    tvShows.append(Tv(json: subJson))
                }
                
                
                handler(tvShows)
            }}
        else {
            AppModel.callIfNoConnectivity()
        }}
    class func fetchPerticularCelebs(queryUrl:Constants.ApiSearchQueries.CelebsRelated,handler: [Celeb]->Void){
        if Internet.isConnectedToNetwork() {
            let parameters:[String:AnyObject]=["api_key":Constants.ApiSearchQueries.apiKey.rawValue]
            Alamofire.request(.GET, queryUrl.rawValue, parameters: parameters).responseJSON(){
                
                response in
                
                var celebs = [Celeb]()
                let json = JSON(response.result.value!)
                //print(json)
                for (_,subJson) in json["results"]{
                    
                    celebs.append(Celeb(json: subJson))
                    
                }
                handler(celebs)
            }
        }
            
        else {
            AppModel.callIfNoConnectivity()
        }
    }
}