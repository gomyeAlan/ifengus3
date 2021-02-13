//
//  SpecialListView.swift
//  ifengus30
//
//  Created by Alan Yang on 2/10/21.
// 专题内容列表页面

import SwiftUI

struct SpecialListView: View {
    
    
    var SpecialID: Int
    @ObservedObject var contentSpecialManager = ContentSpecialManager()
    
        var body: some View {

            ScrollView {
     
                setupCurrentDate(by: 0)
                
                  VStack {
                     AppTopNewBlock()
                    ForEach(contentSpecialManager.specialLists){ specialList in
                        SpecialListBlockSmall(specialLists: specialList)
                     }.onAppear {
                        self.contentSpecialManager.getSpecialContent(from: SpecialID)
                    }
                  AppLarge3Block()
                  }
           
            }.navigationBarTitle("\(SpecialID)", displayMode: .inline)
        }
    
    func setupCurrentDate(by index: Int) -> AnyView {
      let date = Calendar.current.date(byAdding: .day, value: index, to: Date())
      return index == 0 ? AnyView(NavigationViewHeaderWithImageBlock(date: date!)) : AnyView(NavigationViewHeaderBlock(date: date!))
    }
        
  }

//struct SpecialListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpecialListView()
//    }
//}
