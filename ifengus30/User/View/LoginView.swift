//
//  LoginView.swift
//  ifengus_v20
//
//  Created by Alan Yang on 1/20/21.
//

import SwiftUI
import CoreData


struct LoginView: View {
    @ObservedObject var accountmanager:AccountViewModel = AccountViewModel()
    @ObservedObject var loginmanager: LoginViewManager = LoginViewManager()
    @State var loginname = ""
    @State var password = ""
    @State var returnmsg = ""
    @State var result: String = ""
    @State var pwdinput: String = ""
    
   // @Binding var loginType: Int
    @State var isShowAlert = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    @State var isActiveReset = false
    @State var isShowLoading = false
    
    //coredata
    @FetchRequest(entity: Userinfo.entity(), sortDescriptors: []) var userresult: FetchedResults<Userinfo>
    @Environment(\.managedObjectContext) var usercontext
    
    var body: some View {
        
        ZStack{
            VStack{
//                if accountmanager.isFlag {
                if !userresult.isEmpty{
                            CircleImage(imageName: "Login", size: 120).padding()
                    Text("Name:\((self.userresult.first?.username)!)")
                                .font(.title)
                            Divider()
                            VStack(alignment: .leading) {
                                HStack(alignment: .top) {
                                    Text("Job Title")
                                        .font(.subheadline)
                                        .bold()
                                    Spacer()
                                    Text("Name")
                                        .font(.subheadline)
                                }.padding()
                                HStack(alignment: .top) {
                                    Text("Email Address")
                                        .font(.subheadline)
                                        .bold()
                                    Spacer()
                                    Text("emailAddress")
                                        .font(.subheadline)
                                }.padding()
                                HStack(alignment: .top) {
                                    Text("Phone Number")
                                        .font(.subheadline)
                                        .bold()
                                    Spacer()
                                    Text("\((self.userresult.first?.phonenumber)!)")
                                        .font(.subheadline)
                                }.padding()
                                HStack(alignment: .top) {
                                    Text("Region")
                                        .font(.subheadline)
                                        .bold()
                                    Spacer()
                                    Text("region")
                                        .font(.subheadline)
                                }.padding()
                            }
                            Spacer()
                    
                    Button(action: {
//                        self.accountmanager.isFlag.toggle()
                        self.returnmsg = ""
                        self.cleanUser()
                    }, label: {
                        Text("退出").frame(width: 360, height: 22, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding().background(Color.blue).foregroundColor(.white)
                            .cornerRadius(15)
                    }).padding()

                //login view
                } else {
                    Spacer()
                    VStack{
                        Image("Login").resizable().frame(width: 400, height: 300, alignment: .center)
                    }
                    Spacer()
                    
                    HStack{
                        Image(systemName: "person").foregroundColor(.gray).padding()
                        TextField("请输入用户名，长度为 3-10", text: $loginname).keyboardType(.namePhonePad)
                    }.overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal).foregroundColor(.gray)
                    
                    HStack{
                        Image(systemName: "lock").foregroundColor(.gray).padding()
                        SecureField("请输入密码，长度为 6-12", text: $password).keyboardType(.namePhonePad)
                        if password.count > 0 {
                            //没有密码
                            //EmptyView().modifier(Validation(value: password) { item in
                            //    return item.count > 5 && item.count < 16
                            //})
                        }
                    }.overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal).foregroundColor(.gray)
                    
                    HStack {
                        Spacer()
//                        NavigationLink(
//                            destination: ResetPaswordView(isActiveReset: $isActiveReset),
//                            isActive: $isActiveReset,
//                            label: {
//                                Text("新用户注册").foregroundColor(.blue)
//                            }).padding()
                        
//                        NavigationLink(
//                            destination: ResetPaswordView(isActiveReset: $isActiveReset),
//                            isActive: $isActiveReset,
//                            label: {
//                                Text("忘记密码").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                            }).padding()
                    }
                    Button(action: {
                        if loginname.isEmpty {
                            isShowAlert = true
                            alertTitle = "错误"
                            alertMessage = "用户名不能为空"
                        } else if password.isEmpty {
                            isShowAlert = true
                            alertTitle = "错误"
                            alertMessage = "请输入密码"
                        } else {
                            self.loginVaild(username: loginname, password: password)
                        }
                    }, label: {
                        Text("登录").frame(width: 360, height: 22, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding().background(Color.blue).foregroundColor(.white)
                            .cornerRadius(15)
                    }).padding()
                  //Text(loginmanager.returnmsg)
                    Text(self.returnmsg)
                        .disabled(self.returnmsg.isEmpty)
                    Spacer()
                }
            }
            
            VStack{
                VStack{
                }
            }.navigationBarTitle("登录")
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("确认")))
            }.disabled(isShowLoading)
            if isShowLoading {
            }
        }
     
    }
    
    func cleanUser() {
        if !self.userresult.isEmpty {
            for item in self.userresult {
                self.usercontext.delete(item)
            }
            do {
                try self.usercontext.save()
            } catch let error as NSError {
                print(error)
            }
        }
    }
    
    //登录认证函数
    func loginVaild(username: String, password: String) {
        let urlStr = "https://www.68software.com/api/user/loginios?account=\(username.trimmingCharacters(in: .whitespaces))&password=\(password.trimmingCharacters(in: .whitespaces))"
        guard let url = URL(string: urlStr) else {
            fatalError("url isn't vaild")
        }
        let request = URLRequest.init(url: url)
        //clean coredata
        self.cleanUser()
        
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
//                        self.accountmanager.isFlag = true
                        let userinfo = Userinfo(context: usercontext)
                        userinfo.username = deresponse.data!.username
                        userinfo.phonenumber = deresponse.data!.mobile
                        userinfo.isremember = false
                        userinfo.token = deresponse.data!.token
                        userinfo.didSave()
                        self.loginname = deresponse.data!.username
                    }
                }
                print(deresponse.msg)
                debugPrint(deresponse.code)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }

}

struct LoginView_Previews: PreviewProvider {
    @State static var loginType = 1
    static var previews: some View {
       // LoginView(loginType: $loginType)
        LoginView()

    }
}


//    List {
//        ForEach(userresult) { item in
//            Text("Item at \(item.username!)")
//        }
//    }
