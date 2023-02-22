//
//  Avenger.swift
//  Avengers
//
//  Created by iMac Pro on 2/22/23.
//

import Foundation

class Avenger {
    let name: String
    let description: String
    let thumbnailPath: String
    let thumbnailExtention: String
    let comicsAppearing: Int
    
    init(name: String, description: String, thumbnailPath: String, thumbnailExtention: String, comicsAppearing: Int) {
        self.name = name
        self.description = description
        self.thumbnailPath = thumbnailPath
        self.thumbnailExtention = thumbnailExtention
        self.comicsAppearing = comicsAppearing
    }
}


extension Avenger {
    
    enum Keys: String {
        case name
        case description
        
        case thumbnail
        case thumbnailPath = "path"
        case thumbnailExtension = "extension"
        
        case comics
        case comicsAppearing = "available"
    }
    
    convenience init?(avengerDictionary: [String : Any]) {
        guard let name = avengerDictionary[Keys.name.rawValue] as? String,
              let description = avengerDictionary[Keys.description.rawValue] as? String,
              
              let thumbnailDict = avengerDictionary[Keys.thumbnail.rawValue] as? [String : Any],
              let thumbnailPath = thumbnailDict[Keys.thumbnailPath.rawValue] as? String,
              let thumbnailExtension = thumbnailDict[Keys.thumbnailExtension.rawValue] as? String,
              
              let comicsDict = avengerDictionary[Keys.comics.rawValue] as? [String : Any],
              let comicsAppearing = comicsDict[Keys.comicsAppearing.rawValue] as? Int else { return nil }
        
        self.init(name: name, description: description, thumbnailPath: thumbnailPath, thumbnailExtention: thumbnailExtension, comicsAppearing: comicsAppearing)
    }
}
