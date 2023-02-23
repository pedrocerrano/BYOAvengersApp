//
//  AvengerController.swift
//  Avengers
//
//  Created by iMac Pro on 2/22/23.
//

import Foundation

class AvengerController {
    
    static func fetchAvengerList(completion: @escaping ([Avenger]?) -> Void) {
        
// https://gateway.marvel.com/v1/public/characters?ts=1&apikey=68470b7b93879cefb8d99a7c5a5b6c0f&hash=2823b9ddec02040bbdd3b5a6ae2c70f9
        guard let baseURL = URL(string: Constants.AvengerURL.baseURL) else { completion(nil); return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let timestampQuery = URLQueryItem(name: Constants.APIKeys.timestampKey, value: Constants.APIKeys.timestampValue)
        let apiQuery       = URLQueryItem(name: Constants.APIKeys.apiKey, value: Constants.APIKeys.apiValue)
        let hashQuery      = URLQueryItem(name: Constants.APIKeys.hashKey, value: Constants.APIKeys.hashValue)
        urlComponents?.queryItems = [timestampQuery, apiQuery, hashQuery]
        
        guard let finalURL = urlComponents?.url else { completion(nil); return }
        print("Final URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { avengerData, response, error in
            if let error = error {
                print("Error in Avenger List request: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Avenger List Response Code: \(response.statusCode)")
            }
            
            guard let data = avengerData else { completion(nil); return }
            do {
                if let topLevel = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any],
                   let topLevelData = topLevel["data"] as? [String : Any],
                   let avengersArray = topLevelData["results"] as? [[String : Any]]  {
                    
                    let avengers = avengersArray.compactMap { Avenger(avengerDictionary: $0) }
                    completion(avengers)
                }
            } catch {
                print("Unable to retrieve Avenger List Data: \(error.localizedDescription)")
            }
        }.resume()
    }
}
