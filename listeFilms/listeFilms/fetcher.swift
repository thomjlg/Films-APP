//
//  fetcher.swift
//  listeFilms
//
//  Created by Thomas JAULGEY on 24/05/2020.
//  Copyright © 2020 Thomas JAULGEY. All rights reserved.
//

import Foundation

public class MovieFetcher: ObservableObject {
    @Published var movies = [Movie]()
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "http://t.jaulgey.free.fr/xcode/source/movies.json")!
    
        if let filepath = Bundle.main.path(forResource: "movies", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                print(contents)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Movie].self, from: d)
                    DispatchQueue.main.async {
                        self.movies = decodedLists
                    }
                }else {
                    print("No Data")
                }
            } catch {
                print ("Error")
            }
            
        }.resume()
         
    }
}
