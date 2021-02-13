//
//  SpecialListView.swift
//  ifengus30
//
//  Created by Alan Yang on 2/10/21.
// 列表的头部广告轮播位

import SwiftUI


struct ChannelTopAdsBlock: View {
    
  //  @ObservedObject var contentTopAds = ContentTopAds()
    @State var ads: [TopAds] = []
//    @State var forcount:Int = 1
  var body: some View {
   // let topAdscount : Int = contentTopAds.topAds.count
   //Text(String(contentTopAds.topAds.count))
    if self.ads.count != 0 {
    TabView {
        
//        ForEach(0 ..< 3) { topAd in
//        ForEach(0 ..< self.forcount){ topAd in
        //Text(String( contentTopAds.topAds.count))
        

        ForEach(self.ads){ topAd in
        VStack {
          Divider()
          VStack(alignment: .leading) {
            Text("UPDATE")
              .bold()
              .foregroundColor(.blue)
              .font(.footnote)

//              Text(topAd.title)
              .font(.title3)

            Text("Description")
              .foregroundColor(.secondary)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          RoundedRectangle(cornerRadius: 12, style: .continuous)
         .foregroundColor(Color.gray)
        }
        }.padding(.horizontal)
     }.onAppear {
        //self.contentTopAds.getListContentTopAds(from : 2)
        getListContentTopAds(from: 2, responseData: { isresponseTopAds, error in
            self.ads = (isresponseTopAds?.data)!
 //           self.forcount = (isresponseTopAds?.data!.count)!
            if let restr = isresponseTopAds {
                print("Button =====>\(restr.data!.count)")
                
            }
        })
 }
    .frame(width: UIScreen.main.bounds.width, height: 300)
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .padding(.bottom, 24)
    
  }
    
   
  }
}

//struct AppCarouselLargeBlock_Previews: PreviewProvider {
//    static var previews: some View {
//        ChannelTopAdsBlock()
//    }
//}
