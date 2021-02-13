//
//  ListView.swift
//  ifengus_v20
//
//  Created by Alan Yang on 2/2/21.
//

import SwiftUI

struct ContentListBlockSmall: View {
    @StateObject private var imageLoader = CoverImageLoader()

  let contentLists : ContentLists

  var body: some View {

        VStack(alignment: .leading){
            HStack(alignment: .top) {

        if imageLoader.image != nil {
            
            NavigationLink(destination: WebView( channelUrl: contentLists.fullurl)){
                         
            Image(uiImage: imageLoader.image!)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.5)
                .cornerRadius(5)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .shadow(color: Color.black, radius: 10, x: 0, y: 0)
            }
            
        } else {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.secondary)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.5)
                .shadow(color: Color.black, radius: 20, x: 0, y: 0)
        }
    }

        VStack(alignment: .leading) {
         
            NavigationLink(destination: WebView( channelUrl: contentLists.fullurl), label:{
                Text("\(contentLists.title)")
                         })
            .font(.system(size: 20))
            
            
            HStack {
                Spacer()
                Image(systemName: "eye")
                    .foregroundColor(.white)
                    .imageScale(.small)
                Text("\(contentLists.views)")
                    .foregroundColor(.white)
                Image(systemName: "hand.thumbsup")
                    .foregroundColor(.white)
                    .imageScale(.small)
                Text("\(contentLists.likes)")
                    .foregroundColor(.white)

            }
            Spacer()
         }
        .padding(.leading, 25)
         .foregroundColor(.white)
 
    }
    .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.width * 0.75)
     .background(Color(UIColor.systemGray2))
     .clipShape(RoundedRectangle(cornerRadius: 20))
     .padding(.vertical, 8)
     .onAppear {
        imageLoader.load(contentLists.image)
       // print (contentLists.image)
     }
  }
//  }
}


//struct AppLarge2Block_Previews: PreviewProvider {
//    static var previews: some View {
//        APPContentLargeBlock(lists: Lists)
//    }
//}
