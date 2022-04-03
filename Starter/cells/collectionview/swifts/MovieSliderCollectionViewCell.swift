//
//  MovieSliderCollectionViewCell.swift
//  Starter
//
//  Created by Mac on 28/01/2021.
//

import UIKit
import SDWebImage

class MovieSliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelContentTitle : UILabel!
    @IBOutlet weak var imageViewBackdrop : UIImageView!
    
    var data : MovieResult? {
        didSet{
            if let data = data{
                let title = data.originalTitle
                let backdropPath = "\(AppConstants.imageBaseURL)/\(data.backdropPath ?? "")"
                
                labelContentTitle.text = title
                imageViewBackdrop.sd_setImage(with: URL(string: backdropPath))
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

}
