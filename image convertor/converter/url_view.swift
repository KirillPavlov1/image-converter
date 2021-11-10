//
//  url_view.swift
//  image convertor
//
//  Created by Кирилл on 28.10.2021.
//

import Foundation
import SwiftUI

struct url_body: View{
    @StateObject var mainRouter: MainRouter
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
                Text("How do I convert files from the web?")
                    .foregroundColor(Color.gray)
                    .frame(width: UIScreen.screenWidth * 0.6, height: 45, alignment: .center)
                    .multilineTextAlignment(.center)
                HStack{
                        Image("galery")
                            .padding(.leading, 10)
                        Text("download files to your phone")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.black)
                            .padding(.leading, UIScreen.screenWidth * 0.2)
                }
                .frame(width: UIScreen.screenWidth * 0.95, height: UIScreen.screenHeight * 0.13, alignment: .leading)
                .cornerRadius(15)
                HStack{
                        Image("icon3")
                            .padding(.leading, 10)
                        Text("in the converted app select “files” and find the file you just saved")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.black)
                            .padding(.leading, UIScreen.screenWidth * 0.2)
                }
                .frame(width: UIScreen.screenWidth * 0.95, height: UIScreen.screenHeight * 0.1, alignment: .leading)
                .cornerRadius(15)
                Spacer()
                Button(action: {mainRouter.currentPage = .converter})
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



struct url_Previews: PreviewProvider {
    static var previews: some View {
        url_body(mainRouter: MainRouter())
    }
}
