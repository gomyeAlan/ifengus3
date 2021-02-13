//
//  UserEntranceView.swift
//  ifengus30
//
//  Created by Alan Yang on 2/9/21.
//

import SwiftUI
import CoreData

struct UserEntranceView: View {
   // @Binding var selected:Int
    @ObservedObject var loginmanager: LoginViewManager = LoginViewManager()
    @StateObject private var imageLoader = CoverImageLoader()
    
    @State var username = ""
    @State var password = ""
    @State var returnmsg = ""
    @Environment(\.managedObjectContext) private var usercontainer
    
    // Fetching Data.....
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Userinfo.username, ascending: true)],
        animation: .default)
    private var userlist: FetchedResults<Userinfo>
    var body: some View {
        


        
        VStack{
//已经登录-------
            if !userlist.isEmpty {
                Form {
                Section {
                    
                    NavigationLink(
                      destination: UserEntranceView(),
                      label: {
                        HStack {
                            
                            if imageLoader.image != nil {
                            Image(uiImage: imageLoader.image!)
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding()
                            }
                          VStack (alignment: .leading, spacing: 5) {
                            Text("\(userlist.first!.username!)")
                              .font(.system(size: 25))
                          }
                        }.onAppear {
                            imageLoader.load("https://www.68software.com" + "\(userlist.first!.avatar!)")
                            print ("https://www.68software.com" + "\(userlist.first!.avatar!)")
                         }
                      }
                    )
                }
                }
                    Button(action: {
                        self.cleanUser()
                    }, label: {
                        Text("安全退出").frame(width: 300, height: 22, alignment: .center)
                            .padding().background(Color.blue).foregroundColor(.white)
                            .cornerRadius(15)
                    })
               
                
                
                
                
                
                
                //Text("username:\(userlist.first!.username!)")
               // Text("avatar:\(userlist.first!.avatar!)")
                Text("logindate:\(userlist.first!.logindate!)")
                Text("token:\(userlist.first!.token!)")
                Text("exprietime:\(userlist.first!.expiretime!)")
               
              
                
//已经登录 完成-------
                
            } else {
                Form {
                    
                    Section {
                        
                        NavigationLink(
                          destination: UserEntranceView(),
                          label: {
                            HStack {
                                Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 50))
                                .padding(.horizontal, 5)
                              
                              VStack (alignment: .leading, spacing: 5) {
                                Text("您还没有登录")
                                  .font(.system(size: 25))
                              }
                            }
                          }
                        )
                    }
                    
                    
                    Section {
                        HStack{
                            Image(systemName: "person").foregroundColor(.gray).padding()
                            TextField("请输入用户名，长度为 3-10", text: $username).keyboardType(.namePhonePad)
                        }.foregroundColor(.gray)
                        HStack{
                            Image(systemName: "lock").foregroundColor(.gray).padding()
                            SecureField("请输入密码，长度为 6-12", text: $password).keyboardType(.namePhonePad)
                        }.foregroundColor(.gray)
                     
                    }
                }
                   
//                        Button("Login") {
//                            self.loginVaild(username: username, password: password)
//                        }
                   
                        Button(action: {
                            self.loginVaild(username: username, password: password)
                        }, label: {
                            Text("登录").frame(width: 300, height: 22, alignment: .center)
                                .padding().background(Color.blue).foregroundColor(.white)
                                .cornerRadius(15)
                        })
                   
                    .disabled(username.isEmpty || password.isEmpty)
                    Spacer()
                    Text(self.returnmsg)
                        .disabled(self.returnmsg.isEmpty)
                }
            }
            Button("Test function") {
                print(String(infoForKey("BASE_URL")!) + infoForKey("UserLoginUrl")!)
            }
        }
    
    
    
    //登录认证函数
    func loginVaild(username: String, password: String) {
        let urlStr = String(infoForKey("BASE_URL")!) + infoForKey("UserLoginUrl")! + "?account=\(username.trimmingCharacters(in: .whitespaces))&password=\(password.trimmingCharacters(in: .whitespaces))"
        guard let url = URL(string: urlStr) else {
            fatalError("url isn't vaild")
        }
        let request = URLRequest.init(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
            guard let data = data else {
                fatalError("Error: parse data error")
            }
            do {
                let  deresponse = try JSONDecoder().decode(isLoginResponse.self, from: data)
                DispatchQueue.main.async {
                    self.returnmsg = deresponse.msg
                    if deresponse.code == 1 {
                        let user = Userinfo(context: self.usercontainer)
                        user.username = deresponse.data!.username
                        user.islogin = true
                        user.logindate = Date()
                        user.expiretime = deresponse.data!.expiretime
                        user.token = deresponse.data!.token
                        user.avatar = deresponse.data!.avatar
                        do {
                            try self.usercontainer.save()
                        } catch let error as NSError {
                            print(error)
                        }
                    }
                }
                print(deresponse.msg)
                debugPrint(deresponse.code)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    //清空Core Data Userinfo数据
    func cleanUser(){
        for user in self.userlist {
            self.usercontainer.delete(user)
        }
        do {
            try self.usercontainer.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    //验证用户登录信息是否有效
//    func vaildUser()
}
    

struct UserEntranceView_Previews: PreviewProvider {
    static var previews: some View {
        UserEntranceView()
    }
}




//struct TestsaveView: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//    @State private var show = UserDefaults.standard.bool(forKey: "Show")
//    @State private var showname = UserDefaults.standard.string(forKey: "Showname")
//    var body: some View {
//
//        VStack{
//            if self.show {
//                Text(self.showname!)
//            } else {
//                Text("please click this button")
//            }
//            Button(action: {
//                if self.show {
//                    self.show = false
//                    UserDefaults.standard.set(self.show, forKey: "Show")
//                } else {
//                    self.show = true
//                    UserDefaults.standard.set(self.show, forKey: "Show")
//                }
//
//                self.showname = "我在变化" + String(self.tapCount)
//                UserDefaults.standard.set(self.showname, forKey: "Showname")
//
//            }, label: {
//                Text("Click login")
//                .font(.title)
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//                })
//            Button("Tap count: \(tapCount)") {
//                self.tapCount += 1
//                UserDefaults.standard.set(self.tapCount, forKey: "Tap")
//                }
//            .font(.title)
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(10)
//        }
//    }
//}


//VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
//
//    Text("self.strtitle")
//    Spacer()
//}
//.navigationBarTitle("strtitle")
//.navigationBarBackButtonHidden(true)
//.navigationBarItems(leading: Button("aaa") {
//    self.presention.wrappedValue.dismiss()
//})
