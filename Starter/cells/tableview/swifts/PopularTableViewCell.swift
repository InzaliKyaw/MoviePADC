//
//  PopularTableViewCell.swift
//  Starter
//
//  Created by Mac on 03/02/2021.
//

import UIKit

class PopularTableViewCell: UITableViewCell{
   
    @IBOutlet weak var labelTitle:UILabel!

    @IBOutlet weak var collectionMovieView: UICollectionView!
    
    var delegate:MovieItemDelegate?=nil
    
    var data:MovieListResponse?{
        didSet{
            //nullCheck
            if let _ = data{
                collectionMovieView.reloadData()
            }
        }
    }
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
        return data?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView:UICollectionView,cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PopularFilmCollectionViewCell.self), for: indexPath) as? PopularFilmCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.data = data?.results?[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = data?.results?[indexPath.row]
        delegate?.onTapMovie(movieId: item?.id ?? -1)
    }
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath:IndexPath)->CGSize{
        let itemWidth : CGFloat = 120
        let itemHeight : CGFloat = collectionView.frame.height
        return CGSize(width: itemWidth, height: itemHeight)
//        return CGSize(width: collectionView.frame.width/3 , height: collectionView.frame.height)
    }
}
