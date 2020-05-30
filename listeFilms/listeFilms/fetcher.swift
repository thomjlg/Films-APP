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
    @Published var isShow: Bool = false
    @Published var note: Double = 0
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://gist.githubusercontent.com/thomjlg/0782e9e8e27c346af3600bff9923f294/raw/514bf34829d8ce964bd1182430dacc8a6ff2fe66/films2.json")!
    
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
