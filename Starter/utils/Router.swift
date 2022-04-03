//
//  Router.swift
//  Starter
//
//  Created by Mac on 20/06/2021.
//

import Foundation
import UIKit

enum StoryboardName : String{
    case Main = "Main"
    case LaunchScreen = "LaunchScreen"
    case Authentication = "Authentication"
}

extension UIStoryboard{
    static func mainStoryBoard()->UIStoryboard{
        UIStoryboard(name: StoryboardName.Main.rawValue, bundle: nil)
    }
}

extension UIViewController{
    func navigateToMovieDetailViewController(movieId: Int){
        guard let vc = UIStoryboard.mainStoryBoard().instantiateViewController(identifier: MovieDetailViewController.identifier) as? MovieDetailViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        vc.movieID = movieId
        present(vc, animated: true)
    }
}
