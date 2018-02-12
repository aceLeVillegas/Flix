//
//  SuperheroViewController.swift
//  Flix
//
//  Created by Sarah Villegas  on 2/11/18.
//  Copyright © 2018 Sarah Villegas . All rights reserved.
//

import UIKit

enum MovieKeys{
    
    static let title = "title"
    static let backDorp = "backdrop_path"
    static let poster = "poster_path"
    static let description = "overview"
    static let releaseDate = "release_date"
    static let results = "results"
}


class SuperheroViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var superHeroCollectionView: UICollectionView!
    var movies: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        superHeroCollectionView.dataSource = self
        
        createTitleForNav()
        loadMovieContent()
        spaceItems()
        
    }
    func spaceItems(){
        
        let layout = superHeroCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine: CGFloat = 3
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerLine - 1 )
        let width = superHeroCollectionView.frame.size.width / cellsPerLine - interItemSpacingTotal / cellsPerLine
        layout.itemSize = CGSize(width: width, height: width * 3/2)
    }
    func createTitleForNav(){
        
        let navController = navigationController!
        
        let title = UIImage(named: "SuperHero.png")!
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = superHeroCollectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        
        // Create Poster images from URL
        if let posterpath = movie[MovieKeys.poster] as? String{
            
            let baseURL = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURL + posterpath)!
            
            // Set Poster image to cell
            cell.posterImageView.af_setImage(withURL: posterURL)
        }
        return cell
    }
    
    func loadMovieContent(){
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // runs when the network request returns
            if let error = error{
                print(error.localizedDescription)
            }
            else if let data = data {
                
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                // Parsing through data to get titles or movies
                let movies = dataDictionary[MovieKeys.results] as! [[String:Any]]
                self.movies = movies
                
                //Layout is set up before API is returned
                //Must reload so data will display
                self.superHeroCollectionView.reloadData()
               // self.refreshcontrol.endRefreshing()
            }
        }
        task.resume()
    }

}
