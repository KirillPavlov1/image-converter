//
//  studio.swift
//  image convertor
//
//  Created by Кирилл on 29.10.2021.
//

import Foundation
import SwiftUI

struct studio:View{
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Saved_image.data, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Saved_image>
    @StateObject var mainRouter: MainRouter
    
    func saving_fromStudio(str: String)
    {
        let url = URL(string: str)
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
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
                    .padding(.bottom, 10)
                Text("Your converting and resizing history")
                    .foregroundColor(Color.gray)
                    .frame(width: UIScreen.screenWidth * 0.6, height: 45, alignment: .center)
                    .multilineTextAlignment(.center)
                ScrollView{
                    VStack{
                        ForEach(items){ item in
                            HStack{
                                let range = item.format!.index(after: item.format!.startIndex)..<item.format!.endIndex//удаление точки перед форматом
                                Image(String(item.format![range]))//применение верхнего метода 
                                    .padding(.leading, 10)
                                VStack{
                                    Text(item.format!)
                                        .font(.system(size: 17, weight: .bold))
                                        .foregroundColor(Color.black)
                                    Text(item.day!)
                                        .font(.system(size: 17, weight: .bold))
                                        .foregroundColor(Color.gray)
                                }
                                Spacer()
                                Button(action:{saving_fromStudio(str: item.data!)})
                                {
                                    Text("⋮")
                                        .font(.system(size: 27, weight: .bold))
                                        .foregroundColor(Color.black)
                                }
                                .padding(.trailing, 10)
                            }
                            .frame(width: UIScreen.screenWidth * 0.95, height: UIScreen.screenHeight * 0.2, alignment: .leading)
                            .cornerRadius(15)
                        }
                    }
                }
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

struct studio_Previews: PreviewProvider {
    static var previews: some View {
        studio(mainRouter: MainRouter())
    }
}
