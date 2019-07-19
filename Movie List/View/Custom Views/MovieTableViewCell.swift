//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Jake Connerly on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    //
    // MARK: - IBOutlets & Properties
    //

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var seenButton: UIButton!
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
        
    }
    

    //
    // MARK: - IBActions & Methods
    //
    
    private func updateViews() {
        guard let movie = movie else { return }
        
        movieTitleLabel.text = movie.name
        
        if movie.seen == true {
            seenButton.setTitle("Seen", for: .normal)
        }else {
            seenButton.setTitle("Unseen", for: .normal)
        }

    }
    
    @IBAction func seenButtonTapped(_ sender: UIButton) {
        movie?.seen.toggle()
    }
}
