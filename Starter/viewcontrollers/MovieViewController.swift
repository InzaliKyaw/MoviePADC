//
//  MovieViewController.swift
//  Starter
//
//  Created by Mac on 22/01/2021.
//

import UIKit

class MovieViewController: UIViewController,MovieItemDelegate {
    

    @IBOutlet weak var ivSearch: UIImageView!
    @IBOutlet weak var ivMenu: UIImageView!
    @IBOutlet weak var toobarMovies: UIView!
    @IBOutlet weak var tableViewMovies: UITableView!
    
    
    private let networkAgent = MovieDBNetworkAgent.shared
    
    private var upComingMovieList:MovieListResponse?
    
    private var popularMovieList:MovieListResponse?
    
    private var popularSeriesList:MovieListResponse?
    
    private var topRatedMovieList:MovieListResponse?
    
    private var genreMovieList: MovieGenreList?
    
    private var popularPeopleList: ActorListResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       registerForTableViewCell()
       fetchUpcomingMovieList()
       fetchPopularMovieList()
       fetchPopularSeriesList()
       fetchGenreList()
       fetchTopRatedMovieList()
       fetchPopularPeopleList()
        
        
    }
    
    private func registerForTableViewCell(){
        tableViewMovies.dataSource = self
        
        tableViewMovies.registerForCell(identifier: MovieSliderTableViewCell.identifier)
        tableViewMovies.registerForCell(identifier: PopularTableViewCell.identifier)
        tableViewMovies.registerForCell(identifier: MovieShowTimeTableCell.identifier)
        tableViewMovies.registerForCell(identifier: GenreTableViewCell.identifier)
        tableViewMovies.registerForCell(identifier: ShowCaseTableViewCell.identifier)
        tableViewMovies.registerForCell(identifier: BestActorTableViewCell.identifier)
    }
    
    func onTapMovie(movieId : Int) {
        navigateToMovieDetailViewController(movieId : movieId)
    }
    
    
    
    func fetchUpcomingMovieList(){
        networkAgent.getUpcomingMovieList{(data) in
            self.upComingMovieList = data
            
            //UIUpdate
            self.tableViewMovies.reloadSections(IndexSet(integer: MovieType.MOVIE_SLIDER.rawValue), with: .automatic)
            
        }failure: {(error) in
            print(error.description)
        }
    }
    
    func fetchPopularMovieList(){
        networkAgent.getPopularMovieList{
            (data) in
            self.popularMovieList = data
            self.tableViewMovies.reloadSections(IndexSet(integer: MovieType.MOVIE_POPULAR.rawValue), with: .automatic)
        }failure: { (error) in
            print(error.description)
        }
    }
    
    func fetchPopularSeriesList(){
        networkAgent.getPopularSeriesList{
            (data) in
            self.popularSeriesList = data
            self.tableViewMovies.reloadSections(IndexSet(integer: MovieType.MOVIE_SERIES.rawValue), with: .automatic)
        }failure: { (error) in
            print(error.description)
        }
    }
    
    
    func fetchGenreList(){
        networkAgent.getGenreList{
            (data) in
            self.genreMovieList = data
            self.tableViewMovies.reloadSections(IndexSet(integer: MovieType.MOVIE_GENRE.rawValue), with: .automatic)
        }failure: { (error) in
            print(error.description)
        }
    }
    
    
    func fetchTopRatedMovieList(){
        networkAgent.getTopRatedMovieList{
            (data) in
            self.topRatedMovieList = data
            self.tableViewMovies.reloadSections(IndexSet(integer:
                                                            MovieType.MOVIE_SHOWCASE.rawValue), with: .automatic)
        }failure: { (error) in
            print(error.description)
        }
    }
    
   
    
    func fetchPopularPeopleList(){
        networkAgent.getPopularPeople(){
            (data) in
            self.popularPeopleList = data
            print("PopularPeople Count : \(self.popularPeopleList?.results?.count ?? 0)")
            self.tableViewMovies.reloadSections(IndexSet(integer: MovieType.MOVIE_BEST_ACTOR.rawValue), with: .automatic)
        }failure: { (error) in
            print(error.description)
        }
    }
    }




    
extension MovieViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        
        case MovieType.MOVIE_SLIDER.rawValue:
        let cell = tableView.dequeueCell(identifier: MovieSliderTableViewCell.identifier, indexPath: indexPath) as MovieSliderTableViewCell
        cell.delegate = self
           //network ka ya tr ko
          //Movie Table View ko data pass mal
         cell.data = upComingMovieList
         return cell
        case MovieType.MOVIE_POPULAR.rawValue:
        let cell = tableView.dequeueCell(identifier: PopularTableViewCell.identifier, indexPath: indexPath) as PopularTableViewCell
        cell.delegate = self
        cell.labelTitle.text = "popular movies".uppercased()
        cell.data = popularMovieList
        return cell
        case MovieType.MOVIE_SERIES.rawValue:
        let cell = tableView.dequeueCell(identifier: PopularTableViewCell.identifier, indexPath: indexPath) as PopularTableViewCell
        cell.delegate = self
        cell.labelTitle.text = "popular series".uppercased()
        cell.data = popularSeriesList
        return cell
        case MovieType.MOVIE_SHOWTIME.rawValue:
        return tableView.dequeueCell(identifier: MovieShowTimeTableCell.identifier, indexPath: indexPath)
        case MovieType.MOVIE_GENRE.rawValue:
            
        let cell = tableView.dequeueCell(identifier: GenreTableViewCell.identifier, indexPath: indexPath) as GenreTableViewCell
      
        var movieList :[MovieResult] = []
        movieList.append(contentsOf: upComingMovieList?.results ?? [MovieResult]())
        movieList.append(contentsOf: popularSeriesList?.results ?? [MovieResult]())
        movieList.append(contentsOf: popularMovieList?.results ?? [MovieResult]())
            cell.allMoviesAndSeries = movieList
            
        let resultData = genreMovieList?.genres.map{
                     movieGenre ->  GenreVO in
                     return movieGenre.convertToGenreVO()
                 }
       resultData?.first?.isSelected = true
       cell.genreList = resultData
       return cell
        case MovieType.MOVIE_SHOWCASE.rawValue:
        let cell = tableView.dequeueCell(identifier: ShowCaseTableViewCell.identifier, indexPath: indexPath) as ShowCaseTableViewCell
        cell.data = topRatedMovieList
        return cell
            
        case MovieType.MOVIE_BEST_ACTOR.rawValue:
        let cell = tableView.dequeueCell(identifier: BestActorTableViewCell.identifier, indexPath: indexPath) as BestActorTableViewCell
            cell.data = popularPeopleList
        return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
