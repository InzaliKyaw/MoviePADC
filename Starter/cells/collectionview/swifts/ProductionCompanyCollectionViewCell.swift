//
//  ProductionCompanyCollectionViewCell.swift
//  Starter
//
//  Created by Mac on 11/07/2021.
//

import UIKit

class ProductionCompanyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageViewBackdrop : UIImageView!
    @IBOutlet weak var labelCompanyName : UILabel!
    var data : ProductionCompany?{
        didSet {
            if let data = data{
                
                //labelActorName.text = data.name
                //labelKnownForDepartment.text = data.knownForDepartment
                let urlStr = "\(AppConstants.imageBaseURL)/\(data.logoPath ?? "")"
                imageViewBackdrop.sd_setImage(with: URL(string: urlStr))
                
                labelCompanyName.text = data.name
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
