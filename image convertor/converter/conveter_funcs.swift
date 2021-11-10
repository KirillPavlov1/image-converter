//
//  conveter_funcs.swift
//  image convertor
//
//  Created by Кирилл on 20.10.2021.
//

import Foundation
import SwiftUI
import ImageIO
import MobileCoreServices
import UniformTypeIdentifiers
import SVGKit

func createPDF(image: UIImage, i: Int) -> URL? {

    let pdfData = NSMutableData()
    let imgView = UIImageView.init(image: image)
    let imageRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
    UIGraphicsBeginPDFContextToData(pdfData, imageRect, nil)
    UIGraphicsBeginPDFPage()
    let context = UIGraphicsGetCurrentContext()
    imgView.layer.render(in: context!)
    UIGraphicsEndPDFContext()
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".pdf")
    try! pdfData.write(to: file!)
    return file
}

func createJPG(image: UIImage, i: Int) -> URL? {
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".jpg")
    let data: Data = image.jpegData(compressionQuality: 0.8)!
    try! data.write(to: file!)
    return file
}

func createPNG(image: UIImage, i: Int) -> URL? {
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".png")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return file
}

func createJPEG(image: UIImage, i: Int) -> URL? {

    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".jpeg")
    let data: Data = image.jpegData(compressionQuality: 0.8)!
    try! data.write(to: file!)
    return file
}

extension UIImage {
    static func animatedGif(from image: UIImage, i: Int) -> URL{
        let fileProperties: CFDictionary = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFLoopCount as String: 0]]  as CFDictionary
        let frameProperties: CFDictionary = [kCGImagePropertyGIFDictionary as String: [(kCGImagePropertyGIFDelayTime as String): 1.0]] as CFDictionary
        
        let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".gif")
        
        if let url = fileURL as CFURL? {
            if let destination = CGImageDestinationCreateWithURL(url, kUTTypeGIF, 1, nil) {
                CGImageDestinationSetProperties(destination, fileProperties)
                    if let cgImage = image.cgImage {
                        CGImageDestinationAddImage(destination, cgImage, frameProperties)
                    }
                if !CGImageDestinationFinalize(destination) {
                    print("Failed to finalize the image destination")
                }
            }
        }
        return(fileURL!)
    }
}

func createPSD(image: UIImage, i: Int)->URL{
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".psd")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createWEBP(data: Data, i: Int)->URL{
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".webp")
    try! data.write(to: file!)
    return(file!)
}

func createEPS(image: UIImage, i: Int)->URL{
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".eps")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createPS(image: UIImage, i: Int)->URL{
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".ps")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createSVG(image: UIImage, i: Int)->URL{
   // SVGKImage.init(contentsOfFile: <#T##String!#>)
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".png")
    
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    var a = try? Data(contentsOf: apiSVG(url: file!)!)
    let file2: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".svg")
    try! a?.write(to: file2!)
    return(file2!)
}

func createEXR(image: UIImage, i: Int)->URL{
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".exr")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createICO(image: UIImage, i: Int)->URL{
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".ico")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createTGA(image: UIImage, i: Int)->URL{
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".tga")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createWBMP(image: UIImage, i: Int)->URL{
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".wbmp")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createODD(image: UIImage, i: Int)->URL{
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".odd")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createTIF(image: UIImage, i: Int)->URL{
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".tif")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createBMPF(image: UIImage, i: Int)->URL{
    let options: NSDictionary = [:]
    let file: URL = image.toData(options: options, type: kUTTypeBMP, i: i, end: "bmpf")!
    return(file)
}

func createCUR(image: UIImage, i: Int)->URL{
    let options: NSDictionary = [:]
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".cur")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createXBM(image: UIImage, i: Int)->URL{
    let options: NSDictionary = [:]
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".xbm")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createOTB(image: UIImage, i: Int)->URL{
    let options: NSDictionary = [:]
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".otb")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

func createAVS(image: UIImage, i: Int)->URL{
    let options: NSDictionary = [:]
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + ".avs")
    let data: Data = image.pngData()!
    try! data.write(to: file!)
    return(file!)
}

extension UIImage {
    func toData (options: NSDictionary, type: CFString, i: Int, end: String) -> URL? {
           guard let cgImage = cgImage else { return nil }
                return autoreleasepool { () -> URL? in
               let data = NSMutableData()
               guard let imageDestination = CGImageDestinationCreateWithData(data as CFMutableData, type, 1, nil) else { return nil }
               CGImageDestinationAddImage(imageDestination, cgImage, options)
               CGImageDestinationFinalize(imageDestination)
               let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
               let file: URL? = documentsDirectoryURL?.appendingPathComponent("file" + String(i) + "." + end)
               try! data.write(to: file!)
               return file
            }
       }
   /* func toJpegData (compressionQuality: CGFloat, hasAlpha: Bool = true, orientation: Int = 6) -> Data? {
        guard cgImage != nil else { return nil }
        let options: NSDictionary =     [
            kCGImagePropertyOrientation: orientation,
            kCGImagePropertyHasAlpha: hasAlpha,
            kCGImageDestinationLossyCompressionQuality: compressionQuality
        ]
        return toData(options: options, type: .jpeg)
    }

    func toData (options: NSDictionary, type: ImageType) -> Data? {
        guard cgImage != nil else { return nil }
        return toData(options: options, type: type.value)
    }

    // about properties: https://developer.apple.com/documentation/imageio/1464962-cgimagedestinationaddimage
    func toData (options: NSDictionary, type: CFString) -> Data? {
        guard let cgImage = cgImage else { return nil }
        return autoreleasepool { () -> Data? in
            let data = NSMutableData()
            guard let imageDestination = CGImageDestinationCreateWithData(data as CFMutableData, type, 1, nil) else { return nil }
            CGImageDestinationAddImage(imageDestination, cgImage, options)
            CGImageDestinationFinalize(imageDestination)
            return data as Data
        }
    }

    // https://developer.apple.com/documentation/mobilecoreservices/uttype/uti_image_content_types
    enum ImageType {
        case image // abstract image data
        case jpeg                       // JPEG image
        case jpeg2000                   // JPEG-2000 image
        case tiff                       // TIFF image
        case pict                       // Quickdraw PICT format
        case gif                        // GIF image
        case png                        // PNG image
        case quickTimeImage             // QuickTime image format (OSType 'qtif')
        case appleICNS                  // Apple icon data
        case bmp                        // Windows bitmap
        case ico                        // Windows icon data
        case rawImage                   // base type for raw image data (.raw)
        case scalableVectorGraphics     // SVG image
        case livePhoto                  // Live Photo

        var value: CFString {
            switch self {
            case .image: return kUTTypeImage
            case .jpeg: return kUTTypeJPEG
            case .jpeg2000: return kUTTypeJPEG2000
            case .tiff: return kUTTypeTIFF
            case .pict: return kUTTypePICT
            case .gif: return kUTTypeGIF
            case .png: return kUTTypePNG
            case .quickTimeImage: return kUTTypeQuickTimeImage
            case .appleICNS: return kUTTypeAppleICNS
            case .bmp: return kUTTypeBMP
            case .ico: return kUTTypeICO
            case .rawImage: return kUTTypeRawImage
            case .scalableVectorGraphics: return kUTTypeScalableVectorGraphics
            case .livePhoto: return kUTTypeLivePhoto
            }
        }
    }*/
}
