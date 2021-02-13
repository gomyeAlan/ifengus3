//
//  ChannelManager.swift
//  ifengus_v20
//
//  Created by Alan Yang on 1/17/21.
//

import Foundation


// 栏目
struct isresponseChannel: Codable {
    let code: Int
    let msg: String
    let time: String
    let data: [Channels]?
}

class ChannelManager :ObservableObject  {
    
    //建立一个集合
    @Published var channels = [Channels]()
    var indices: Int = 0
    
    init(){
        getChannelName(pid:0)
    }
    
    func getChannelName(pid:Int) {

           let url = URL(string: "https://ifengus.com/api/cms/getsontree?pid=0&type=channel&apitoken=hiRNzRjQ!x2x@H@X")!

           URLSession.shared.dataTask(with: url) {(data,response,error) in
               do {
                   if let d = data {
                    let decodedLists = try JSONDecoder().decode(isresponseChannel.self, from: d)
                        if (decodedLists.code == 1){
                       DispatchQueue.main.async {
                           self.channels = decodedLists.data!
                       }
                    } else {
                            print("data build error")
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


// 专题

struct isresponseSpecial: Codable {
    let code: Int
    let msg: String
    let time: String
    let data: [Specials]?
}

class SpecialManager :ObservableObject  {
    
    //建立一个集合
    @Published var specials = [Specials]()

    var indices: Int = 0
    
    init(){
        getSpecialslName(pid:0)
    }
    
    func getSpecialslName(pid:Int) {
        let url = URL(string: "https://www.ifengus.com/api/cms/getspeciallist?apitoken=hiRNzRjQ!x2x@H@X")!

        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                 let decodedLists = try JSONDecoder().decode(isresponseSpecial.self, from: d)
                     if (decodedLists.code == 1){
                    DispatchQueue.main.async {
                        self.specials = decodedLists.data!
                        print ("Ewwwrror")
                    }
                 } else {
                         print("data build error")
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
