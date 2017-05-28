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
    fileprivate var tableContent = ["Popular"]
    var popularCelebs = [Celeb](){
        
        didSet{
            
            self.popularCelebsCollectionView.reloadData()
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
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
    func saveDataForId(_ id:Int){
        
        DataToBeSaved.appendToCelebsId(id)
        
        }
    func deleteDataForId(_ id:Int){
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularCelebs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifiers.celebsMainCollectionCell, for: indexPath) as! CollectionViewCell
        
        if let posterImageLink = popularCelebs[indexPath.row].profileImagePath{
            
            cell.customImageView.backgroundImageView.kf_setImageWithURL(URL(string: posterImageLink), placeholderImage: placeHolderImage)
            
        }
        if let name = popularCelebs[indexPath.row].name{
            
            cell.customImageView.popularityLabel.text=name
            
        }
        cell.customImageView.likeImageView.image=UIImage(named: Constants.imageIdentifiers.toBeLiked)
        cell.customImageView.delegate=self
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let destinationVc = self.storyboard?.instantiateViewController(withIdentifier: Constants.viewControllerIdentifiers.celebDetailsVc) as! CelebdetailViewController
        destinationVc.celeb = self.popularCelebs[indexPath.row]
        show(destinationVc, sender: nil)
        
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifiers.celebsMainTableCell)!
        cell.textLabel?.text = tableContent[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        let destinationVc = self.storyboard?.instantiateViewController(withIdentifier: Constants.viewControllerIdentifiers.requestedCelebsVc) as! RequestedCelebsViewController
        switch row{
            
        case 0 : destinationVc.query = Constants.ApiSearchQueries.CelebsRelated.popular
        default: break
            
            
        }
        self.show(destinationVc, sender: nil)
        
    }
    
    
    
}
