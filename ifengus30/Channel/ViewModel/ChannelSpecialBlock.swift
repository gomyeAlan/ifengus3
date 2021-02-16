//
//  ListView.swift
//  ifengus_v20
//
//  Created by Alan Yang on 2/2/21.
//

import SwiftUI

struct ChannelSpecialBlock: View {
  @StateObject var specialManager = SpecialManager()
    
  var body: some View {
    List(specialManager.specials){ special in
        HStack() {
            Image(systemName: "dot.circle.and.cursorarrow")
                .frame(width: 24, height: 24)
                .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                NavigationLink(destination:SpecialListView(SpecialID: special.id)){
                    Text("\(special.title)")
                        .font(.system(size: 16))
                }
            }
        }
    }
    .padding(20)
  }
}


//    VStack(alignment: .leading) {
//        Text("热点专栏")
//            .font(.title3)
//            .bold()
//        Divider()
//        Group {

//                        NavigationLink(destination:TodayTabView()){

//        }
//    }
//    .frame(maxWidth: .infinity, alignment: .leading)
//    .padding()


