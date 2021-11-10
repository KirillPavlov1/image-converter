//
//  settings_view.swift
//  image convertor
//
//  Created by Кирилл on 28.10.2021.
//

import Foundation
import SwiftUI
import StoreKit

struct settings_view: View{
    @StateObject var mainRouter: MainRouter
    func share_app()
    {
        if let name = URL(string: "http://appstore.com/<DEVELOPING COMPANY LIMITED>/<Image converter & resize>"), !name.absoluteString.isEmpty {
          let objectsToShare = [name]
          let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        } else {
          // show alert for not available
        }
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
                    .padding(.bottom, 10)
                Text("Settings")
                    .foregroundColor(Color.gray)
                    .frame(width: UIScreen.screenWidth * 0.6, height: 45, alignment: .center)
                    .multilineTextAlignment(.center)
                HStack{
                        Image("help")
                            .padding(.leading, 10)
                        Text("HELP & FAQS")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.black)
                }
                .frame(width: UIScreen.screenWidth * 0.95, height: UIScreen.screenHeight * 0.1, alignment: .leading)
                .cornerRadius(15)
                Link(destination: URL(string: "http://devcompanyltd.tilda.ws/privacy")!)
                {
                    HStack{
                            Image("privacy")
                                .padding(.leading, 10)
                            Text("PRIVACY POLICY")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color.black)
                    }
                    .frame(width: UIScreen.screenWidth * 0.95, height: UIScreen.screenHeight * 0.1, alignment: .leading)
                    .cornerRadius(15)
                }
                Link(destination: URL(string: "http://devcompanyltd.tilda.ws/terms")!)
                {
                    HStack{
                            Image("terms")
                                .padding(.leading, 10)
                            Text("TERMS OF USE")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color.black)
                    }
                    .frame(width: UIScreen.screenWidth * 0.95, height: UIScreen.screenHeight * 0.1, alignment: .leading)
                    .cornerRadius(15)
                }
                Button(action: {share_app()})
                {
                    HStack{
                            Image("share")
                                .padding(.leading, 10)
                            Text("SHARE THE APP")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color.black)
                    }
                }
                .frame(width: UIScreen.screenWidth * 0.95, height: UIScreen.screenHeight * 0.1, alignment: .leading)
                .cornerRadius(15)
                Button(action: {SKStoreReviewController.requestReview()})
                {
                    HStack{
                        Image("rate")
                            .padding(.leading, 10)
                        Text("RATE APP")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.black)
                    }
                }
                .frame(width: UIScreen.screenWidth * 0.95, height: UIScreen.screenHeight * 0.1, alignment: .leading)
                .cornerRadius(15)
                Spacer()
                Button(action: {mainRouter.currentPage = .main})
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

struct settings_Previews: PreviewProvider {

    static var previews: some View {
        settings_view(mainRouter: MainRouter())
    }
}
