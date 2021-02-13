//
//  LoginView.swift
//  ifengus_v20
//
//  Created by Alan Yang on 1/20/21.
//

import SwiftUI


struct AccountView: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      List {
        Section {
            
            NavigationLink(
              destination: UserEntranceView(),
              label: {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 50))
                    .padding(.horizontal, 5)
                  
                  VStack (alignment: .leading, spacing: 5) {
                    Text("您还没有登录")
                      .font(.system(size: 25))
                  }
                }
              }
            )

        }
        
        Section {
          NavigationLink(destination: LoginView()){Text("安全退出")}
        }
        
        Section {
          SingleLineButton(title: "Redeem Gift Card or Code")
          SingleLineButton(title: "Send Gift Card by Email")
          SingleLineButton(title: "Add Funds to Apple ID")
        }
        
        Section {
          SingleLineNavigationLink(text: "Personalized Recommendations")
        }
        
        Section(header: Text("UPDATED RECENTLY")) {
          RecentlyUpdatedAppsList(title: "App title", date: "Today", range: Range(0...5))
        }
        
      }
      .listStyle(GroupedListStyle())
      .navigationBarTitle("Account", displayMode: .inline)
      .navigationBarItems(trailing: DismissButton(title: "Done", presentationMode: _presentationMode))
    }
  }
}


struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
      .preferredColorScheme(.dark)
  }
}







