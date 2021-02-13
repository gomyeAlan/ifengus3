//
//  AppCarouseTodayBlock.swift
//  ifengus30
//
//  Created by Alan Yang on 2/8/21.
//

import SwiftUI

struct AppCarouseTodayBlock: View {

   @ObservedObject var contentListManager = ContentListManager()

      var body: some View {
        VStack {
          VStack {
            //AppTopNewBlock()

            //头部广告轮播
           ChannelTopAdsBlock()
            
            //列表
            ForEach(contentListManager.contentLists){ contentList in
                ContentListBlockSmall(contentLists: contentList)
            }
            
            
            AppLarge3Block()
          }.onAppear {
            self.contentListManager.getListContent(from: 2)
        }
        }
      }
    }
