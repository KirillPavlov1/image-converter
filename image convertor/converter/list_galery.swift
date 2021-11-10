//
//  list_galery.swift
//  image convertor
//
//  Created by Кирилл on 20.10.2021.
//

import Foundation
import SwiftUI

struct list3: View{
    @State var button0: Bool = false
    @State var button1: Bool = false
    @State var button2: Bool = false
    @State var button3: Bool = false
    @State var button4: Bool = false
    @State var button5: Bool = false
    @State var button6: Bool = false
    @State var button7: Bool = false
    @Binding var formats: format_image
    var gradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 0.757, green: 0.941, blue: 0.106), Color(red: 0.125, green: 0.722, blue: 0.204)]), startPoint: .init(x: 0, y: 0.0), endPoint: .init(x: 0.75, y: 0.75))
    
    var body: some View{
        VStack{
            HStack{
                Button(action: {button0.toggle(); formats.tiff.toggle()})
                {
                    ZStack{
                        if (button0)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                            
                        VStack{
                            Image(button0 ? "tiff1" : "tiff")
                            Text(".TIFF")
                            .foregroundColor(button0 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button1.toggle(); formats.tif.toggle()})
                {
                    ZStack{
                        if (button1)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button1 ? "tif1" : "tif")
                            Text(".TIF")
                            .foregroundColor(button1 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button2.toggle(); formats.jpeg.toggle()})
                {
                    ZStack{
                        if (button2)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button2 ? "jpeg1" : "jpeg")
                            Text(".JPEG")
                            .foregroundColor(button2 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button3.toggle(); formats.bmpf.toggle()})
                {
                    ZStack{
                        if (button3)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button3 ? "bmpf1" : "bmpf")
                            Text(".BMPF")
                            .foregroundColor(button3 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
            }
            .padding([.leading, .trailing], 10)
            .frame(height: UIScreen.screenHeight * 0.14)
            HStack{
                Button(action: {button4.toggle(); formats.cur.toggle()})
                {
                    ZStack{
                        if (button4)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button4 ? "cur1" : "cur")
                            Text(".CUR")
                            .foregroundColor(button4 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button5.toggle(); formats.xbm.toggle()})
                {
                    ZStack{
                        if (button5)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button5 ? "xbm1" : "xbm")
                            Text(".XBM")
                            .foregroundColor(button5 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button6.toggle(); formats.otb.toggle()})
                {
                    ZStack{
                        if (button6)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button6 ? "otb1" : "otb")
                            Text(".OTB")
                            .foregroundColor(button6 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button7.toggle(); formats.avs.toggle()})
                {
                    ZStack{
                        if (button7)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button7 ? "avs1" : "avs")
                            Text(".AVS")
                            .foregroundColor(button7 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
            }
            
            .padding([.leading, .trailing], 10)
            .frame(height: UIScreen.screenHeight * 0.14)

        }
    }
}

struct list2: View{
    @State var button0: Bool = false
    @State var button1: Bool = false
    @State var button2: Bool = false
    @State var button3: Bool = false
    @State var button4: Bool = false
    @State var button5: Bool = false
    @State var button6: Bool = false
    @State var button7: Bool = false
    @Binding var formats: format_image
    var gradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 0.757, green: 0.941, blue: 0.106), Color(red: 0.125, green: 0.722, blue: 0.204)]), startPoint: .init(x: 0, y: 0.0), endPoint: .init(x: 0.75, y: 0.75))
    var body: some View{
        VStack{
            HStack{
                Button(action: {button0.toggle(); formats.exr.toggle()})
                {
                    ZStack{
                        if (button0)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                            
                        VStack{
                            Image(button0 ? "exr1" : "exr")
                            Text(".EXR")
                            .foregroundColor(button0 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button1.toggle(); formats.ico.toggle()})
                {
                    ZStack{
                        if (button1)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button1 ? "ico1" : "ico")
                            Text(".ICO")
                            .foregroundColor(button1 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button2.toggle(); formats.tga0.toggle()})
                {
                    ZStack{
                        if (button2)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button2 ? "tga1" : "tga")
                            Text(".TGA")
                            .foregroundColor(button2 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button3.toggle(); formats.tga1.toggle()})
                {
                    ZStack{
                        if (button3)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button3 ? "tga1" : "tga")
                            Text(".TGA")
                            .foregroundColor(button3 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
            }
            .padding([.leading, .trailing], 10)
            .frame(height: UIScreen.screenHeight * 0.14)
            HStack{
                Button(action: {button4.toggle(); formats.wbmp.toggle()})
                {
                    ZStack{
                        if (button4)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button4 ? "wbmp1" : "wbmp")
                            Text(".WBMP")
                            .foregroundColor(button4 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button5.toggle(); formats.webp.toggle()})
                {
                    ZStack{
                        if (button5)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button5 ? "webp1" : "webp")
                            Text(".WEBP")
                            .foregroundColor(button5 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button6.toggle(); formats.odd.toggle()})
                {
                    ZStack{
                        if (button6)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button6 ? "odd1" : "odd")
                            Text(".ODD")
                            .foregroundColor(button6 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button7.toggle(); formats.pdf.toggle()})
                {
                    ZStack{
                        if (button7)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button7 ? "pdf1" : "pdf")
                            Text(".PDF")
                            .foregroundColor(button7 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
            }
            
            .padding([.leading, .trailing], 10)
            .frame(height: UIScreen.screenHeight * 0.14)

        }
    }
}

struct list1: View{
    @State var button0: Bool = false
    @State var button1: Bool = false
    @State var button2: Bool = false
    @State var button3: Bool = false
    @State var button4: Bool = false
    @State var button5: Bool = false
    @State var button6: Bool = false
    @State var button7: Bool = false
    @Binding var formats: format_image
    var gradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 0.757, green: 0.941, blue: 0.106), Color(red: 0.125, green: 0.722, blue: 0.204)]), startPoint: .init(x: 0, y: 0.0), endPoint: .init(x: 0.75, y: 0.75))
    
    var body: some View{
        VStack{
            HStack{
                Button(action: {button0.toggle(); formats.svg.toggle()})
                {
                    ZStack{
                        if (button0)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                            
                        VStack{
                            Image(button0 ? "svg1" : "svg")
                            Text(".SVG")
                            .foregroundColor(button0 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button1.toggle(); formats.png.toggle()})
                {
                    ZStack{
                        if (button1)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button1 ? "png1" : "png")
                            Text(".PNG")
                            .foregroundColor(button1 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button2.toggle(); formats.jpg.toggle()})
                {
                    ZStack{
                        if (button2)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button2 ? "jpg1" : "jpg")
                            Text(".JPG")
                            .foregroundColor(button2 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button3.toggle(); formats.gif.toggle()})
                {
                    ZStack{
                        if (button3)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button3 ? "gif1" : "gif")
                            Text(".GIF")
                            .foregroundColor(button3 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
            }
            .padding([.leading, .trailing], 10)
            .frame(height: UIScreen.screenHeight * 0.14)
            HStack{
                Button(action: {button4.toggle(); formats.psd.toggle()})
                {
                    ZStack{
                        if (button4)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button4 ? "psd1" : "psd")
                            Text(".PSD")
                            .foregroundColor(button4 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button5.toggle(); formats.bmp.toggle()})
                {
                    ZStack{
                        if (button5)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button5 ? "bmp1" : "bmp")
                            Text(".BMP")
                            .foregroundColor(button5 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button6.toggle(); formats.eps.toggle()})
                {
                    ZStack{
                        if (button6)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button6 ? "eps1" : "eps")
                            Text(".EPS")
                            .foregroundColor(button6 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
                Button(action: {button7.toggle(); formats.ps.toggle()})
                {
                    ZStack{
                        if (button7)
                        {
                            Rectangle()
                                .fill(gradient)
                        }
                        else
                        {
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        }
                        VStack{
                            Image(button7 ? "ps1" : "ps")
                            Text(".PS")
                            .foregroundColor(button7 ? Color.white : Color.black)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                }
                .cornerRadius(13)
            }
            
            .padding([.leading, .trailing], 10)
            .frame(height: UIScreen.screenHeight * 0.14)

        }
    }
}

