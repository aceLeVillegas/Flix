//
//  DetailsViewController.swift
//  Flix
//
//  Created by Sarah Villegas  on 2/5/18.
//  Copyright © 2018 Sarah Villegas . All rights reserved.
//

import UIKit
import AlamofireImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createTitleForNav()
        
        if let movie = movie{
            
            // Setting Labels for Title, Release Date, and Description
            movieTitleLabel.text = movie[MovieKeys.title] as? String
            releaseDateLabel.text = movie[MovieKeys.releaseDate] as? String
            descriptionLabel.text = movie[MovieKeys.description] as? String
            
            // Create images for Poster and Back Drop
            let backDrop = movie[MovieKeys.backDorp] as! String
            let poster = movie[MovieKeys.poster] as! String
            let baseURL = "https://image.tmdb.org/t/p/w500"
            
            let backDropURL = URL(string: baseURL + backDrop)!
            let posterURL = URL(string: baseURL + poster)!
            
            // Setting images for Poster and Back Drop
            posterImageView.af_setImage(withURL: posterURL)
            backDropImageView.af_setImage(withURL: backDropURL)
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTitleForNav(){
        
        let navController = navigationController!
        
        let title = UIImage(named: "Details.png")!
        let imageView = UIImageView(image:title)
        
        // Center image for Navigation Bar
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        // Center X and Y coordinates on Navigation Bar
        let bannerX = bannerWidth / 2 - title.size.width / 2
        let bannerY = bannerHeight / 2 - title.size.width / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
        
    }
    

}
