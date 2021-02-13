//
//  ListView.swift
//  ifengus_v20
//
//  Created by Alan Yang on 2/2/21.
//

import SwiftUI
import UIKit

struct ChannelListView: View {

    var channelID: Int
    
    var body: some View {
        
        ScrollView {
            ContentListBlock(channelID: channelID)
        }
     
         //   .navigationBarTitle("\(channelID)", displayMode: .inline)
        
        }
    }

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(channelID: 2)
//    }
//}
