//
//  CelebsMainViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 29/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import Kingfisher
class CelebsMainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate,CustomImageViewDelegate {
    
    @IBOutlet weak var popularCelebsCollectionView: UICollectionView!
    @IBOutlet weak var celebsCategoriesTableView: UITableView!
    private var tableContent = ["Popular"]
    var popularCelebs = [Celeb](){
        
        didSet{
            
            self.popularCelebsCollectionView.reloadData()
            
        }
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.closeRight()
    }
    var placeHolderImage = UIImage(named:Constants.imageIdentifiers.placeHolderImage)
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCelebsCollectionView.dataSource = self
        popularCelebsCollectionView.delegate = self
        celebsCategoriesTableView.dataSource=self
        celebsCategoriesTableView.delegate=self
        AppModel.fetchPerticularCelebs(Constants.ApiSearchQueries.CelebsRelated.popular){
            
            celebs in
            self.popularCelebs = celebs
        }
        
    }
    func saveDataForId(id:Int){
        
        DataToBeSaved.appendToCelebsId(id)
        
        }
    func deleteDataForId(id:Int){
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularCelebs.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.cellIdentifiers.celebsMainCollectionCell, forIndexPath: indexPath) as! CollectionViewCell
        
        if let posterImageLink = popularCelebs[indexPath.row].profileImagePath{
            
            cell.customImageView.backgroundImageView.kf_setImageWithURL(NSURL(string: posterImageLink), placeholderImage: placeHolderImage)
            
        }
        if let name = popularCelebs[indexPath.row].name{
            
            cell.customImageView.popularityLabel.text=name
            
        }
        cell.customImageView.likeImageView.image=UIImage(named: Constants.imageIdentifiers.toBeLiked)
        cell.customImageView.delegate=self
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
        let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.celebDetailsVc) as! CelebdetailViewController
        destinationVc.celeb = self.popularCelebs[indexPath.row]
        showViewController(destinationVc, sender: nil)
        
    
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.cellIdentifiers.celebsMainTableCell)!
        cell.textLabel?.text = tableContent[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let row = indexPath.row
        let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.requestedCelebsVc) as! RequestedCelebsViewController
        switch row{
            
        case 0 : destinationVc.query = Constants.ApiSearchQueries.CelebsRelated.popular
        default: break
            
            
        }
        self.showViewController(destinationVc, sender: nil)
        
    }
    
    
    
}
