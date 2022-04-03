//
//  ActorListResponse.swift
//  Starter
//
//  Created by Mac on 10/07/2021.
//

import Foundation
public struct ActorListResponse:Codable{
    let page: Int?
    let results: [ActorInfoResponse]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

public struct ActorInfoResponse:Codable{
    let adult:Bool?
    let gender:Int?
    let id:Int?
    let knownFor:[MovieResult]?
    let knownForDepartment:String?
    let name:String?
    let popularity:Double?
    let profilePath:String?
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownFor = "known_for"
        case knownForDepartment = "known_for_department"
        case name
        case popularity
        case profilePath = "profile_path"
    }

}
