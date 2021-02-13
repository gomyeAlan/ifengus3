//
//  ListView.swift
//  ifengus_v20
//
//  Created by Alan Yang on 2/2/21.
//

import SwiftUI

struct ChannelSpecialBlock: View {
    
  @ObservedObject var specialManager = SpecialManager()
    
  var body: some View {
    VStack(alignment: .leading) {
      Text("热点专栏")
        .font(.title3)
        .bold()
      
      Divider()
      
      Group {
        
        ForEach(specialManager.specials){ special in
            HStack() {
                
            Image(systemName: "dot.circle.and.cursorarrow")
               .frame(width: 24, height: 24)
               .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                NavigationLink(destination:SpecialListView(SpecialID: special.id)){

                    //NavigationLink(destination:TodayTabView()){
                   Text("\(special.title)")}
               .font(.system(size: 16))
             }

             Spacer()
            
            
            Divider()
         }
        
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
  }
}


struct DiscoverBlock_Previews: PreviewProvider {
    static var previews: some View {
        ChannelSpecialBlock()
    }
}



