//
//  MovieListViewController.swift
//  Movie List
//
//  Created by Jake Connerly on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    //
    // MARK: - IBOutlets & Properties
    //

    @IBOutlet weak var tableView: UITableView!
    
    var movieList: [Movie] = []
    
    //
    // MARK: - View Lifecycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }
    
    //
    // IBActions & Methods
    //

    @IBAction func addMovieButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    
    //
    // MARK: - Navigation
    //
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addMovieVC = segue.destination as? AddMovieViewController {
            addMovieVC.delegate = self
        }
    }
}

    //
    // MARK: - Extensions
    //

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else{ return UITableViewCell() }
        
        let movie = movieList[indexPath.row]
        cell.movie = movie
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movieList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension MovieListViewController: UITableViewDelegate {
    
}

extension MovieListViewController: AddMovieDelegate {
    func movieWasCreated(_ movie: Movie) {
        movieList.append(movie)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
