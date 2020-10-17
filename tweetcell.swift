//
//  tweetcell.swift
//  Twitter
//
//  Created by Jolie Ip Ying See on 09/10/2020.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class tweetcell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var bodyText: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    
    @IBOutlet weak var favoriconButton: UIButton!
    @IBOutlet weak var favButton: UILabel!
    @IBOutlet weak var retweet: UIButton!
    var favorited:Bool = false
    var tweetId:Int = -1
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: {
            (error) in
            print("Error is retweeting: \(error)")
        })
    }
    
    
    
    
    func setRetweeted(_ isRetweeted:Bool) {
        
        if (isRetweeted) {
            retweet.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
            retweet.isEnabled = false
        } else {
            retweet.setImage(UIImage(named: "retweet-icon"), for: .normal)
            retweet.isEnabled = true
        }
    }
    
    func setFavorited(_isFavorited:Bool)
    {
        favorited = _isFavorited
        if(favorited){
            favoriconButton.setImage(UIImage(named: "favor-icon-red")
                , for: UIControl.State.normal)
        }
        else{
            favoriconButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if(tobeFavorited){
            TwitterAPICaller.client?.favoritetweet(tweetId: tweetId, success: {
                self.setFavorited(_isFavorited: true)
            }, failure: { (Error) in
                print("Favorite did not succeed:\(Error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoritetweet(tweetId: tweetId, success: {
                self.setFavorited(_isFavorited: false)
            }, failure: { (Error) in
                print("unfavorite did not succeed:\(Error)")
            })
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    }

