//
//  Users.swift
//  UserPostApp
//
//  Created by Suman Gurung on 18/11/2021.
//

import Foundation

struct Users: Decodable{
    var id:Int
    var name:String
    var userName:String
    var email:String
    var address:Address
    var phone:String
    var website:String
    var company:Company
    
    enum CodingKeys:String, CodingKey {
        case id, name, email, phone, website, address, company
        case userName = "username"
    }
}

struct Address: Decodable {
    var street:String
    var suite:String
    var city:String
    var zipCode:String
    var geo:Geo
    
    enum CodingKeys:String, CodingKey {
        case street, suite, city, geo
        case zipCode = "zipcode"
    }
}

struct Geo: Decodable {
    var lat:String
    var lng:String
    
}

struct Company: Decodable {
    var name:String
    var catchPhrase:String
    var bs:String
}

