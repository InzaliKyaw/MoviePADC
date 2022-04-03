//
//  BestActorTableViewCell.swift
//  Starter
//
//  Created by Mac on 19/06/2021.
//

import UIKit

class BestActorTableViewCell: UITableViewCell, ActorActionDelegate {
   
    

    @IBOutlet weak var lblMoreActors: UILabel!
    @IBOutlet weak var collectionViewActors: UICollectionView!
    
    
    var data : ActorListResponse?{
        
        didSet{
            if let _ = data{
                collectionViewActors.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblMoreActors.underlineText(text:"MORE ACTORS")
        collectionViewActors.dataSource = self
        collectionViewActors.delegate = self
        collectionViewActors.register(UINib(nibName: String(describing:ActorCollectionViewCell.self), bundle: nil),forCellWithReuseIdentifier: String(describing: ActorCollectionViewCell.self))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func onTapFavourite(isFavourite: Bool) {
        debugPrint("isFavourite => \(isFavourite)")
    }
    
}
extension BestActorTableViewCell:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.results?.count ?? 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ActorCollectionViewCell.self), for: indexPath)as? ActorCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.data = data?.results?[indexPath.row]
        return cell
    }
    

    
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath: IndexPath)->CGSize{
        
        return CGSize(width: collectionView.frame.width/2.5, height:CGFloat(225))
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}
