//
//  galery.swift
//  image convertor
//
//  Created by Кирилл on 17.10.2021.
//

import Foundation
import SwiftUI
import PDFKit
import SVGKit
import MobileCoreServices
import UniformTypeIdentifiers
import SDWebImage
import SDWebImageWebPCoder

struct galery: View{
    
    @State private var width: String = ""
    @State private var height: String = ""
    @State public var count: Int = 0
    @State var procent: Double = 50
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Saved_image.data, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Saved_image>
    @Binding var main: Bool
    @Binding var pickerResult: [UIImage]
    @State var image_done: UIImage = UIImage(imageLiteralResourceName: "app")
    @State var currentTab = 0
    @Binding var formats: format_image
    @Binding var done: formatted_image


    private func addItem(file_name: String, file_url: URL) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        withAnimation {
            let newItem = Saved_image(context: viewContext)
                newItem.data = file_url.absoluteString
                newItem.format = file_name
                newItem.day = formatter.string(from: date)
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
        }
    }
    
    func convert(){
        
        let options: NSDictionary =     [:]
        var url: URL
        if (pickerResult.count == 0)
        {
            return;
        }
        if (formats.pdf)
        {
            for i in 0...pickerResult.count-1{
                url = createPDF(image: pickerResult[i], i: i)!
                done.files.append(url)
                addItem(file_name: ".pdf", file_url: url)
            }
        }
        if (formats.svg)
        {
            for i in 0...pickerResult.count-1{
                url = createSVG(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".svg", file_url: url)
            }
        }
        if (formats.png)
        {
            for i in 0...pickerResult.count-1{
                url = createPNG(image: pickerResult[i], i: i)!
                done.files.append(url)
                addItem(file_name: ".png", file_url: url)
            }
        }
        if (formats.jpg)
        {
            for i in 0...pickerResult.count-1{
                url = createJPG(image: pickerResult[i], i: i)!
                done.files.append(url)
                addItem(file_name: ".jpg", file_url: url)
            }
        }
        if (formats.gif)
        {
            for i in 0...pickerResult.count-1{
                url = UIImage.animatedGif(from: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".gif", file_url: url)
            }
        }
        if (formats.psd)
        {
            for i in 0...pickerResult.count-1{
                url = createPSD(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".psd", file_url: url)
            }
        }
        if (formats.bmp)
        {
            for i in 0...pickerResult.count-1{
                url = pickerResult[i].toData(options: options, type: kUTTypeBMP, i: i, end: "bmp")!
                done.files.append(url)
                addItem(file_name: ".bmp", file_url: url)
            }
        }
        if (formats.eps)
        {
            for i in 0...pickerResult.count-1{
                url = createEPS(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".eps", file_url: url)
            }
        }
        if (formats.ps)
        {
            for i in 0...pickerResult.count-1{
                url = createPS(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".ps", file_url: url)
            }
        }
        if (formats.exr)
        {
            for i in 0...pickerResult.count-1{
                url = createEXR(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".exr", file_url: url)
            }
        }
        if (formats.ico)
        {
            for i in 0...pickerResult.count-1{
                url = createICO(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".ico", file_url: url)
            }
        }
        if (formats.tga0)
        {
            for i in 0...pickerResult.count-1{
                url = createTGA(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".tga", file_url: url)
            }
        }
        if (formats.tga1)
        {
            for i in 0...pickerResult.count-1{
                url = createTGA(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".tga", file_url: url)
            }
        }
        if (formats.wbmp)
        {
            for i in 0...pickerResult.count-1{
                url = createWBMP(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".wbmp", file_url: url)
            }
        }
        if (formats.webp)
        {
            for i in 0...pickerResult.count-1{
                url = createWEBP(data:(SDImageWebPCoder.shared.encodedData(with: pickerResult[i], format: .webP, options: nil)!), i: i)
                done.files.append(url)
                addItem(file_name: ".webp", file_url: url)
            }
        }
        if (formats.odd)
        {
            for i in 0...pickerResult.count-1{
                url = createODD(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".odd", file_url: url)
            }
        }
        if (formats.tiff)
        {
            for i in 0...pickerResult.count-1{
                url = pickerResult[i].toData(options: options, type: kUTTypeTIFF, i: i, end: "tiff")!
                done.files.append(url)
                addItem(file_name: ".tiff", file_url: url)
            }
        }
        if (formats.tif)
        {
            for i in 0...pickerResult.count-1{
                url = createTIF(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".tif", file_url: url)
            }
        }
        if (formats.jpeg)
        {
            for i in 0...pickerResult.count-1{
                url = createJPEG(image: pickerResult[i], i: i)!
                done.files.append(url)
                addItem(file_name: ".jpeg", file_url: url)
            }
        }
        if (formats.bmpf)
        {
            for i in 0...pickerResult.count-1{
                url = createBMPF(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".bmpf", file_url: url)
            }
        }
        if (formats.cur)
        {
            for i in 0...pickerResult.count-1{
                url = createCUR(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".cur", file_url: url)
            }
        }
        if (formats.xbm)
        {
            for i in 0...pickerResult.count-1{
                url = createXBM(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".xmb", file_url: url)
            }
        }
        if (formats.otb)
        {
            for i in 0...pickerResult.count-1{
                url = createOTB(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".otb", file_url: url)
            }
        }
        if (formats.avs)
        {
            for i in 0...pickerResult.count-1{
                url = createAVS(image: pickerResult[i], i: i)
                done.files.append(url)
                addItem(file_name: ".avs", file_url: url)
            }
        }
        main.toggle()
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
                Text("Choose file output format")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 13))
                    .frame(width: UIScreen.screenWidth * 0.8, height: 65, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 15)
                button_image(pickerResult: $pickerResult)
                    .padding([.bottom],-30)
                    .padding([.top],-50)
                ZStack{
                    TabView(selection: $currentTab, content:{
                        list1(formats: $formats).tag(0)
                        list2(formats: $formats).tag(1)
                        list3(formats: $formats).tag(2)
                    })
                    .frame(height: UIScreen.screenHeight * 0.35)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    VStack{
                        Spacer()
                        HStack(spacing: 7) {
                            ForEach(0..<3) { index in // 1
                                Circle()
                                .fill(currentTab == index ? Color.gray :  Color.gray.opacity(0.3)) // 2
                                .frame(width: currentTab == index ? 9 : 7, height: currentTab == index ? 9 : 7)
                                .transition(AnyTransition.opacity.combined(with: .scale)) // 3
                                .id(index) // 4
                                }
                            .padding(.bottom, 5)
                        }
                    }
                }
                Button(action: {convert()})
                {
                    Text("↓↑ Convert")
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

struct galery_main: View{
    @StateObject var mainRouter: MainRouter
    let persistenceController = PersistenceController.shared
    @State var main: Bool = true
    //@State var pickerResult: [UIImage] = []
    @Binding var pickerResult: [UIImage]
    @State var done = formatted_image()
    @State var formats = format_image()
    var body: some View{
        switch main{
            case true:
            galery(main: $main, pickerResult: $pickerResult, formats: $formats, done: $done).environment(\.managedObjectContext, persistenceController.container.viewContext)
            case false:
            complete_galery(imageList: $pickerResult, mainRouter: mainRouter, done: done, formats: formats)
        }
    }
}

/*struct galery_Previews: PreviewProvider {
    static var previews: some View {
        galery_main(mainRouter: MainRouter(), pickerResult: [UIImage()])
    }
}*/
