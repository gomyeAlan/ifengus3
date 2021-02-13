// 2020.07.19 | AppStore - GamesTabView.swift |
import SwiftUI


struct FavoriteTabView: View {
  @State var isAccountViewPresented = false
  
  var body: some View {
    NavigationView {
      ScrollView {
        ChannelTopAdsBlock()
        AppCarouselSmall1Block(title: "What to Play This Week")
        AppCarouselSmall1Block(title: "New Games We Love")
        AppCarouselMedium1Block(title: "Coming Soon", cellsNumber: 5)
        TopGamesCategoriesBlock()
        QuickLinksBlock()
        TermsAndConditionsBlock()
      }
      .navigationBarTitle("Games")
      .navigationBarItems(trailing: AccountButton(isAccountViewPresented: $isAccountViewPresented))
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}


struct GamesTabView_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteTabView()
  }
}
