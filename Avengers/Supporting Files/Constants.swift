//
//  Constants.swift
//  Avengers
//
//  Created by iMac Pro on 2/22/23.
//

import Foundation

struct Constants {
    
// https://gateway.marvel.com/v1/public/characters?ts=1&apikey=68470b7b93879cefb8d99a7c5a5b6c0f&hash=2823b9ddec02040bbdd3b5a6ae2c70f9
    struct AvengerURL {
        static let baseURL          = "https://gateway.marvel.com/v1/public/characters"
    }
    
    struct APIKeys {
        static let timestampKey     = "ts"
        static let timestampValue   = "1"
        
        static let apiKey           = "apikey"
        static let apiValue         = "68470b7b93879cefb8d99a7c5a5b6c0f"
        
        static let hashKey          = "hash"
        static let hashValue        = "2823b9ddec02040bbdd3b5a6ae2c70f9"
    }
    
}
