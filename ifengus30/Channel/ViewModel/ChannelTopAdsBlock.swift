//
//  SpecialListView.swift
//  ifengus30
//
//  Created by Alan Yang on 2/10/21.
// 列表的头部广告轮播位

import SwiftUI


struct ChannelTopAdsBlock: View {
//    @StateObject private var imageLoaderTopAds = CoverImageLoader()
//    @StateObject var jsonModel = JSONViewModel()
    @Environment (\.managedObjectContext) var moc
    // Fetching Data From Core Data...
    @FetchRequest(entity: Topadsinfo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Topadsinfo.title, ascending: true)] ) var results : FetchedResults<Topadsinfo>
    

  var body: some View {
    TabView {
        if results.isEmpty {
            Text("Data")
        } else {
            Text("Has Data")
        }
        Button("click me clean data"){
            
        }
    }
    .frame(width: UIScreen.main.bounds.width-32, height: 300)
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .padding(.bottom, 24)
  }

}

// let topAdscount : Int = contentTopAds.topAds.count
//Text(String(contentTopAds.topAds.count))
 


//ForEach(results){topAd in
//
//VStack {
//  Divider()
//  VStack(alignment: .leading) {
//
//    if imageLoaderTopAds.image != nil {
//    Image(uiImage: imageLoaderTopAds.image!)
//        .resizable()
//        .scaledToFill()
//        .frame(width: UIScreen.main.bounds.width-32, height: UIScreen.main.bounds.width * 0.5)
//        .aspectRatio(contentMode: .fit)
//        .cornerRadius(5)
//        .clipped()
//    } else {
//        RoundedRectangle(cornerRadius: 12, style: .continuous)
//            .foregroundColor(.secondary)
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.5)
//    }
//
//    Text("UPDATE")
//      .bold()
//      .foregroundColor(.blue)
//      .font(.footnote)
//
//    Text(topAd.title!)
//      .font(.title3)
//
//    Text("Description")
//      .foregroundColor(.secondary)
//  }
//  .frame(maxWidth: .infinity, alignment: .leading)
//
//}
//.onAppear {
//    imageLoaderTopAds.load(topAd.image!)
// }
//}.padding(.horizontal)
