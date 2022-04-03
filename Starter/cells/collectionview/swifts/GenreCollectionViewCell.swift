//
//  GenreCollectionViewCell.swift
//  Starter
//
//  Created by Mac on 04/06/2021.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var viewForOverlay: UIView!
    @IBOutlet weak var lblGenre: UILabel!
    
    //onTapItem ko CollectionView yae TableViewCell mhr implement lote
    
    
    //ClosureFunction
    var onTapItem : ((Int)->Void) = {_ in}
    
    
    var data:GenreVO? = nil{
    didSet{
        if let genre = data{
            lblGenre.text = genre.name.uppercased()
            (genre.isSelected) ? (viewForOverlay.isHidden=false) : (viewForOverlay.isHidden=true)
            
            //gener variable is local variable can be only used within if block
        }
    }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGestureForContainer = UITapGestureRecognizer(target: self, action: #selector(didtapItem))
        containerView.isUserInteractionEnabled = true
        containerView.addGestureRecognizer(tapGestureForContainer)
        
    }
    @objc func didtapItem(){
        onTapItem(data?.id ?? 0)
    }
    
}
