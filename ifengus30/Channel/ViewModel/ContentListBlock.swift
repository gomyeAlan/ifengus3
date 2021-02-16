//
//  ListManager.swift
//  ifengus_v20
//
//  Created by Alan Yang on 2/2/21.
//


import SwiftUI

struct ContentListBlock: View {
    
    @ObservedObject var contentListManager = ContentListManager()
    @StateObject var  jam = JSONArchivesModel()
    @State private var archivepage: Int = 1
    
    
    
    var channelID: Int
    var body: some View {

    
    VStack {
      VStack {
        AppTopNewBlock()
        if jam.archiveists.isEmpty {
                    ProgressView()
                            .onAppear(perform: {
                                jam.fetchSessionData(cid: self.channelID, page: self.archivepage)
                            })
                    } else {
                        ForEach(jam.archiveists, id: \.self){ archive in
                            ContentListBlockSmall(archive: archive)
                                .onAppear{
                                    if self.jam.archiveists.isLastArchive(archive) {
                                        self.archivepage += 1
                                        jam.fetchSessionData(cid: self.channelID, page: self.archivepage)
                                    }
                                }
                            //display fetched JSON data...
                    }
         }
        
//        ForEach(contentlistManager.contentLists){ contentList in
//     //         ContentListBlockSmall(contentLists: contentList)
//         }
        AppLarge3Block()
      }
//      .onAppear {
// //       self.contentlistManager.getListContent(from: channelID)
//    }
    }
  }
}


//struct AppCarrouselExtraLargeBlock_Previews: PreviewProvider {
//  static var previews: some View {
//    AppCarouselExtraLargeBlock()
//  }
//}
