//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by Andriy Krupych on 6/6/17.
//  Copyright © 2017 Andriy Krupych. All rights reserved.
//

import UIKit
import Twitter

class TweetTableViewCell: UITableViewCell {
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var createdLabel: UILabel!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var tweetTextLabel: UILabel!
    
    var tweet: Tweet? {
        didSet {
            userImageView.load(imageUrl: tweet?.user.profileImageURL)
            userLabel.text = tweet?.user.name
            tweetTextLabel.text = tweet?.text
            if let date = tweet?.created {
                let formatter = DateFormatter()
                if Date().timeIntervalSince(date) > 24*60*60 {
                    formatter.dateStyle = .short
                } else {
                    formatter.timeStyle = .short
                }
                createdLabel.text = formatter.string(from: date)
            }
        }
    }

}
