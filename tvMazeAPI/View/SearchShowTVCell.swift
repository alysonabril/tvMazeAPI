//
//  SearchShowTVCell.swift
//  tvMazeAPI
//
//  Created by Alyson Abril on 9/12/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import UIKit

class SearchShowTVCell: UITableViewCell {

    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchShowName: UILabel!
    @IBOutlet weak var showRatingLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
