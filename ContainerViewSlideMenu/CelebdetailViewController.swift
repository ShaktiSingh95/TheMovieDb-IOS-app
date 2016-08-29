//
//  CelebdetailViewController.swift
//
//
//  Created by Shakti Pratap Singh on 16/08/16.
//
//

import UIKit

class CelebdetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var celebPoster: UIImageView!
    @IBOutlet weak var popularMoviesTableView: UITableView!
    @IBOutlet weak var celebImdbId: UILabel!
    @IBOutlet weak var celebPopularity: UILabel!
    @IBOutlet weak var celebName: UILabel!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var viewWithTableView: UIView!
    var frameSize:CGSize?
    var detailsState = false
    var celeb : Celeb!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.celebName.text=celeb.name!
        self.celebPopularity.text=String(celeb.popularity!)
        self.celebImdbId.text="czxc"
        self.celebPoster.kf_setImageWithURL(NSURL(string: celeb.profileImagePath!), placeholderImage: UIImage(named:Constants.imageIdentifiers.placeHolderImage))
        self.popularMoviesTableView.dataSource=self
        self.popularMoviesTableView.delegate=self
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.detailsView.frame.origin=CGPoint(x: 0,y: self.detailsView.frame.size.height*(-1))
        
    }
    @IBAction func taped(sender: UITapGestureRecognizer) {
        
        let navigationBarHeight=self.navigationController?.navigationBar.frame.size.height

        if detailsState == false{
            
            UIView.animateWithDuration(2, animations: {
                
                self.detailsView.frame.origin=CGPoint(x: self.view.frame.origin.x,y:navigationBarHeight!+self.view.frame.origin.y+20)
                
                self.viewWithTableView.frame.origin=CGPoint(x: self.view.frame.origin.x,y:navigationBarHeight!+self.view.frame.maxY-213)
                
                }, completion: {handler in })
            detailsState=true
            
        }
        else{
            
            UIView.animateWithDuration(2, animations: {
                self.detailsView.frame.origin=CGPoint(x: self.view.frame.origin.x,y: self.view.frame.origin.y-136)
                self.viewWithTableView.frame.origin=CGPoint(x: self.view.frame.origin.x,y: self.view.frame.maxY)}, completion: {handler in }
            
                )
        
        detailsState=false
    }
    
    
}
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celeb.knownFor.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.cellIdentifiers.celebKnownForCell) as! RequestedTypeTableViewCell
        cell.cellInfo.text = celeb.knownFor[indexPath.row].overview!
        cell.customImageView.backgroundImageView.kf_setImageWithURL(NSURL(string: celeb.knownFor[indexPath.row].posterImagePath!), placeholderImage: UIImage(named:Constants.imageIdentifiers.placeHolderImage))
        cell.customImageView.popularityLabel.text=String(celeb.knownFor[indexPath.row].popularity!)
        cell.customImageView.likeImageView.image=UIImage(named: Constants.imageIdentifiers.toBeLiked)
        return cell
        
    }
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

}
