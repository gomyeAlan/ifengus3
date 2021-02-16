//
//  AppCarouseTodayBlock.swift
//  ifengus30
//
//  Created by Alan Yang on 2/8/21.
//

import SwiftUI

struct AppCarouseTodayBlock: View {
        @ObservedObject var contentListManager = ContentListManager()
        @StateObject var  jam = JSONArchivesModel()
        @State private var archivepage: Int = 1
    
    var body: some View {
        VStack {
            VStack {
                ChannelTopAdsBlock() //头部广告轮播
                if jam.archiveists.isEmpty {
                    ProgressView()
                        .onAppear(perform: {
                            jam.fetchSessionData(cid: 2, page: self.archivepage)
                        })
                } else {
                    //列表
                    ForEach(jam.archiveists, id: \.self){ archive in
                        ContentListBlockSmall(archive: archive)
                            .onAppear{
                                if self.jam.archiveists.isLastArchive(archive) {
                                    self.archivepage += 1
                                    jam.fetchSessionData(cid: 2, page: self.archivepage)
                                }
                            }
                            //display fetched JSON data...
                    }
                }
                AppTopNewBlock() // Top News 展示
                AppLarge3Block()
            }
            .onAppear {
                self.contentListManager.getListContent(from: 2)
            }
        }
    }
}




