//
//  JSONArchiveModel.swift
//  ifengus30
//
//  Created by Alan Yang on 2/15/21.
//

import SwiftUI


struct responsewebarchivedata: Codable {
    let code: Int
    let msg: String
    let time: String
    let data: ArchiveModel
}

//class JSONArchiveModel: ObservableObject {
    
    //fetch single archive
     func fetchArchiveData(cid: Int, archivesCompletionHandler: @escaping (ArchiveModel?, Error?) -> Void) {
        let url = "https://ifengus.com/api/cms/getArchive?apitoken=hiRNzRjQ!x2x@H@X"
        
        var json = [String:Any]()
        
        json["aid"] = cid
        
        let postdata = try! JSONSerialization.data(withJSONObject: json, options: [])
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.httpBody = postdata
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, res, error in
            guard let jsonData = data else {return}
            
            // checking for any internal api error...
            let response = res as! HTTPURLResponse
            // checking by status code...
            
            if response.statusCode == 404{
                print("error API Error")
            }
            
            //fetching JSON Data....
            do {
                let archive = try JSONDecoder().decode(responsewebarchivedata.self, from: jsonData)
                if archive.code == 1 {
                    DispatchQueue.main.async {
//                        self.archive = archive.data
                        archivesCompletionHandler(archive.data, nil)
                    }
                } else {
    //                    archivesCompletionHandler(nil, .unknown)
                    print("fetch data error\(archive.msg)")
                }
            } catch {
    //                archivesCompletionHandler(nil, .requestFailed)
                print("Json data error\(error.localizedDescription)")
            }
        }).resume()
    }
//}
