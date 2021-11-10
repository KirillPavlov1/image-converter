//
//  onboarding.swift
//  image convertor
//
//  Created by Кирилл on 31.10.2021.
//

import Foundation
import SwiftUI
import ApphudSDK
import StoreKit
import UserNotifications

struct onb1: View{
    var body: some View{
        ZStack{
            Image("onb1")
                .resizable()
                .frame( height: UIScreen.screenHeight * 0.5)
            VStack{
                Text("Quickly")
                    .font(.system(size: 27))
                HStack{
                    Text("Convert")
                        .font(.system(size: 27, weight: .bold))
                        .foregroundColor(Color(red: 0.125, green: 0.722, blue: 0.204))
                    Text("Your Photos")
                        .font(.system(size: 27, weight: .bold))
                }
                Spacer()
            }
            .padding(.top, UIScreen.screenHeight * 0.1)
        }
    }
}

struct onb2: View{
    var body: some View{
        ZStack{
            Image("onb2")
                .resizable()
                .frame( height: UIScreen.screenHeight * 0.5)
            VStack{
                Text("Please")
                    .font(.system(size: 27))
                HStack{
                    Text("Rate")
                        .font(.system(size: 27, weight: .bold))
                        .foregroundColor(Color(red: 0.125, green: 0.722, blue: 0.204))
                    Text("This Application")
                        .font(.system(size: 27, weight: .bold))
                }
                Spacer()
            }
            .padding(.top, UIScreen.screenHeight * 0.1)
            VStack{
            Text("\nI like this app. I can easily convert my images to any format and change photo size in a fast and easy way.")
            }
                .padding([.leading, .trailing, .top], 50)
        }
    }
}

struct onb3: View{
    var body: some View{
        ZStack{
            Image("onb3")
                .resizable()
                .frame( height: UIScreen.screenHeight * 0.5)
            VStack{
                Text("You can")
                    .font(.system(size: 27))
                Text("Save, Share or View")
                    .font(.system(size: 27, weight: .bold))
                    .foregroundColor(Color(red: 0.125, green: 0.722, blue: 0.204))
                Text("Your converted images in your favorite apps")
                    .font(.system(size: 27, weight: .bold))
                    .padding([.leading, .trailing], 40)
                    .multilineTextAlignment(.center)

                Spacer()
            }
            .padding(.top, UIScreen.screenHeight * 0.1)
        }
    }
}

struct onb4: View{
    
    @StateObject var viewRouter: ViewRouter

    var body: some View{
        ZStack{
            Image("onb4")
                .resizable()
                .frame( height: UIScreen.screenHeight * 0.5)
            VStack{
                if (viewRouter.trialperiod != nil)
                {
                    Text("Trial period for \(String(viewRouter.trialperiod)) then \(String(viewRouter.productPrice))")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                }
                else
                {
                    Text("Billed every \(String(viewRouter.subperiod)) at \(String(viewRouter.productPrice))")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                }
                Spacer()
            }
            .padding(.top, UIScreen.screenHeight * 0.15)
        }
    }
}

struct image_switch: View{
    
    @Binding var currentTab: Int
    @StateObject var viewRouter: ViewRouter
    
    init(currentTab: Binding<Int>, viewRouter: StateObject<ViewRouter>){
        self._currentTab = currentTab
        self._viewRouter = viewRouter
    }
    var body: some View{
        switch currentTab{
        case 0:
            onb1()
                .edgesIgnoringSafeArea(.all)
        case 1:
            onb2()
                .edgesIgnoringSafeArea(.all)
        case 2:
            onb3()
                .edgesIgnoringSafeArea(.all)
        case 3:
            onb4(viewRouter: viewRouter)
                .edgesIgnoringSafeArea(.all)
        default:
            Image("onb1")
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct circles: View{
    
    private let circleSize: CGFloat = 9
    private let circleSpacing: CGFloat = 7
    private let primaryColor = Color.white
    private let secondaryColor = Color.white.opacity(0.6)
    private let smallScale: CGFloat = 0.6
    @Binding var currentTab: Int
    
    init(currentTab: Binding<Int>){
        self._currentTab = currentTab
    }
    var body: some View{
        HStack(spacing: circleSpacing) {
            ForEach(0..<4) { index in // 1
                if (currentTab == index)
                {
                    Rectangle()
                    .fill(primaryColor) // 2
                    .frame(width: circleSize * 3, height: circleSize)
                    .transition(AnyTransition.opacity.combined(with: .scale)) // 3
                    .cornerRadius(40)
                    .id(index) // 4
                
                }
                else
                {
                    Circle()
                    .fill(currentTab == index ? primaryColor : secondaryColor) // 2
                    .frame(width: currentTab == index ? circleSize : circleSize, height: circleSize)
                    .transition(AnyTransition.opacity.combined(with: .scale)) // 3
                    .id(index) // 4
                }
                }
            .padding(.top, 20)
            }
    }
}

struct links_restore: View{
    @StateObject var viewRouter: ViewRouter
    
    var body: some View{
        HStack{
                Link("Privacy Policy", destination: URL(string: "http://devcompanyltd.tilda.ws/privacy")!)
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
                Text("     |   ")
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
            Button(action: {viewRouter.restore_product()})
                {
                    Text("Restore")
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
                }
                Text("   |     ")
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
                Link("Terms Of Use", destination: URL(string: "http://devcompanyltd.tilda.ws/terms")!)
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
        }
        .padding(.bottom, 20)
    }
}

struct onBoarding: View {
    @State private var currentTab = 0
    @State private var text_button = "Continue"
    @StateObject var viewRouter: ViewRouter
    @State private var last = false
   
    func `continue`()
    {
        if (currentTab < 3)
        {
            currentTab+=1
            if (currentTab == 2)
            {
                viewRouter.configure()
                SKStoreReviewController.requestReview()
            }
            if (currentTab == 3)
            {
                text_button = "Continue & Subscribe"
                last.toggle()
            }
        }
        else
        {
            if (Apphud.hasActiveSubscription())
            {
                viewRouter.currentPage = .main
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
            else
            {
                viewRouter.subscribeButtonAction()
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
        }
    }
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
            image_switch(currentTab: $currentTab, viewRouter: _viewRouter )
            VStack{
                Spacer()
                Spacer()
                circles(currentTab: $currentTab)
                Button(action: {self.continue()})
                {
                    Text(text_button)
                        .frame(width: UIScreen.screenWidth * 0.85, height: UIScreen.screenHeight / 17)
                        .foregroundColor(.white)
                    
                }
                .frame(width: UIScreen.screenWidth * 0.6)
                .frame(height: UIScreen.screenHeight / 17)
                .background(LinearGradient(gradient: Gradient(colors: [  Color(red: 0.757, green: 0.941, blue: 0.106), Color(red: 0.125, green: 0.722, blue: 0.204)]), startPoint: .init(x: 0.5, y: 0), endPoint: .init(x: 0.5, y: 1)))
                .cornerRadius(30)
                .padding(.bottom, 40)
                .padding(.top, 20)
            links_restore(viewRouter: viewRouter)
        }
        .edgesIgnoringSafeArea(.all)
    }
    }
}

struct onboarding_Previews: PreviewProvider {
    static var previews: some View {
        onBoarding(viewRouter: ViewRouter())
    }
}
