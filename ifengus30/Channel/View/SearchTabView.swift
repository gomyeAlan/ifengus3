//
//  ifengus30App.swift
//  ifengus30
//
//  Created by Alan Yang on 2/6/21.
//

import SwiftUI
//搜索页面


struct SearchTabView: View {
  @State var isAccountViewPresented = false
  @State var text: String = ""
  
  var body: some View {
    NavigationView {
      ScrollView {
        CustomSearchBar(text: $text)
        ChannelSpecialBlock()
        Spacer()
        //栏目列表
        ChanneListlBlock()
      }
      .navigationBarTitle("Search")
      .navigationBarItems(leading: SearchBar(text: $text), trailing: AccountButton(isAccountViewPresented: $isAccountViewPresented))
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}


struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView()
    }
}
