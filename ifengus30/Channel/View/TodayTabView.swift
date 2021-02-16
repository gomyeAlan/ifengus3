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
            ScrollView {
//                setupCurrentDate(by: 0)
                CustomSearchBar(text: $text)
                AppCarouseTodayBlock()
            }.onAppear{
                print("scrollview======")
            }
            .navigationBarTitle("Today")
//            .navigationBarItems(leading: SearchBar(text: $text), trailing: AccountButton(isAccountViewPresented: $isAccountViewPresented))
    }
}



