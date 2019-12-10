//
//  ViewController.swift
//  DynamicCells
//
//  Created by Kyle Wilson on 2019-12-07.
//  Copyright © 2019 Xcode Tips. All rights reserved.
//

import UIKit

struct CellData {
    let thumbnail: UIImage?
    let title: String?
    let profileImage: UIImage?
    let uploadDetails: String?
}

class TableViewController: UITableViewController {
    
    var data = [CellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [CellData.init(thumbnail: UIImage(named: "healthbar"), title: "HOW TO CREATE A HEALTH BAR IN XCODE (SpriteKit)", profileImage: UIImage(named: "xcodetips"), uploadDetails: "Xcode Tips - 148 views - 1 month ago"),
                CellData.init(thumbnail: UIImage(named: "appdelegate"), title: "HOW TO MAKE YOUR APP ONLY USING APPDELEGATE (Xcode11)", profileImage: UIImage(named: "xcodetips"), uploadDetails: "Xcode Tips - 115 views - 1 month ago"),
                CellData.init(thumbnail: UIImage(named: "text"), title: "How to do Text Animation in Xcode 11", profileImage: UIImage(named: "xcodetips"), uploadDetails: "Xcode Tips - 131 views - 1 month ago"),
                CellData.init(thumbnail: UIImage(named: "healthbar"), title: "HOW TO CREATE A HEALTH BAR IN XCODE (SpriteKit)", profileImage: UIImage(named: "xcodetips"), uploadDetails: "Xcode Tips - 148 views - 1 month ago"),
                CellData.init(thumbnail: UIImage(named: "appdelegate"), title: "HOW TO MAKE YOUR APP ONLY USING APPDELEGATE (Xcode11)", profileImage: UIImage(named: "xcodetips"), uploadDetails: "Xcode Tips - 115 views - 1 month ago"),
                CellData.init(thumbnail: UIImage(named: "text"), title: "How to do Text Animation in Xcode 11", profileImage: UIImage(named: "xcodetips"), uploadDetails: "Xcode Tips - 131 views - 1 month ago")]
        
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        cell.thumbnailImage = data[indexPath.row].thumbnail
        cell.videoTitle = data[indexPath.row].title
        cell.channelImage = data[indexPath.row].profileImage
        cell.details = data[indexPath.row].uploadDetails
        cell.layoutSubviews()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


}

