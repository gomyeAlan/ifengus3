//
//  ArchiveModel.swift
//  ifengus30
//
//  Created by Alan Yang on 2/14/21.
//

import SwiftUI

struct ArchiveModel: Codable, Identifiable,  Hashable {
    var id: Int
    var title: String
    var image: String
    var description: String
    var channel_id: Int
    var dislikes: Int
    var likes: Int
    var tags: String
    var createtime: Date
    var views: Int
    var url: String
    var fullurl: String
    var likeratio: Int
    var create_date: String
}

//无限加载扩展
extension RandomAccessCollection where Self.Element: Identifiable {
    public func isLastArchive<ArchiveModel: Identifiable>(_ archive: ArchiveModel) -> Bool {
            guard !isEmpty else {
                return false
            }
            
            guard let archiveIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(archive.id) }) else {
                return false
            }
            
            let distance = self.distance(from: archiveIndex, to: endIndex)
            return distance == 1
        }
}


//Json下载


struct responsedataArchive: Codable {
    let code: Int
    let msg: String
    let time: String
    let data: [ArchiveModel]?
}

class JSONArchivesModel: ObservableObject {
    @Published var archiveists: [ArchiveModel] = []
    
//    func fetchSessionData(archivesCompletionHandler: @escaping ([ArchiveModel]?, NetworeError?) -> Void) {
    func fetchSessionData(cid:Int, page: Int) {
        let url = "https://ifengus.com/api/cms/getArchivesList?apitoken=hiRNzRjQ!x2x@H@X"
        
        var json = [String:Any]()
        
        json["cid"] = cid
        json["limit"] = 10
        json["page"] = page
        json["type"] = "son"
        
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
                let archives = try JSONDecoder().decode(responsedataArchive.self, from: jsonData)
                if archives.code == 1 {
                    DispatchQueue.main.async {
                        self.archiveists += archives.data!
                    }
                } else {
//                    archivesCompletionHandler(nil, .unknown)
                    print("fetch data error\(archives.msg)")
                }
            } catch {
//                archivesCompletionHandler(nil, .requestFailed)
                print("Json data error\(error.localizedDescription)")
            }
        }).resume()
    }
}

enum NetworeError: Error {
    case badURL, requestFailed, unknown
}
