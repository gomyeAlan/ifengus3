// 2020.07.20 | AppStoreReplica - AppLarge1Block.swift |
import SwiftUI


struct AppTopNewBlock: View {
    
  var body: some View {
    
    ZStack(alignment: .leading) {
      VStack(alignment: .leading) {
        Text("最新")
          .font(.headline)
          .foregroundColor(.secondary)
        
        Text("New")
          .font(.title)
          .foregroundColor(.white)
          .fontWeight(.bold)
        
        Spacer()
        
        Text("Description.")
          .foregroundColor(.white)
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.width * 1.1)
    .background(Color(UIColor.systemGray2))
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .padding(.vertical, 8)
  }
}


struct AppLarge1Block_Previews: PreviewProvider {
    static var previews: some View {
      AppTopNewBlock()
    }
}
