//
//  ifengus30App.swift
//  ifengus30
//
//  Created by Alan Yang on 2/6/21.
//

import SwiftUI


struct AppMainView: View {
  var body: some View {
    
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
//
//      FavoriteTabView()
//        .tabItem {
//          Image(systemName: "heart")
//          Text("Favorite")
//        }
      
//      AppsTabView()
//        .tabItem {
//          Image(systemName: "person")
//          Text("Profile")
//        }
//
//      ArcadeTabView()
//        .tabItem {
//          Image(systemName: "gamecontroller.fill")
//          Text("Arcade")
//        }
      

    }
    .navigationBarTitle("")
    .navigationBarHidden(true)
  }
  
}


struct AppMainView_Previews: PreviewProvider {
  
  static var previews: some View {
    AppMainView()
  }
  
}
