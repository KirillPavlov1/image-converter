//
//  MotherView.swift
//  image convertor
//
//  Created by Кирилл on 07.10.2021.
//

import Foundation
import SwiftUI
import CoreData

struct MotherView: View{
    @StateObject var viewRouter: ViewRouter

    var body: some View{
        switch viewRouter.currentPage {
        case .onBoarding:
            onBoarding(viewRouter: viewRouter)
        case .main:
            Main_View()
        }
    }
}

struct MotherView_Previews: PreviewProvider {

    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
