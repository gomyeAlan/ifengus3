//
//  ifengus30App.swift
//  ifengus30
//
//  Created by Alan Yang on 2/6/21.
//

import SwiftUI


struct ChanneListlBlock: View {
  @ObservedObject var channelmanager = ChannelManager()

    
    
  var body: some View {
    VStack(alignment: .leading) {
      Text("栏目分类")
        .font(.title3)
        .bold()
      
      ForEach(channelmanager.channels) {channel in
        Divider()
        //AppSmall1Block()
        
        // 目录ID循环
        HStack {
         Image(systemName: "dot.circle.and.cursorarrow")
            .frame(width: 24, height: 24)
            .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)

          VStack(alignment: .leading) {
            NavigationLink(destination:ChannelListView( channelID: channel.id )){
                Text("\(channel.name)")
                         }
            .font(.system(size: 16))
          }

          Spacer()

          VStack {
            
            Button("查看子目录 >") {}
              .font(Font.system(.caption).bold())
              .padding(.horizontal, 24)
              .padding(.vertical, 6)
              .background(Color(UIColor.systemGray6))
              .clipShape(Capsule())
          }
        }
        // 目录ID循环结束

        
      }
    }
    .padding(20)
  }
}


struct SuggestedAppsBlock_Previews: PreviewProvider {
    static var previews: some View {
        ChanneListlBlock()
    }
}
