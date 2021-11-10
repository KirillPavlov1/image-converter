//
//  menu.swift
//  image convertor
//
//  Created by Кирилл on 07.10.2021.
//

import Foundation
import SwiftUI

struct Menu: View{
    @StateObject var mainRouter: MainRouter
    @State var show_files = false
    @Binding var pickerResult: [UIImage]

    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color.white)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("icon1")
                Text("IMAGE CONVERTER & RESIZE")
                    .font(.system(size: 17, weight: .bold))
                    .padding(.bottom, 10)
                Text("Select the location of the input files")
                    .foregroundColor(Color.gray)
                    .frame(width: UIScreen.screenWidth * 0.6, height: 45, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, UIScreen.screenHeight / 10)
                    
                HStack{
                    Button(action: {mainRouter.currentPage = .another_app})
                    {
                        VStack{
                            Image("app")
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                            Text("ANOTHER APP")
                                .font(.system(size: UIScreen.screenHeight / 60, weight: .bold))
                                .foregroundColor(Color.black)
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                            Text("Copy from app")
                                .font(.system(size: UIScreen.screenHeight / 70))
                                .foregroundColor(Color.gray)
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                        }
                        .padding(.leading, 12)
                    }
                    .frame(width: UIScreen.screenWidth * 0.35, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                    .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                    .cornerRadius(15)
                    Spacer()
                    Button(action: {mainRouter.currentPage = .url})
                    {
                        VStack{
                            Image("url")
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                            Text("URL")
                                .font(.system(size: UIScreen.screenHeight / 60, weight: .bold))
                                .foregroundColor(Color.black)
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                            Text("File from URL")
                                .font(.system(size: UIScreen.screenHeight / 70))
                                .foregroundColor(Color.gray)
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                        }
                        .padding(.leading, 12)
                    }
                    .frame(width: UIScreen.screenWidth * 0.35, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                    .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                    .cornerRadius(15)
                }
                .padding([.leading, .trailing, .bottom], 30)
                HStack{
                    Button(action: {mainRouter.currentPage = .photos_converter})
                    {
                        VStack{
                            Image("photos")
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                            Text("PHOTOS")
                                .font(.system(size: UIScreen.screenHeight / 60, weight: .bold))
                                .foregroundColor(Color.black)
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                            Text("Media library")
                                .font(.system(size: UIScreen.screenHeight / 70))
                                .foregroundColor(Color.gray)
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                        }
                        .padding(.leading, 12)
                    }
                    .frame(width: UIScreen.screenWidth * 0.35, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                    .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                    .cornerRadius(15)
                    Spacer()
                    Button(action: {show_files.toggle()})
                    {
                        VStack{
                            Image("files")
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                            Text("FILES")
                                .font(.system(size: UIScreen.screenHeight / 60, weight: .bold))
                                .foregroundColor(Color.black)
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                            Text("Your files app")
                                .font(.system(size: UIScreen.screenHeight / 70))
                                .foregroundColor(Color.gray)
                                .frame(width:UIScreen.screenWidth * 0.35, alignment: .leading)
                        }
                        .padding(.leading, 12)
                    }
                    .frame(width: UIScreen.screenWidth * 0.35, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                    .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                    .cornerRadius(15)
                    .sheet(isPresented: $show_files, onDismiss: {mainRouter.currentPage = .photos_converter})
                    {
                        DocumentPicker(pickerResult: $pickerResult)
                    }
                }
                .padding([.leading, .trailing], 30)
                Spacer()
                Button(action: {mainRouter.currentPage = .main})
                {
                    HStack{
                        Text("<<")
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
/*struct Menu_Previews: PreviewProvider {

    static var previews: some View {
        //Menu(mainRouter: MainRouter(), pickerResult: Binding<[UIImage]>)
    }
}*/

