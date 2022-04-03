//
//  Models.swift
//  NetworkingFirstProject
//
//  Created by Mac on 04/07/2021.
//

import Foundation

struct LoginSuccess: Decodable{
    let success : Bool?
    let expiresAt : Int?
    let requestToken : String?
    enum CodingKeys : String, CodingKey {
        case success
        case expiresAt = "status_code"
        case requestToken = "status_message"
    }
}

struct LoginFailed: Decodable{
    let success : Bool?
    let statusCode : Int?
    let statusMessage : String?
    
    enum CodingKeys : String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

struct LoginRequest: Encodable {
    let username : String
    let password : String
    let requestToken : String
    enum CodingKeys : String, CodingKey {
        case username
        case password
        case requestToken = "request_token"
    }
}

struct RequestTokenResponse: Codable {
    let success : Bool
    let expiresAt : String
    let requestToken : String
    
    enum CodingKeys:String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}

public struct MovieGenreList : Codable{
    public let genres: [MovieGenre]
}


public struct MovieGenre:Codable {
    public let id:Int
    public let name:String
    
    func convertToGenreVO() -> GenreVO {
        let vo = GenreVO(id: id, name: name, isSelected: false)
        return vo
    }
}

var movieGenres = [MovieGenre]()
