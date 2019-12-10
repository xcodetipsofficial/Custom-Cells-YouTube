//
//  CustomCell.swift
//  DynamicCells
//
//  Created by Kyle Wilson on 2019-12-09.
//  Copyright © 2019 Xcode Tips. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    var videoTitle: String?
    var thumbnailImage: UIImage?
    var channelImage: UIImage?
    var details: String?
    
    var titleView: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Avenir-Black", size: 20)
        return label
    }()
    
    var thumbnailImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var profileImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var uploadDetailsView: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(thumbnailImageView)
        self.addSubview(titleView)
        self.addSubview(profileImageView)
        self.addSubview(uploadDetailsView)
        
        thumbnailImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        thumbnailImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        thumbnailImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        profileImageView.topAnchor.constraint(equalTo: self.thumbnailImageView.bottomAnchor, constant: 10).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        titleView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: self.profileImageView.rightAnchor, constant: 10).isActive = true
        titleView.topAnchor.constraint(equalTo: self.thumbnailImageView.bottomAnchor, constant: 5).isActive = true
        titleView.bottomAnchor.constraint(equalTo: self.uploadDetailsView.topAnchor).isActive = true
        
        
        uploadDetailsView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 70).isActive = true
        uploadDetailsView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        uploadDetailsView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor).isActive = true
        let constraint = uploadDetailsView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)
        constraint.priority = UILayoutPriority(999)
        constraint.isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let title = videoTitle {
            titleView.text = title
        }
        
        if let thumbnail = thumbnailImage {
            thumbnailImageView.image = thumbnail
        }
        
        if let channelImage = channelImage {
            profileImageView.image = channelImage
            profileImageView.layer.masksToBounds = true
            profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        }
        
        if let details = details {
            uploadDetailsView.text = details
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
