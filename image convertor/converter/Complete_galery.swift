//
//  Complete_galery.swift
//  image convertor
//
//  Created by Кирилл on 20.10.2021.
//

import Foundation
import SwiftUI
import UIKit
import Photos

struct complete_galery:View{
    @Binding var imageList: [UIImage]
    @StateObject var mainRouter: MainRouter
    var done: formatted_image
    var formats: format_image
    func save_images()
    {
        for i in 0...done.files.count-1{
            PHPhotoLibrary.shared().performChanges {
                _ = PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: done.files[i])
            } completionHandler: { (success, error) in
            }
        }
    }
    
    func share()
    {
        let activityVC = UIActivityViewController(activityItems: done.files, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        
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
                Text("Complete! \nYour file has been resized")
                .foregroundColor(Color.gray)
                .font(.system(size: 17))
                .frame(width: UIScreen.screenWidth * 0.8, height: 65, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(.bottom, 15)
                ScrollView(.horizontal)
                {
                    HStack(spacing : 10){
                        if (imageList.count != 0)
                        {
                            ForEach(0..<imageList.count){index in
                                Image(uiImage: imageList[index])
                                .resizable()
                                .frame(width: 0.3 * UIScreen.screenWidth, height: 0.3 * UIScreen.screenWidth)
                                .cornerRadius(10)
                                .padding(.leading, imageList.count == 1 ? UIScreen.screenWidth * 0.35: UIScreen.screenWidth * 0.1)
                            }
                        }
                    }
                }
                Button(action: {share()})
                {
                    HStack{
                        Image("share")
                            .padding(.leading, 10)
                            .frame(height: UIScreen.screenHeight * 0.15, alignment: .leading)
                        Text("SHARE RESIZED FILES")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color.black)
                            .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                    }
                }
                .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                .cornerRadius(15)
                .padding(.bottom, 15)
                Button(action: {save_images()})
                {
                    HStack{
                        Image("galery")
                            .padding(.leading, 10)
                            .frame(height: UIScreen.screenHeight * 0.15, alignment: .leading)
                        Text("SAVE TO GALERY")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color.black)
                            .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                    }
                }
                .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                .cornerRadius(15)
                Button(action: {mainRouter.currentPage = .main; imageList.removeAll(); })
                {
                    HStack{
                        Image(systemName: "house.fill")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color.gray)
                            .padding(.trailing, 0)
                    }
                }
                .frame(width: UIScreen.screenWidth * 0.25, height: UIScreen.screenHeight * 0.08, alignment: .center)
                .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                .cornerRadius(15)
                .padding(.bottom, 15)
                
            }
        }
    }
}

/*struct completegalery_Previews: PreviewProvider {
    
    static var previews: some View {
        complete_galery(imageList: [UIImage()], mainRouter: MainRouter(), done: formatted_image(), formats: format_image())
    }
}*/


