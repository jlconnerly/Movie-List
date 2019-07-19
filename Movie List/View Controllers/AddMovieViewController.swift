//
//  AddMovieViewController.swift
//  Movie List
//
//  Created by Jake Connerly on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//
// MARK: - Protocols
//

protocol AddMovieDelegate {
    func movieWasCreated(_ movie: Movie)
}

class AddMovieViewController: UIViewController {
    
    //
    // MARK: - IBOutlets & Properties
    //

    @IBOutlet weak var addMovieTextField: UITextField!
    
    var delegate: AddMovieDelegate?
    
    //
    // MARK: - IBActions and Methods
    //

    @IBAction func addMovieButtonTapped(_ sender: UIButton) {
        
        guard let movieName = addMovieTextField.text else { return }
        
        let movie = Movie(name: movieName)
        
        delegate?.movieWasCreated(movie)
    }

}
