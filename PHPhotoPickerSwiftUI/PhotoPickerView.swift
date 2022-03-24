//
//  PhotoPickerView.swift
//  PHPhotoPickerSwiftUI
//
//  Created by Kristaps Grinbergs on 06/01/2021.
//

import SwiftUI

struct PhotoPickerView: View {
  @State private var photoPickerIsPresented = false
  @State var pickerResult: [UIImage] = []
  @State var blendIsPresented = false
  
  var body: some View {
    NavigationView {
      ScrollView {
        ForEach(pickerResult, id: \.self) { uiImage in
          ImageView(uiImage: uiImage)
        }
        .padding()
        if pickerResult.count >= 2 {
          let pair = BlendPair(backgroundImage: pickerResult[1], foregroundImage: pickerResult[0])
          Button {
            BlendProcessor.shared.generateBlend(pair: pair)
            blendIsPresented.toggle()
            print("Generate Blend");
          } label: {
            Text("Generate Blend")
              .font(.headline)
              .foregroundColor(Color.blue)
              .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
          }
        }
      }
      .edgesIgnoringSafeArea(.bottom)
      .navigationBarTitle("Select Photo", displayMode: .inline)
      .navigationBarItems(trailing: selectPhotoButton)
      .sheet(isPresented: $photoPickerIsPresented) {
        PhotoPicker(pickerResult: $pickerResult,
                    isPresented: $photoPickerIsPresented)
      }
      .sheet(isPresented: $blendIsPresented) {
        BlendOutputView()
      }
    }
  }
  
  @ViewBuilder
  private var selectPhotoButton: some View {
    Button(action: {
      photoPickerIsPresented = true
    }, label: {
      Label("Select", systemImage: "photo")
    })
  }
}

struct PhotoPickerView_Previews: PreviewProvider {
  static var previews: some View {
    PhotoPickerView()
  }
}
