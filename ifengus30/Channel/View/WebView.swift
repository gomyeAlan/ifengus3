//
//  WebView.swift
//  ifengus30
//
//  Created by Alan Yang on 2/8/21.
//

import SwiftUI

struct WebView: View {
    var channelUrl: String //定义公共变量Url
    
    
    var body: some View {
        WebViewShow(channelUrl:channelUrl)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(channelUrl:"https://www.ifengus.com")
    }
}
