//
//  SpecialManager.swift
//  ifengus30
//
//  Created by Winda Wei on 2/15/21.
//

import Foundation


// 专题

struct isresponseSpecial: Codable {
    let code: Int
    let msg: String
    let time: String
    let data: [Specials]?
}

class SpecialManager: ObservableObject  {
    
    //建立一个集合
    @Published var specials = [Specials]()

//    var indices: Int = 0
    
    init(){
        getSpecialslName(pid:0)
    }
    
    func getSpecialslName(pid:Int) {
        let url = URL(string: "https://ifengus.com/api/cms/getspeciallist?apitoken=hiRNzRjQ!x2x@H@X")!
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode(isresponseSpecial.self, from: d)
                    if (decodedLists.code == 1){
                        DispatchQueue.main.async {
                            self.specials = decodedLists.data!
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
