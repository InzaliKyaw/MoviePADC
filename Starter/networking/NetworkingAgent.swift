//
//  NetworkingAgent.swift
//  Starter
//
//  Created by Mac on 04/07/2021.
//

import Foundation
import Alamofire

struct MovieDBNetworkAgent {
    static let shared = MovieDBNetworkAgent()
    
    private init(){}
    
    func getMovieDetailByID(id:Int, success:@escaping(MovieDetailResponse)-> Void, failure: @escaping(String)-> Void){
        let url = "\(AppConstants.BaseURL)/movie/\(id)?api_key=5c3f58f2956295064c0a63ba8c6c743e"
        
        AF.request(url).responseDecodable(of: MovieDetailResponse.self) {
            response in
            switch response.result{
            case .success(let data):
                  success(data)
            case .failure(let error):
                failure(error.errorDescription!)
            }
       
        }
    }
    
    func getMovieCreditById(id:Int, success: @escaping(MovieCreditResponse)-> Void, failure: @escaping(String)-> Void){
        let url = "\(AppConstants.BaseURL)/movie/\(id)/credits?api_key=5c3f58f2956295064c0a63ba8c6c743e"
        
        AF.request(url).responseDecodable(of: MovieCreditResponse.self) {
            response in
            switch response.result{
            case .success(let data):
                  success(data)
            case .failure(let error):
                failure(error.errorDescription!)
            }
       
        }
    }
    
    func getPopularPeople(success:@escaping(ActorListResponse)-> Void, failure: @escaping(String)-> Void){
        let url = "\(AppConstants.BaseURL)/person/popular?api_key=5c3f58f2956295064c0a63ba8c6c743e"
        
        AF.request(url).responseDecodable(of: ActorListResponse.self) {
            response in
            switch response.result{
            case .success(let data):
                  success(data)
            case .failure(let error):
                failure(error.errorDescription!)
            }
       
        }
    }
    
    func getGenreList(success:@escaping(MovieGenreList)-> Void, failure: @escaping(String)-> Void){
        let url = "\(AppConstants.BaseURL)/genre/movie/list?api_key=5c3f58f2956295064c0a63ba8c6c743e"
        
        AF.request(url).responseDecodable(of: MovieGenreList.self) {
            response in
            switch response.result{
            case .success(let data):
                  success(data)
                  //print(data)
            case .failure(let error):
                failure(error.errorDescription!)
            }
       
        }
    }
    
    func getTopRatedMovieList(success:@escaping(MovieListResponse)-> Void, failure: @escaping(String)-> Void){
        let url = "\(AppConstants.BaseURL)/movie/top_rated?api_key=5c3f58f2956295064c0a63ba8c6c743e"
        
        AF.request(url).responseDecodable(of: MovieListResponse.self) {
            response in
            switch response.result{
            case .success(let data):
                  success(data)
            case .failure(let error):
                failure(error.errorDescription!)
            }
       
        }
    }
    
    func getPopularMovieList(success:@escaping(MovieListResponse)-> Void, failure: @escaping(String)-> Void){
        let url = "\(AppConstants.BaseURL)/movie/popular?api_key=5c3f58f2956295064c0a63ba8c6c743e"
        
        AF.request(url).responseDecodable(of: MovieListResponse.self) {
            response in
            switch response.result{
            case .success(let data):
                  success(data)
                  //print(data)
            case .failure(let error):
                failure(error.errorDescription!)
            }
       
        }
    }
    func getPopularSeriesList(success:@escaping(MovieListResponse)-> Void, failure: @escaping(String)-> Void){
        let url = "\(AppConstants.BaseURL)/tv/popular?api_key=5c3f58f2956295064c0a63ba8c6c743e"
        
        AF.request(url).responseDecodable(of: MovieListResponse.self) {
            response in
            switch response.result{
            case .success(let data):
                  success(data)
                  //print(data)
            case .failure(let error):
                failure(error.errorDescription!)
            }
       
        }
    }
    
    
    
    func getUpcomingMovieList(success: @escaping (MovieListResponse)-> Void,failure: @escaping(String)-> Void){
        /**
          1) url
          2) method
          3) headers
          4) body
         */
        
        let url = "\(AppConstants.BaseURL)/movie/upcoming?api_key=5c3f58f2956295064c0a63ba8c6c743e"
        
        AF.request(url).responseDecodable(of: MovieListResponse.self) {
            response in
            switch response.result{
            case .success(let upcomingMovieList):
                  success(upcomingMovieList)
                  //print(upcomingMovieList)
            case .failure(let error):
                failure(error.errorDescription!)
            }
       
        }
       
    }
    
    
}
