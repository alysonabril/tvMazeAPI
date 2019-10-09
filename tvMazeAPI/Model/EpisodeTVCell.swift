//
//  EpisodeTVCell.swift
//  tvMazeAPI
//
//  Created by Alyson Abril on 9/12/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import UIKit

class EpisodeTVCell: UITableViewCell {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var episodeInfoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
