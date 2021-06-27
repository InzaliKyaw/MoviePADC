//
//  PopularTableViewCell.swift
//  Starter
//
//  Created by Mac on 03/02/2021.
//

import UIKit

class PopularTableViewCell: UITableViewCell{
   
    

    @IBOutlet weak var collectionMovieView: UICollectionView!
    
    var delegate:MovieItemDelegate?=nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionMovieView.dataSource = self
        collectionMovieView.delegate = self
    
        collectionMovieView.register(UINib(nibName: String(describing: PopularFilmCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: PopularFilmCollectionViewCell.self))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension PopularTableViewCell:
    UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView:UICollectionView,
                        numberOfItemsInSection section:Int) ->  Int {
        10
    }
    
    func collectionView(_ collectionView:UICollectionView,cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PopularFilmCollectionViewCell.self), for: indexPath) as? PopularFilmCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onTapMovie()
    }
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath:IndexPath)->CGSize{
        return CGSize(width: collectionView.frame.width/3 , height: CGFloat(225))
    }
}
