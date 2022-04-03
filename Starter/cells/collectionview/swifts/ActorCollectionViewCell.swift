//
//  ActorCollectionViewCell.swift
//  Starter
//
//  Created by Mac on 19/06/2021.
//

import UIKit
import SDWebImage

class ActorCollectionViewCell: UICollectionViewCell {

   
  
    @IBOutlet weak var ivheart: UIImageView!
    @IBOutlet weak var ivheartFill: UIImageView!
    @IBOutlet weak var imageViewActorProfile : UIImageView!
    @IBOutlet weak var labelActorName : UILabel!
    @IBOutlet weak var labelKnownForDepartment : UILabel!
    
    var delegate:ActorActionDelegate?=nil
    
    var data: ActorInfoResponse? {
        didSet{
            if let data = data{
                
                labelActorName.text = data.name
                labelKnownForDepartment.text = data.knownForDepartment
                let posterPath = "\(AppConstants.imageBaseURL)/\(data.profilePath ?? "")"
                imageViewActorProfile.sd_setImage(with: URL(string: posterPath))
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        initGestureRecognizers()
    }
    private func initGestureRecognizers(){
        let tapGestForFavourite = UITapGestureRecognizer(target: self, action: #selector(onTapFavourite))
        
        ivheartFill.isUserInteractionEnabled = true
        ivheartFill.addGestureRecognizer(tapGestForFavourite)
        
        let tapGestForUnFavourite = UITapGestureRecognizer(target: self, action: #selector(onTapUnFavourite))
        ivheart.isUserInteractionEnabled = true
        ivheart.addGestureRecognizer(tapGestForUnFavourite)
        
    }
    @objc func onTapFavourite(){
        
        ivheartFill.isHidden = true
        ivheart.isHidden = false
        delegate?.onTapFavourite(isFavourite:true)
    }
    @objc func onTapUnFavourite(){
        ivheartFill.isHidden = false
        ivheart.isHidden = true
        delegate?.onTapFavourite(isFavourite:false)
    }
}
