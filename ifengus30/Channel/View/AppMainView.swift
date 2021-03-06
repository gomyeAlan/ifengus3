//
//  ifengus30App.swift
//  ifengus30
//
//  Created by Alan Yang on 2/6/21.
//

import SwiftUI

struct AppMainView: View {
    @State var isAccountViewPresented = false
    @State var text: String = ""
    
  var body: some View {
    NavigationView{
        TabView {
            TodayTabView()
                .tabItem {
                    Image(systemName: "note")
                    Text("New")
                }
            SearchTabView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
//            FavoriteTabView()
//                .tabItem {
//                    Image(systemName: "heart")
//                    Text("Favorite")
//                }
//            AppsTabView()
//                .tabItem {
//                    Image(systemName: "person")
//                    Text("Profile")
//                }
//            ArcadeTabView()
//                .tabItem {
//                    Image(systemName: "gamecontroller.fill")
//                    Text("Arcade")
//                }
        }.navigationViewStyle(StackNavigationViewStyle())
         .navigationBarItems(trailing: AccountButton(isAccountViewPresented: $isAccountViewPresented))
    }
  }
}




