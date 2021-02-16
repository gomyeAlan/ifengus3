//
//  ifengus30App.swift
//  ifengus30
//
//  Created by Alan Yang on 2/6/21.
//

import SwiftUI
//搜索页面

struct SearchTabView: View {
    @State var text: String = ""
    @State var index = 0
    @Namespace var name
    var body: some View {
        VStack{
            CustomSearchBar(text: $text)
            HStack(spacing: 0){
                Button(action: {
                    withAnimation(.spring()){
                        index = 0
                    }
                }) {
                    VStack{
                        Text("栏目分类")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 0 ? .black : .gray)
                        ZStack{
                            // slide animation....
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame( height: 4)
                            if index == 0{
                                Capsule()
                                    .fill(Color(.gray))//"Color"
                                    .frame( height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
                Button(action: {
                    withAnimation(.spring()){
                        index = 1
                    }
                }) {
                    VStack{
                        Text("热点专题")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 1 ? .black : .gray)
                        ZStack{
                            // slide animation....
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame( height: 4)
                            if index == 1{
                                Capsule()
                                    .fill(Color(.gray))//"Color"
                                    .frame( height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                              }
                          }
                      }
                  }
              }
            // Changing Views Based On Index...
            if index == 0 {
                ChanneListlBlock()
            } else {
                ChannelSpecialBlock()
            }
            Spacer()
        }
    }
}



//@State var isAccountViewPresented = false
//
//


//NavigationView{



//    .navigationBarTitle("Menu")
//    .navigationBarItems(leading: SearchBar(text: $text), trailing: AccountButton(isAccountViewPresented: $isAccountViewPresented))
//
//



