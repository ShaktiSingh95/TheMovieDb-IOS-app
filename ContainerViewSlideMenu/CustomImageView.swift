//
//  CustomImageView.swift
//  
//
//  Created by Shakti Pratap Singh on 07/08/16.
//
//

import UIKit

@IBDesignable class CustomImageView: UIView{

    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var popularityLabel: UILabel!
    var id:Int!
    var likeStatus = false
    fileprivate let defaults=UserDefaults.standard
    var delegate:CustomImageViewDelegate!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    @IBAction func tapped(_ sender: AnyObject) {

        
        print(id)
        self.invertLike()
        
    }
    fileprivate func invertLike(){
        
        if likeStatus == false{
            
        likeImageView.image=UIImage(named:Constants.imageIdentifiers.liked)
            likeStatus = true
         delegate.saveDataForId(self.id)
        }
        else
        {
        
            likeImageView.image=UIImage(named:Constants.imageIdentifiers.toBeLiked)
            likeStatus = false
            delegate.deleteDataForId(self.id)
            
            //DataToBeSaved.deleteFromCelebsId(self.id)
        }
        
    }
    fileprivate func setup(){
        
        let bundle = Bundle(for: type(of: self))
        let CustomImageViewNib = UINib(nibName: "CustomImageView", bundle: bundle)
        
        let CustomImageViews = CustomImageViewNib.instantiate(withOwner: self, options: nil) as! [UIView]
        let firstView = CustomImageViews[0]
        
        self.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        
        self.addSubview(firstView)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
