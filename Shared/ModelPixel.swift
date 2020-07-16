//
//  ModelPixel.swift
//  PhotoViewerApp
//
//  Created by Пятин Дмитрий on 13.07.2020.
//

import Foundation

struct HitResponse: Codable {
    var total: Int
    var totalHits: Int
    var hits: [HitObject]
}

struct HitObject: Identifiable, Codable {
    var id: Int
    var previewURL: String
    var tags: String
}
 

class PixelData: ObservableObject {
    @Published var photoArray: [HitObject] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        // https://pixabay.com/api/?key=12169393-c73621fb8fde92ee029635ac1&image_type=photo&pretty=true
        let key = "12169393-c73621fb8fde92ee029635ac1"
        let url = "https://pixabay.com/api/?key=\(key)&image_type=photo&pretty=true"
        
        let session = URLSession(configuration: .default)
         session.dataTask(with: URL(string: url)!) { (data, _, error) in
            guard let data = data else {
                print("URLSession data error", error ?? "nil")
                return
            }

            do {
                let json = try JSONDecoder().decode(HitResponse.self, from: data)
                //print(json.hits)
                for photo in json.hits {
                    DispatchQueue.main.async {
                        self.photoArray.append(photo)
                        print(self.photoArray)
                    }
               }
                                
            } catch {
                print(error.localizedDescription + "!!!!")
            }
        }.resume()
    }
}

/*
 {
     "total":1084351,
     "totalHits":500,
     "hits":[
         {
             "id":5383056,
             "pageURL":"https://pixabay.com/photos/daisy-flower-lake-nature-summer-5383056/",
             "type":"photo",
             "tags":"daisy, flower, lake",
             "previewURL":"https://cdn.pixabay.com/photo/2020/07/08/08/07/daisy-5383056_150.jpg",
             "previewWidth":150,
             "previewHeight":100,
             "webformatURL":"https://pixabay.com/get/53e3dd404a57aa14f1dc84609629357f1336ddec504c704c7c2b7dd1954cc251_640.jpg",
             "webformatWidth":640,
             "webformatHeight":427,
             "largeImageURL":"https://pixabay.com/get/53e3dd404a57aa14f6da8c7dda79367c1439d7e65a526c4870267fd2924fc45fb1_1280.jpg",
             "imageWidth":4692,
             "imageHeight":3128,
             "imageSize":3386770,
             "views":21065,
             "downloads":15227,
             "favorites":42,
             "likes":90,
             "comments":17,
             "user_id":3508087,
             "user":"kucukgulberkan",
             "userImageURL":"https://cdn.pixabay.com/user/2020/07/08/07-32-00-69_250x250.jpg"
         }
 */
 
