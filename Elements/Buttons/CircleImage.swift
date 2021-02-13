//
//  CircleImage.swift
//  ifengus_v20
//
//  Created by Alan Yang on 1/25/21.
//

import SwiftUI

struct CircleImage: View {
    var imageName: String
    var size: CGFloat
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: size, height: size)
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "vinci", size: 50)
    }
}
