//
//  MovieDetail.swift
//  Starter
//
//  Created by Mac on 20/01/2021.
//

import UIKit

class MovieDetailViewController: UIViewController {


    @IBOutlet weak var imageViewBackdrop: UIImageView!
    @IBOutlet weak var btnRateMovies: UIButton!
    @IBOutlet weak var ivBack: UIImageView!
    @IBOutlet weak var labelReleasedYear : UILabel!
    @IBOutlet weak var labelMovieDescription : UILabel!
    @IBOutlet weak var labelMovieTitle : UILabel!
    @IBOutlet weak var labelDuration : UILabel!
    @IBOutlet weak var labelRating : UILabel!
    @IBOutlet weak var viewRatingCount : RatingControlBar!
    @IBOutlet weak var labelVoteCount : UILabel!
    @IBOutlet weak var labelAboutMovieTitle : UILabel!
    @IBOutlet weak var labelGenreCollectionString : UILabel!
    @IBOutlet weak var labelProductionCountriesString : UILabel!
    @IBOutlet weak var labelAboutMovieDescription: UILabel!
    @IBOutlet weak var collectionViewActors : UICollectionView!
    @IBOutlet weak var collectionViewCreators : UICollectionView!
    @IBOutlet weak var collectionViewProductionCompany: UICollectionView!
    
    private let networkAgent = MovieDBNetworkAgent.shared
    
    var movieID : Int = -1
    
    private var productionCompanies : [ProductionCompany] = []
    private var cast : [MovieCast] = []
    
    @IBAction func didOnTapButton(_ sender: Any) {
        debugPrint("on Tap Button")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRateMovies.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnRateMovies.layer.borderWidth = 2
        btnRateMovies.layer.cornerRadius = 20
        registerForCollectionViewCell()
        
        initGestureRecognizers()
        fetchMovieDetails(id: movieID)
        fetchMovieCredits(id: movieID)
        // Do any additional setup after loading the view.
    }
    
    private func registerForCollectionViewCell(){
        collectionViewActors.dataSource = self
        collectionViewActors.delegate = self
        collectionViewActors.register(UINib(nibName: String(describing:ActorCollectionViewCell.self), bundle: nil),forCellWithReuseIdentifier: String(describing: ActorCollectionViewCell.self))
        
        collectionViewCreators.dataSource = self
        collectionViewCreators.delegate = self
        collectionViewCreators.register(UINib(nibName: String(describing:ActorCollectionViewCell.self), bundle: nil),forCellWithReuseIdentifier: String(describing: ActorCollectionViewCell.self))
        
        collectionViewProductionCompany.dataSource = self
        collectionViewProductionCompany.delegate = self
        collectionViewProductionCompany.register(UINib(nibName: String(describing: ProductionCompanyCollectionViewCell.self), bundle: nil),forCellWithReuseIdentifier: String(describing: ProductionCompanyCollectionViewCell.self))
        
       
    }
    
    func fetchMovieDetails(id: Int){
        networkAgent.getMovieDetailByID(id: id){(data) in
            print(data)
            self.bindData(data: data)
            
        }failure: {(error) in
            print(error.description)
        }
    }
    
    func fetchMovieCredits(id:Int){
        networkAgent.getMovieCreditById(id: id) {(data) in
            //self.bindData(data: data)
            print(data)
            self.cast = data.cast ?? [MovieCast]()
            self.collectionViewActors.reloadData()
        } failure: {(error) in
            print(error.description)
        }
    }
    
    private func initGestureRecognizers(){
            let tapGestureForBack = UITapGestureRecognizer(target: self, action: #selector(onTapBack))
            ivBack.isUserInteractionEnabled = true
            ivBack.addGestureRecognizer(tapGestureForBack)
        }
    
    private func bindData(data: MovieDetailResponse){
        productionCompanies = data.productionCompanies ?? [ProductionCompany]()
        collectionViewProductionCompany.reloadData()
        
        let backdropPath = "\(AppConstants.imageBaseURL)/\(data.backdropPath ?? "")"
        imageViewBackdrop.sd_setImage(with:URL(string: backdropPath))
        
        labelReleasedYear.text = String(data.releaseDate?.split(separator:"-")[0] ?? "")
        labelMovieDescription.text = data.overview
        labelMovieTitle.text = data.originalTitle
        let runTimeHour = Int((data.runtime ?? 0 )/60)
        let runTimeMinutes = (data.runtime ?? 0 % 60)
        labelDuration.text = "\(runTimeHour) hr \(runTimeMinutes) min"
        //labelRating.text = "\(data.voteAverage ?? 0)"
        //viewRatingCount.rating = data.voteAverage ?? 0.0
        labelVoteCount.text = "\(data.voteCount ?? 0) votes"
        labelAboutMovieTitle.text = data.originalTitle
        
        var genreListStr = ""
        data.genres?.forEach(){
            (item) in
            genreListStr = "\(item.name ?? ""), "
        }
        
        genreListStr.removeLast()
        genreListStr.removeLast()
        labelGenreCollectionString.text = genreListStr
        
        var countryListStr = ""
        data.productionCountries?.forEach(){
            (item) in
            countryListStr = "\(item.name ?? ""), "
        }
        countryListStr.removeLast()
        countryListStr.removeLast()
        
        labelProductionCountriesString.text = countryListStr
        labelAboutMovieDescription.text = data.overview
    }
    
    @objc func onTapBack(){
        self.dismiss(animated: true, completion: nil)
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
        if collectionView == collectionViewProductionCompany {
            return productionCompanies.count
        }else if(collectionView == collectionViewActors){
            return cast.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewProductionCompany {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:String(describing: ProductionCompanyCollectionViewCell.self), for: indexPath)as? ProductionCompanyCollectionViewCell else {
                return UICollectionViewCell()
             }
        cell.data = productionCompanies[indexPath.row]

        return cell
        } else if(collectionView == collectionViewActors){
            
            
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ActorCollectionViewCell.self), for: indexPath)as? ActorCollectionViewCell else{
            return UICollectionViewCell()
        }
            let item:MovieCast = cast[indexPath.row]
            cell.data = item.convertToActorInfoResponse()
        return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ActorCollectionViewCell.self), for: indexPath)as? ActorCollectionViewCell else{
                return UICollectionViewCell()
            }
                //let item:MovieCast = cast[indexPath.row]
                //cell.data = item.convertToActorInfoResponse()
            return cell
        }
    
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath: IndexPath)->CGSize{
        
        if collectionView == collectionViewProductionCompany {
            let itemWidth: CGFloat = 200
            let itemHeight = itemWidth
            return CGSize(width: itemWidth, height: itemHeight)
        }else if collectionView == collectionViewActors{
            let itemWidth: CGFloat = 120
            let itemHeight = itemWidth * 1.5
            return CGSize(width: itemWidth, height: itemHeight)
        }
        return CGSize(width: collectionView.frame.width/2.5, height:CGFloat(200))
    }
}
}
