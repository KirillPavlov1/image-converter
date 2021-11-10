//
//  utils.swift
//  image convertor
//
//  Created by Кирилл on 07.10.2021.
//

import Foundation
import SwiftUI
import SVGKit
import ApphudSDK

enum Page {
    case onBoarding
    case main
}


class MainRouter: ObservableObject {
    @Published var currentPage: which_main = .main
}

enum which_main{
    case main
    case converter
    case resize
    case studio
    case photos_converter
    case url
    case another_app
    case settings
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .background(Color(red: 0.965, green: 0.965, blue: 0.965))
            .cornerRadius(5)
    }
}

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

extension UIImage {
    func resized(withPercentage percentage: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
    func resized(toWidth width: CGFloat, toHeight height: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: width, height: height)
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
}

struct button_image:View{
    @State private var showingImagePicker = false
    @State public var inputImage: UIImage?
    @State public var image: Image?
   // @Binding var imageList: [UIImage]
    @Binding var pickerResult: [UIImage]
    
    var body: some View{
        ScrollView(.horizontal)
        {
            HStack(spacing : 10){
                ForEach(pickerResult, id: \.self){uiImage in
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 0.965, green: 0.965, blue: 0.965))
                            .frame(width: 0.35 * UIScreen.screenWidth, height: 0.35 * UIScreen.screenWidth)
                            .cornerRadius(10)
                        Rectangle()
                            .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 4, dash: [10]))
                            .frame(width: 0.20 * UIScreen.screenWidth, height: 0.20 * UIScreen.screenWidth)
                            .cornerRadius(10)
                        Image(systemName: "plus")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 60))
                        Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 0.35 * UIScreen.screenWidth, height: 0.35 * UIScreen.screenWidth)
                        .cornerRadius(10)
                    }
                    .padding(.leading, pickerResult.count == 0 ? UIScreen.screenWidth * 0.325 : UIScreen.screenWidth * 0.15)
            }
            Button(action: {self.showingImagePicker = true})
            {
                ZStack{
                    Rectangle()
                        .fill(Color(red: 0.965, green: 0.965, blue: 0.965))
                        .frame(width: 0.35 * UIScreen.screenWidth, height: 0.35 * UIScreen.screenWidth)
                            .cornerRadius(10)
                    Rectangle()
                        .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 4, dash: [10]))
                        .frame(width: 0.20 * UIScreen.screenWidth, height: 0.20 * UIScreen.screenWidth)
                        .cornerRadius(10)
                    Image(systemName: "plus")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 60))
                }
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                        PhotoPicker(pickerResult: $pickerResult,
                                      isPresented: $showingImagePicker)
                }
            }
            .padding(.leading, pickerResult.count == 0 ? UIScreen.screenWidth * 0.325 : UIScreen.screenWidth * 0.15)
            }
        }
    }
    func loadImage() {
        /*guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        save_to_array()*/
    }
    func save_to_array()
    {
       // imageList.append(inputImage!)
    }
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}



struct format_image
{
    var svg = false
    var png = false
    var jpg = false
    var gif = false
    var psd = false
    var bmp = false
    var eps = false
    var ps = false
    var exr = false
    var ico = false
    var tga0 = false
    var tga1 = false
    var wbmp = false
    var webp = false
    var odd = false
    var pdf = false
    var tiff = false
    var tif = false
    var jpeg = false
    var bmpf = false
    var cur = false
    var xbm = false
    var otb = false
    var avs = false
    
}

struct formatted_image{
    //var svg: [SVGKImage] = []
    var files: [URL] = []
    /*var jpg: [URL] = []
    var gif: [URL] = []
    var psd: [URL] = []
    var bmp: [URL] = []
    var eps: [URL] = []
    var ps: [URL] = []
    var exr: [URL] = []
    var ico: [URL] = []
    var tga0: [URL] = []
    var tga1: [URL] = []
    var wbmp: [URL] = []
    var webp: [URL] = []
    var odd: [URL] = []
    var pdf: [URL] = []
    var tiff: [URL] = []
    var tif: [URL] = []
    var bmpf: [URL] = []
    var jpeg: [URL] = []
    var cur: [URL] = []
    var xbm: [URL] = []
    var otb: [URL] = []
    var avs: [URL] = []*/
}
