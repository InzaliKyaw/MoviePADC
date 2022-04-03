//
//  PopularFilmCollectionViewCell.swift
//  Starter
//
//  Created by Mac on 03/02/2021.
//

import UIKit
import SDWebImage

class PopularFilmCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelContentTitle : UILabel!
    @IBOutlet weak var imageViewBackdrop : UIImageView!
    @IBOutlet weak var ratingStar:RatingControlBar!
    @IBOutlet weak var labelRating:UILabel!
    
    
    var data : MovieResult? {
        didSet{
            if let data = data{
                
                let title = data.originalTitle ?? data.originalName
                let posterPath = "\(AppConstants.imageBaseURL)/\(data.posterPath ?? "")"
                
                labelContentTitle.text = title
                imageViewBackdrop.sd_setImage(with: URL(string: posterPath))
                
                labelRating.text = "\(data.voteAverage ?? 0.0)"
                ratingStar.starCount = Int(data.voteAverage ?? 0 * 0.5)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
