//
//  JSONViewModel.swift
//  CoreJSON
//
//  Created by Alan Yang on 2/13/21.
//

import SwiftUI
import CoreData

//建立一个广告集合

struct TopAds: Codable, Hashable{
    var id: Int
    var url: String
    var title: String
    var image: String
}

struct responsewebdata: Codable {
    let code: Int
    let msg: String
    let time: String
    let data: [TopAds]?
}
  

class JSONViewModel: ObservableObject {
    @Published var topAds : [TopAds] = []
    
    // saving jSON to Core Data...
    func saveData(context: NSManagedObjectContext){
        
        topAds.forEach{ (data) in
            
            let entity = Topadsinfo(context: context)
            entity.id = Int16(data.id)
            entity.title = data.title
        //    entity.channel_id = Int16(data.channel_id)
            entity.url = data.url
            entity.image = data.image
        }
        
        // saving all pending data at once...
        do{
            try context.save()
            print("success")
        }
        catch{
            print(error.localizedDescription)
        }
    }

    func fetchData(context: NSManagedObjectContext){
        
        let url = "https://ifengus.com/api/cms/getblocklist?apitoken=hiRNzRjQ!x2x@H@X"
        var request = URLRequest(url: URL(string: url)!)
        
        request.addValue("swiftui2.0", forHTTPHeaderField: "field")
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, res, _) in
            guard let jsonData = data else{return}
            
            // checking for any internal api error..
            let response = res as! HTTPURLResponse
            
            // checking by status code...
            
            if response.statusCode == 404 {
                print("error API Error")
                return
            }
            
            // fetching JSON Data...
            do {

                let archives = try JSONDecoder().decode(responsewebdata.self, from: jsonData)
                if archives.code == 1 {
                    DispatchQueue.main.async {
                    self.topAds = archives.data!
                    self.saveData(context: context)
                    }
          
                }else {
                    print("fetch data error\(archives.msg)")
                }
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        .resume()
        
    }
}

