//
//  fetcher.swift
//  listeFilms
//
//  Created by Thomas JAULGEY on 24/05/2020.
//  Copyright © 2020 Thomas JAULGEY. All rights reserved.
//

import Foundation

public class MovieFetcher: ObservableObject {
    func save(movies: [Movie]) {

        OperationQueue().addOperation {

            do {
                let encoded = try JSONEncoder().encode(movies)
                let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

                do {
                    try encoded.write(to: url[0].appendingPathComponent("movies"))
                    print("saved to ", url[0])
                } catch {
                    print(error)
                }

            } catch {
                print(error)
            }
        }
    }

    func load(completion: @escaping (([Movie]?) -> () )) {

        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        do {
            if let data = try? Data(contentsOf: urls[0].appendingPathComponent("movies")) {

                let decodedLists = try JSONDecoder().decode([Movie].self, from: data as Data)
                DispatchQueue.main.async {
                    completion(decodedLists)
                }


            } else {
                loadFromJson(completion: completion)
            }
        } catch {
            print(error)
            completion(nil)
        }
    }

    func loadFromJson(completion: @escaping (([Movie]?) -> () )) {

        let url = URL(string: "https://gist.githubusercontent.com/thomjlg/0782e9e8e27c346af3600bff9923f294/raw/e0e8fc74e9ad549f21b0fb59836dc29ddfb611a2/films2.json")!

        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Movie].self, from: d)
                    DispatchQueue.main.async {
                        completion(decodedLists)
                    }
                }else {
                    print("No Data")
                    completion(nil)
                }
            } catch {
                print ("Error")
                completion(nil)
            }

        }.resume()
    }
}
