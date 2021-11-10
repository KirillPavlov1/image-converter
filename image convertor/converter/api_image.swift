//
//  api_image.swift
//  image convertor
//
//  Created by Кирилл on 04.11.2021.
//

import Foundation
import SwiftUI

func apiSVG(url: URL)->URL?{
    
    var str:String = url.absoluteString
    print(str)
    let imageData:NSData = NSData.init(contentsOf: url)!
    let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
    let a: [String: Any] = ["Name": "File", "FileValue": ["Name": "file.png", "Data": strBase64]]
    let b: [String: Any] = ["Name": "StoreFile", "Value": true]
    let c: [String: Any] = ["Parameters": [a, b]]
    let jsonData = try? JSONSerialization.data(withJSONObject: c)
    let url = URL(string: "https://v2.convertapi.com/convert/png/to/svg?Secret=gZ20Bu3YPMKPkKAJ")!
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
    let documentsDirectoryURL: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let file: URL? = documentsDirectoryURL?.appendingPathComponent("file.svg")
    var url_done: URL?
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: request){ data, response, error in
        guard let data = data, error == nil else {
            group.leave()
            return
        }
       if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
           if let url_1 = responseJSON["Files"] as? [[String: Any]]
           {
               if let url_2 = url_1[0] as? [String: Any]{
                   if let url_3 = url_2["Url"] as? Any{
                       url_done = URL(string: url_3 as! String)
                   }
               }
           }
       }
        group.leave()
    }.resume()
    group.wait() 
    return(url_done)
}

struct Response: Codable{
    let FileExt: String
    let FileId: String
    let FileName: String
    let FileSize: Int
    let Url: URL
}

extension Dictionary {
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
/* let a: [String: Any] = ["Name": "File",
                         "Filevalue": ["Name":"path", "Data":"<Base64 encoded file content>"]]
 let b: [String: Any] = ["Name": "StoreFile", "Value": true]
 let c: [String: Any] = ["Parameters": [a, b]]*/

 // create post request
