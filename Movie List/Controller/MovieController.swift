//
//  MovieController.swift
//  Movie List
//
//  Created by Jake Connerly on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class MovieController {
    
    var movieList: [Movie] = []
    
    private var persistantFileURL: URL? {
        let fileManager = FileManager.default
        
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return documents.appendingPathComponent("stars.plist")
    }
    
    init() {
        loadFromPersistantStore()
    }
    
    func saveToPersistantStore() {
        guard let url = persistantFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(movieList)
            try data.write(to: url)
        } catch {
            print("Error saving Movie List: \(error)")
        }
    }
    
    func loadFromPersistantStore() {
        let fileManager = FileManager.default
        guard let url = persistantFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            movieList = try decoder.decode([Movie].self, from: data)
        } catch {
            print("Error loading Movie List: \(error)")
        }
    }
}
