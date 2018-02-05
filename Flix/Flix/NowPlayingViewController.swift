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

class NowPlayingViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var MovieTableView: UITableView!
    
    @IBOutlet weak var LoadingActivityIndicator: UIActivityIndicatorView!
    var movies: [[String:Any]] = []
    
    var refreshcontrol: UIRefreshControl!
    
    var loadingCircle: RappleActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshcontrol = UIRefreshControl()
        refreshcontrol.addTarget(self, action: #selector(NowPlayingViewController.loadToRefresh(_:)), for: .valueChanged)
        
        MovieTableView.insertSubview(refreshcontrol, at: 0)

        MovieTableView.dataSource = self
        
        //loadingCircle.startAnimating(attributes: RappleModernAttributes)
        
        LoadingActivityIndicator.startAnimating()
        loadMovieContent()
        //LoadingActivityIndicator.stopAnimating()
        //loadingCircle.stopAnimating()
    }
    
    @objc func loadToRefresh(_ refreshControl: UIRefreshControl){
        loadMovieContent()
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
                let movies = dataDictionary["results"] as! [[String:Any]]
                self.movies = movies
                
                //Layout is set up before API is returned
                //Must reload so data will display
                self.MovieTableView.reloadData()
                self.refreshcontrol.endRefreshing()
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Makes rows based on total data recieved 
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MovieTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        // Sort data
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let description = movie["overview"] as! String
        
        // Build full URL to retrieve image
        let posterImgName = movie["poster_path"] as! String
        let baseURL = "https://image.tmdb.org/t/p/w500"
        let posterURL = URL(string: baseURL + posterImgName)!
        
        // Set Cell image for the movie poster
        cell.posterImageView.af_setImage(withURL: posterURL)
        
        
        // Set Cell values to associated labels
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        
        
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
