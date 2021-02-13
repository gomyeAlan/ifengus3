//
//  ListManager.swift
//  ifengus_v20
//
//  Created by Alan Yang on 2/2/21.
//

import Foundation


struct ContentLists: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var image: String
    public var description: String
    public var fullurl: String
    public var channel_id: Int
    public var likes: Int
    public var views: Int
    //public var comments: Int
    public var url: String
    
   
   enum ListsKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case image = "image"
        case description = "description"
        case fullurl = "fullurl"
        case channel_id = "channel_id"
        case likes = "likes"
        case views = "views"
       // case comments = "comments"
        case url = "url"

       }
}

struct isresponseLists: Codable {
    let code: Int
    let msg: String
    let time: String
    let data: [ContentLists]?
}



//建立一个集合
class ContentListManager :ObservableObject  {
    
    //建立一个集合
    @Published var contentLists = [ContentLists]()
//        init(){
//            getListContent(from:2)
//        }
    
    func getListContent(from channelID:Int) {
        let url = URL(string: "https://ifengus.com/api/cms/getArchivesList?cid=\(channelID)&limit=10&page=1&type=sons&apitoken=hiRNzRjQ!x2x@H@X")!
       URLSession.shared.dataTask(with: url) {(data,response,error) in
           do {
            if let d = data {
                let decodedLists = try JSONDecoder().decode(isresponseLists.self, from: d)
                if (decodedLists.code == 1){
                    DispatchQueue.main.async {
                        self.contentLists = decodedLists.data!
                        
                        print(self.contentLists.count)

                    }
                } else {
                    print("data build error")
                }
            } else {
               print("No Data")
            }
           } catch {
               print ("Error")
           }
       }.resume()
  
    }
}






//专题内容

struct SpecialLists: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var image: String
    public var description: String
    public var fullurl: String
    public var channel_id: Int
    public var likes: Int
    public var views: Int
    //public var comments: Int
    public var url: String
    
   
   enum ListsKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case image = "image"
        case description = "description"
        case fullurl = "fullurl"
        case channel_id = "channel_id"
        case likes = "likes"
        case views = "views"
       // case comments = "comments"
        case url = "url"

       }
}

struct isresponseSpecialList: Codable {
    let code: Int
    let msg: String
    let time: String
    let data: [SpecialLists]?
}


class ContentSpecialManager :ObservableObject  {
    
    //建立一个集合
 var specialLists = [SpecialLists]()

    func getSpecialContent(from SpecialID:Int) {
        let url = URL(string: "https://www.ifengus.com/api/cms/getspecialarchiveslist?sid=\(SpecialID)&limit=10&page=1&apitoken=hiRNzRjQ!x2x@H@X")!
       URLSession.shared.dataTask(with: url) {(data,response,error) in
           do {
            if let d = data {
                let decodedSpecialLists = try JSONDecoder().decode(isresponseSpecialList.self, from: d)
                if (decodedSpecialLists.code == 1){
                    DispatchQueue.main.async {
                        self.specialLists = decodedSpecialLists.data!
                    }
                } else {
                    print("data build error")
                }
            } else {
               print("No Data")
            }
           } catch {
               print ("Error")
           }
        //print(url)
       }
       .resume()
  
    }
}





//建立一个广告集合

struct TopAds: Codable, Identifiable {
   public var id: Int
   public var title: String
   public var image: String
   
   enum CodingKeys: String, CodingKey {
          case id = "id"
          case title = "title"
          case image = "image"
   
       }
}

struct isresponseTopAds: Codable {
    let code: Int
    let msg: String
    let time: String
    let data: [TopAds]?
}
//
//class ContentTopAds :ObservableObject  {
//
//    var topAds = [TopAds]()
////    init(){
////        getListContentTopAds()
////    }
//
//    //func getListContent(from channelID:Int) {
//    func getListContentTopAds(from channelID:Int) {
//        let url = URL(string: "https://www.ifengus.com/api/cms/gettoparchives?limit=3&apitoken=hiRNzRjQ!x2x@H@X")!
//       URLSession.shared.dataTask(with: url) {(data,response,error) in
//           do {
//            if let d = data {
//                let decodedListstopAds = try JSONDecoder().decode(isresponseTopAds.self, from: d)
//                if (decodedListstopAds.code == 1){
//                    DispatchQueue.main.async {
//                        self.topAds = decodedListstopAds.data!
//                        print ("----333---")
//                        print(self.topAds.count)
//                    }
//                } else {
//                    print("data build error")
//                }
//            } else {
//               print("No Data")
//            }
//           } catch {
//               print ("Error")
//           }
//        print ("--------------")
//        print(self.topAds.count)
//       }
//       .resume()
//
//    }
//}


func getListContentTopAds(from channelID:Int, responseData: @escaping (isresponseTopAds?, Error?) -> Void) {
        let url = URL(string: "https://www.ifengus.com/api/cms/gettoparchives?limit=3&apitoken=hiRNzRjQ!x2x@H@X")!
       URLSession.shared.dataTask(with: url) {(data,response,error) in
           do {
            if let d = data {
                let decodedListstopAds = try JSONDecoder().decode(isresponseTopAds.self, from: d)
                if (decodedListstopAds.code == 1){
                    responseData(decodedListstopAds, nil)
                    print ("----333---")
                    print(decodedListstopAds.data?.count as Any)
                } else {
                    print("data build error")
                }
            } else {
               print("No Data")
            }
           } catch let Err {
               print ("Error")
                responseData(nil, Err)
           }
       }
       .resume()
  
    }

//广告集合完成
