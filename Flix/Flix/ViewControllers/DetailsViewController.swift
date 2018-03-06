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
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createTitleForNav()
        
        if let movie = movie{
            
            movieTitleLabel.text = movie.title
            releaseDateLabel.text = movie.release
            descriptionLabel.text = movie.overview
            
            // Setting images for Poster and Back Drop
            posterImageView.af_setImage(withURL: movie.posterUrl!)
            backDropImageView.af_setImage(withURL: movie.backDropURL!)
            
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
