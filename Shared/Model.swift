//
//  Model.swift
//  PhotoViewerApp
//
//  Created by Пятин Дмитрий on 11.07.2020.
//

import Foundation

struct Photo: Identifiable, Decodable {
    var id: String
    var alt_description: String?
    var urls: [String : String]
}

class UnsplashData: ObservableObject {
    @Published var photoArray: [Photo] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        //0ed7a476e89087bb745625b9cb9e4127624391bab09898106f71cb79a82e4b07
        //"https://api.unsplash.com/photos/random/?count=20&client_id=xs6cGZ_LqhBu3cSukZk2RjEWMsUgx5NXypGBYaU-J74"
        //
        let key = "xs6cGZ_LqhBu3cSukZk2RjEWMsUgx5NXypGBYaU-J74"
        let url = "https://api.unsplash.com/photos/random/?count=20&client_id=\(key)"
        
        let session = URLSession(configuration: .default)
         session.dataTask(with: URL(string: url)!) { (data, _, error) in
            guard let data = data else {
                print("URLSession data error", error ?? "nil")
                return
            }
            
            do {
                let json = try JSONDecoder().decode([Photo].self, from: data)
                //print(json)
                for photo in json {
                    DispatchQueue.main.async {
                        self.photoArray.append(photo)
                    }
                }
                
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
