//
//  ImageView.swift
//  PHPhotoPickerSwiftUI
//
//  Created by Kristaps Grinbergs on 09/01/2021.
//

import SwiftUI

struct ImageView: View {
  var uiImage: UIImage
  
  var body: some View {
    Image(uiImage: uiImage)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(height: 250, alignment: .center)
      .cornerRadius(10)
      .padding(10)
  }
}
