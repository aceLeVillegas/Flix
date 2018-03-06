	//
//  Movie.swift
//  Flix
//
//  Created by angel gonzalez on 3/5/18.
//  Copyright © 2018 Sarah Villegas . All rights reserved.
//

import Foundation
class Movie {
    var title: String
    var posterUrl: URL?
    var release: String
    var overview: String
    var backDropURL: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        
        // Set the rest of the properties
        let partOfURL = "https://image.tmdb.org/t/p/w500"
        
        release = dictionary["release_date"] as? String ?? "No Release Date"
        overview = dictionary["overview"] as? String ?? "No overview"
        let backdropPathing = dictionary["backdrop_path"] as! String
        let posterPathing = dictionary["poster_path"] as! String
        
        backDropURL = URL(string: partOfURL + backdropPathing)
        posterUrl = URL(string: partOfURL + posterPathing)
    }
    class func movies(dictionaries: [[String: Any]]) -> [Movie]
    {
        var movies: [Movie] = []
        for dictionary in dictionaries
        {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
