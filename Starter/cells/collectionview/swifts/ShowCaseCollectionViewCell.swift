//
//  ShowCaseCollectionViewCell.swift
//  Starter
//
//  Created by Mac on 13/06/2021.
//

import UIKit

class ShowCaseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelContentTitle : UILabel!
    @IBOutlet weak var imageViewBackdrop : UIImageView!
    @IBOutlet weak var labelReleaseDate : UILabel!
    
    
    
    
    var data : MovieResult? {
        didSet{
            if let data = data {
                
                let title = data.originalTitle ?? data.originalName
                let backdropPath = "\(AppConstants.imageBaseURL)/\(data.backdropPath ?? "")"
                
                labelContentTitle.text = title
                labelReleaseDate.text = data.releaseDate ?? "underfined"
                imageViewBackdrop.sd_setImage(with: URL(string: backdropPath))
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
