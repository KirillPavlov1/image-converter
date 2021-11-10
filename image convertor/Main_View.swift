//
//  ContentView.swift
//  image convertor
//
//  Created by Кирилл on 07.10.2021.
//

import SwiftUI
import CoreData

struct main_body: View{
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
                Text("Select the type of image conversion you want")
                    .foregroundColor(Color.gray)
                    .frame(width: UIScreen.screenWidth * 0.6, height: 45, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 15)
                    
                Button(action: {mainRouter.currentPage = .converter})
                {
                    HStack{
                        Image("icon2")
                            .padding(.leading, 10)
                            .frame(height: UIScreen.screenHeight * 0.15, alignment: .leading)
                        Text("CONVETER IMAGE")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color.black)
                            .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                            
                    }
                }
                .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                .cornerRadius(15)
                .padding(.bottom, 15)
                Button(action: {mainRouter.currentPage = .resize})
                {
                    HStack{
                        Image("icon3")
                            .padding(.leading, 10)
                            .frame(height: UIScreen.screenHeight * 0.15, alignment: .leading)
                        Text("RESIZE IMAGE")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color.black)
                            .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                    }
                }
                .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                .cornerRadius(15)
                .padding(.bottom, 15)
                Button(action: {mainRouter.currentPage = .studio})
                {
                    HStack{
                        Image("icon4")
                            .padding(.leading, 10)
                            .frame(height: UIScreen.screenHeight * 0.15, alignment: .leading)
                        Text("STUDIO")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color.black)
                            .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                    }
                }
                .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight * 0.15, alignment: .leading)
                .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                .cornerRadius(15)
                Spacer()
                Button(action: {mainRouter.currentPage = .settings})
                {
                    Image("settings")
                }
                .frame(width: UIScreen.screenWidth * 0.25, height: UIScreen.screenHeight * 0.08, alignment: .center)
                .background(Color(red: 0.965, green: 0.965, blue: 0.965))
                .cornerRadius(15)
                .padding(.bottom, 15)
            }
            
        }
    }
}

struct Main_View: View {
    
    @StateObject var mainRouter = MainRouter()
    let persistenceController = PersistenceController.shared
    @State var pickerResult: [UIImage] = []
    
    var body: some View {
        switch mainRouter.currentPage{
        case .main:
            main_body(mainRouter: mainRouter)
        case .converter:
            Menu(mainRouter: mainRouter, pickerResult: $pickerResult)
        case .resize:
            resize_main(mainRouter: mainRouter).environment(\.managedObjectContext, persistenceController.container.viewContext)
        case .studio:
            studio(mainRouter: mainRouter).environment(\.managedObjectContext, persistenceController.container.viewContext)
        case .photos_converter:
            galery_main(mainRouter: mainRouter, pickerResult: $pickerResult)
        case .url:
            url_body(mainRouter: mainRouter)
        case .another_app:
            Anotherapp_body(mainRouter: mainRouter)
        case .settings:
            settings_view(mainRouter: mainRouter)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Main_View()
    }
}
