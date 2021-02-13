//
//  LoginViewManager.swift
//  ifengus_v20
//
//  Created by Alan Yang on 1/21/21.
//

import Foundation

struct isLoginResponse: Codable {
    let code: Int
    let msg: String
    let time: String
    let data: UserData?
}

struct UserData:Codable {
    let id: Int
    let username: String
    let nickname: String
    let mobile: String
    let avatar: String
    let score: Int
    let token: String
    let user_id: Int
    let createtime: Int
    let expiretime: Date
    let expires_in: Int
}

class LoginViewManager: ObservableObject {
    @Published var userInput: String = "" {
        didSet {
            //8位以上输入限制
            if userInput.trimmingCharacters(in: .whitespaces).count > 8 {
                self.userInput = oldValue
            }
        }
    }
    
    @Published var message: String = "message"
    init() {
        
    }
    
    
    
    


    
//    func loginVaild(username: String, password: String) -> String {
//        var rStr: String = "qqq1"
//        let urlStr = "https://www.68software.com/api/user/loginios?account=\(username.trimmingCharacters(in: .whitespaces))&password=\(password.trimmingCharacters(in: .whitespaces))"
//        guard let url = URL(string: urlStr) else {
//            rStr = "url isn't vaild"
//            fatalError("url isn't vaild")
//        }
//        let request = URLRequest.init(url: url)
//
//        rStr = "qqq3wefw"
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            rStr = "qqq11111111111"
//
//
//            if let error = error {
//                rStr = "qqq2"
//                //fatalError("Error: \(error.localizedDescription)")
//                rStr = "JSON error: \(error.localizedDescription)"
//
//            }
//            if let data = data{
//
//
//                do {
//
//                     let result = try JSONDecoder().decode(isLoginResponse.self, from: data)
//                    rStr = result.msg
//                    print(result.code)
//                    debugPrint(result.data?.username as Any)
//
//                    rStr = "qqq3"
//
//                } catch {
//                    rStr = "JSON error: \(error.localizedDescription)"
//                }
//
//            }
//            else {
//
//                rStr = "qq22q2"
//              //fatalError("Error: parse data error")
//                //debugPrint("Error: parse data error")
//                rStr = "Error: parse data error"
//
//            }
////            print(String(data: data, encoding: .utf8)!)
//            rStr = "qqq222"
//
//
//        }
//
//        rStr = rStr + String(describing: request)
//
//        return rStr
//    }
//
//
//    func loginvaildtest() -> String {
//        var icode:String = ""
//        icode = "test"
//        return icode
//    }
//
////
////    struct Response: Codable { // or Decodable
////      let foo: String
////    }
////
////
////  func getloginVaild(username: String, password: String) -> String {
////   var rStr: String = "qqq1"
////    if let url = URL(string: "https://www.68software.com/api/user/loginios?account=\(username.trimmingCharacters(in: .whitespaces))&password=\(password.trimmingCharacters(in: .whitespaces))") {
////       URLSession.shared.dataTask(with: url) { data, response, error in
////          if let data = data {
////              do {
////                 let res = try JSONDecoder().decode(Response.self, from: data)
////                rStr = res.foo
////              } catch let error {
////                rStr = error.localizedDescription
////              }
////           }
////       }.resume()
////    }
////        return rStr
////    }
//
    
}
