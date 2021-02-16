//
//  CommonFuncModel.swift
//  ifengus30
//
//  Created by Winda Wei on 2/15/21.
//
/**
 * 公共函数
 */

import SwiftUI



/**
 *获取Json函数
 *Param
 *      @url
 *      @postJson  需要传递的参数
 *Return  @Data  需要自己解析Json数据 根据获取不同类别的格式
 */
public func getSessionJsonData(url: String, postJson: [String:Any], responseResult: @escaping (Data?, Error?) -> Void) {
     let postdata = try! JSONSerialization.data(withJSONObject: postJson, options: [])
     
     var request = URLRequest(url: URL(string: url)!)
     request.httpMethod = "POST"
     request.httpBody = postdata
     request.addValue("application/json", forHTTPHeaderField: "Content-Type")
     request.addValue("application/json", forHTTPHeaderField: "Accept")
 
     URLSession.shared.dataTask(with: request, completionHandler: { data,res,error  in
         guard let jsonData = data else {return}
         
         // checking for any internal api error...
         let response = res as! HTTPURLResponse
         // checking by status code...
         
         if response.statusCode == 404{
             print("error API Error")
         }
         DispatchQueue.main.async {
             responseResult(jsonData, nil)
         }
         
     }).resume()
 }
