//
//  MovieDetail.swift
//  Starter
//
//  Created by Mac on 20/01/2021.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var labelName: UILabel!
   
    @IBOutlet weak var btnRateMovies: UIButton!
    @IBAction func didOnTapButton(_ sender: Any) {
        debugPrint("on Tap Button")
    }
    
    @IBOutlet weak var collectionViewCreators: UICollectionView!
    @IBOutlet weak var collectionViewActors: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRateMovies.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnRateMovies.layer.borderWidth = 2
        btnRateMovies.layer.cornerRadius = 20
        registerForCollectionViewCell()
        // Do any additional setup after loading the view.
    }
    
    private func registerForCollectionViewCell(){
        collectionViewActors.dataSource = self
        collectionViewActors.delegate = self
        collectionViewActors.register(UINib(nibName: String(describing:ActorCollectionViewCell.self), bundle: nil),forCellWithReuseIdentifier: String(describing: ActorCollectionViewCell.self))
        
        collectionViewCreators.dataSource = self
        collectionViewCreators.delegate = self
        collectionViewCreators.register(UINib(nibName: String(describing:ActorCollectionViewCell.self), bundle: nil),forCellWithReuseIdentifier: String(describing: ActorCollectionViewCell.self))
        
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MovieDetailViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ActorCollectionViewCell.self), for: indexPath)as? ActorCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath: IndexPath)->CGSize{
        return CGSize(width: collectionView.frame.width/2.5, height:CGFloat(200))
    }
}
