//
//  resize_main.swift
//  image convertor
//
//  Created by Кирилл on 11.10.2021.
//

import Foundation
import SwiftUI

struct resize: View{
    @State private var width: String = ""
    @State private var height: String = ""
    @State public var count: Int = 0
    @State var procent: Double = 50
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Saved_image.data, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Saved_image>
    @Binding var imageList: [UIImage]
    @Binding var main: Bool
    @Binding var pickerResult: [UIImage]
    
    func resize_save()
    {
        if (pickerResult.count == 0)
        {
            return;
        }
        if (width.isNumber && height.isNumber)
        {
            let w = CGFloat(truncating: NumberFormatter().number(from: width) ?? 100)
            let h = CGFloat(truncating: NumberFormatter().number(from: height) ?? 100)
            
            for index in 0...pickerResult.count-1{
                pickerResult[index] =  pickerResult[index].resized(toWidth: w, toHeight: h)!
            }
        }
        else
        {
            for index in 0...pickerResult.count-1{
                pickerResult[index] = pickerResult[index].resized(withPercentage: procent / 100)!
            }
        }
       // addItem()
        main = false
    }
    
    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color.white)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("icon1")
                Text("IMAGE CONVERTER & RESIZE")
                    .font(.system(size: 17, weight: .bold))
                Text("Choose from 1 to 99 to zoom out/ zoom in the photos and expand the photos")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 13))
                    .frame(width: UIScreen.screenWidth * 0.8, height: 65, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 15)
                button_image(pickerResult: $pickerResult)
                HStack{
                    ZStack{
                        LinearGradient(gradient: Gradient(colors: [ Color(red: 0.757, green: 0.941, blue: 0.106), Color(red: 0.125, green: 0.722, blue: 0.204)]), startPoint: .init(x: 0, y: 1), endPoint: .init(x: 0.9, y: 0.5))
                            .mask(Slider(value: $procent, in: 1.0...99.0, step: 1.0)
                                    .padding([.leading], 65))
                        Slider(value: $procent, in: 1.0...99.0, step: 1.0)
                                .padding([.leading], 65)
                                .opacity(0.05)
                    }
                    Text(String(format: "%.0f%%", procent))
                        .padding(.trailing, 20)
                }
                HStack{
                    VStack{
                        Text("Width")
                            .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)

                        HStack{
                            TextField("", text: $width)
                                .keyboardType(.numberPad)
                                .frame(width: UIScreen.screenWidth * 0.25, height: UIScreen.screenHeight * 0.07, alignment: .center)
                                .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                                .cornerRadius(5)
                        Text("PX")
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                    .padding(.leading, 20)
                    Spacer()
                    VStack{
                        Text("Height")
                            .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                        HStack{
                            TextField("", text: $height)
                                .keyboardType(.numberPad)
                                .frame(width: UIScreen.screenWidth * 0.25, height: UIScreen.screenHeight * 0.07, alignment: .center)
                                .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                                .cornerRadius(5)
                        Text("PX")
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                    .padding(.trailing, 20)
                }
                Button(action: {self.resize_save()})
                {
                    Text("<-> Resize")
                        .foregroundColor(Color.white)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.08, alignment: .center)
                }
                .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.08, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [ Color(red: 0.757, green: 0.941, blue: 0.106), Color(red: 0.125, green: 0.722, blue: 0.204)]), startPoint: .init(x: 0, y: 1), endPoint: .init(x: 0.9, y: 0.5)))
                .cornerRadius(15)
                .padding(.bottom, 15)
            }
        }
    }
    
}
struct resize_main: View{
    @StateObject var mainRouter: MainRouter
    @State public var imageList: [UIImage] = []
    let persistenceController = PersistenceController.shared
    @State var main: Bool = true
    @State var pickerResult: [UIImage] = []
    var body: some View{
        switch main{
            case true:
            resize(imageList: $imageList, main: $main, pickerResult: $pickerResult).environment(\.managedObjectContext, persistenceController.container.viewContext)
            case false:
            complete(imageList: pickerResult, mainRouter: mainRouter)
        }
    }
    
}

struct resize_Previews: PreviewProvider {
    static var previews: some View {
        resize_main(mainRouter: MainRouter(), pickerResult: [UIImage()])
    }
}
