//
//  BlendView.swift
//  PHPhotoPickerSwiftUI
//
//  Created by jht2 on 3/24/22.
//

import SwiftUI

struct BlendOutputView: View {
  var photoOutput = BlendProcessor.shared.photoOutput
  
  var body: some View {
    ScrollView {
      VStack {
        Image(uiImage: photoOutput)
          .resizable()
          .aspectRatio(contentMode: .fit)
      }
    }
    .padding()
  }
}
