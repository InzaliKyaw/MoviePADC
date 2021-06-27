//
//  ActorCollectionViewCell.swift
//  Starter
//
//  Created by Mac on 19/06/2021.
//

import UIKit

class ActorCollectionViewCell: UICollectionViewCell {

   
  
    @IBOutlet weak var ivheart: UIImageView!
    @IBOutlet weak var ivheartFill: UIImageView!
    
    var delegate:ActorActionDelegate?=nil
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
