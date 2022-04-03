//
//  MovieSliderTableViewCell.swift
//  Starter
//
//  Created by Mac on 27/01/2021.
//

import UIKit

class MovieSliderTableViewCell: UITableViewCell{
    @IBOutlet weak var collectionViewMovie: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var delegate:MovieItemDelegate? = nil

    var data:MovieListResponse?{
        didSet{
            //nullCheck
            if let _ = data{
                collectionViewMovie.reloadData()
            }
        }
    }
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        collectionViewMovie.dataSource = self
        collectionViewMovie.delegate = self
        collectionViewMovie.register(UINib(nibName: String(describing: MovieSliderCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MovieSliderCollectionViewCell.self))
        // Configure the view for the selected state
    }
    
}

extension MovieSliderTableViewCell:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieSliderCollectionViewCell.self), for: indexPath) as? MovieSliderCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.data = data?.results?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = data?.results?[indexPath.row]
        delegate?.onTapMovie(movieId: item?.id ?? -1)
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,height:CGFloat(240))
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x)/Int(scrollView.frame.width)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x)/Int(scrollView.frame.width)
    }
    
    
}

