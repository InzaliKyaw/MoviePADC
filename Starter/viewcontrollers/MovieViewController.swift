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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       registerForTableViewCell()
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
    
    func onTapMovie() {
        navigateToMovieDetailViewController()
    }
    }




    
extension MovieViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        
        case MovieType.MOVIE_SLIDER.rawValue:
        let cell = tableView.dequeueCell(identifier: MovieSliderTableViewCell.identifier, indexPath: indexPath) as MovieSliderTableViewCell
        cell.delegate = self
         return cell
        case MovieType.MOVIE_POPULAR.rawValue:
        let cell = tableView.dequeueCell(identifier: PopularTableViewCell.identifier, indexPath: indexPath) as PopularTableViewCell
        cell.delegate = self
        return cell
        case MovieType.MOVIE_SHOWTIME.rawValue:
        return tableView.dequeueCell(identifier: MovieShowTimeTableCell.identifier, indexPath: indexPath)
        case MovieType.MOVIE_GENRE.rawValue:
        return tableView.dequeueCell(identifier: GenreTableViewCell.identifier, indexPath: indexPath)
        case MovieType.MOVIE_SHOWCASE.rawValue:
        return tableView.dequeueCell(identifier: ShowCaseTableViewCell.identifier, indexPath: indexPath)
        case MovieType.MOVIE_BEST_ACTOR.rawValue:
        return tableView.dequeueCell(identifier: BestActorTableViewCell.identifier, indexPath: indexPath)
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
