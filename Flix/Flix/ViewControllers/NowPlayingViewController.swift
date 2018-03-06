//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Sarah Villegas  on 1/31/18.
//  Copyright © 2018 Sarah Villegas . All rights reserved.
//

import UIKit
import AlamofireImage
import RappleProgressHUD

class NowPlayingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var MovieTableView: UITableView!
    @IBOutlet weak var LoadingActivityIndicator: UIActivityIndicatorView!
    var movies: [Movie] = []
    
    var refreshcontrol: UIRefreshControl!
    
    var loadingCircle: RappleActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshcontrol = UIRefreshControl()
        refreshcontrol.addTarget(self, action: #selector(NowPlayingViewController.loadToRefresh(_:)), for: .valueChanged)
        
        MovieTableView.insertSubview(refreshcontrol, at: 0)

        MovieTableView.dataSource = self
        MovieTableView.delegate = self
        
        MovieTableView.rowHeight = UITableViewAutomaticDimension
        MovieTableView.estimatedRowHeight = 30
        
        LoadingActivityIndicator.startAnimating()
        loadMovieContent()
        createTitleForNav()
        LoadingActivityIndicator.stopAnimating()
        
        
    }
    
    func createTitleForNav(){
        
        let navController = navigationController!
        
        let title = UIImage(named: "NowPlaying.png")!
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

    @objc func loadToRefresh(_ refreshControl: UIRefreshControl){
        loadMovieContent()
    }
    
    func loadMovieContent(){
        
        MovieApiManager().popularMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies
            {
                    self.movies = movies
                    self.MovieTableView.reloadData()
            }
        }
       self.LoadingActivityIndicator.stopAnimating()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(0.1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Makes rows based on total data recieved 
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for:indexPath) as! MovieCell
      cell.movie = movies[indexPath.row]
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! DetailsViewController
        
        let cell = sender as! UITableViewCell
        
        if let indexPath = MovieTableView.indexPath(for: cell){
            
            let layerDown = movies[indexPath.row]
            destinationViewController.movie = layerDown
        }
        
    }
    
    
}
