//
//  ListManager.swift
//  ifengus_v20
//
//  Created by Alan Yang on 2/2/21.
//


import SwiftUI

struct ContentListBlock: View {
    
    @ObservedObject var contentlistManager = ContentListManager()
    
    var channelID: Int
    var body: some View {

    
    VStack {
      VStack {
        AppTopNewBlock()
        ForEach(contentlistManager.contentLists){ contentList in
              ContentListBlockSmall(contentLists: contentList)
         }
        AppLarge3Block()
      }.onAppear {
        self.contentlistManager.getListContent(from: channelID)
    }
    }
  }
}


//struct AppCarrouselExtraLargeBlock_Previews: PreviewProvider {
//  static var previews: some View {
//    AppCarouselExtraLargeBlock()
//  }
//}
