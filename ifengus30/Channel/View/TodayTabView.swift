//
//  ifengus30App.swift
//  ifengus30
//
//  Created by Alan Yang on 2/6/21.
//

import SwiftUI


struct TodayTabView: View {
    @State var isAccountViewPresented = false
    @State var text: String = ""

    var body: some View {
    
   // NavigationView{
    ScrollView {
        CustomSearchBar(text: $text)
        //setupCurrentDate(by: 0)
         AppCarouseTodayBlock()
        
        //        ChannelTopAdsBlock()
        }
//    .onAppear{
//        print("scrollview======")
//    }
    .navigationBarTitle("Search")
    .navigationBarItems(leading: SearchBar(text: $text), trailing: AccountButton(isAccountViewPresented: $isAccountViewPresented))
       
    //  }    .navigationViewStyle(StackNavigationViewStyle())

    }

    
//    func setupCurrentDate(by index: Int) -> AnyView {
//      let date = Calendar.current.date(byAdding: .day, value: index, to: Date())
//      return index == 0 ? AnyView(NavigationViewHeaderWithImageBlock(date: date!)) : AnyView(NavigationViewHeaderBlock(date: date!))
//    }
}

struct TodayTabView_Previews: PreviewProvider {
  static var previews: some View {
    TodayTabView()
  }
}