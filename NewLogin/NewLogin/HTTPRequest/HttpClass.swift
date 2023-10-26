////
////  HttpClass.swift
////  NewLogin
////
////  Created by Pranjal Tmarakar on 26/10/23.
////
//
////
////  Api_Http_Class.swift
////  FoodSearch
////
////  Created by Mac Mini 4 on 11/09/23.
////
//
//import Foundation
//import UIKit
//
//
//public enum HTTPMethod: String {
//    case get     = "GET"
//    case post    = "POST"
//    
//}
//
//enum HttpMethod : String{
//    case  GET
//    case  POST
//}
//
//extension String {
//    static let post = "POST"
//    static let get = "GET"
//       
//}
//
//
//enum requestResult {
//    case success(Data? , Any? )
//    case failer(Error)
//}
//
//
//class Api_Http_Class {
//
//    private init(){
//    }
//    class var shareinstance : Api_Http_Class {
//        
//        struct singletone {
//            static var instance = Api_Http_Class()
//        }
//        return singletone.instance
//    }
//    func APICall(methodName : String,params:  Data? , method: HTTPMethod, vc: UIViewController? = nil, completion:@escaping (requestResult) -> Void) {
//        
//        let strUrl = String(format: "%@%@", APIConstant.baseUrl, methodName)
//        if Reachability.shareinstance.isConnectedToNetwork() == true {
//        } else {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//                vc?.singleActionAlert(withTitle: "No internet connections", withMessage: "", withButtonTitle: "OK")
//            }
//        }
//            switch method  {
//            case .options:
//                break;
//            case .get:
//                   guard  let url = URL(string: strUrl)else {
//                       return
//                   }
//                var request = URLRequest(url: url)
//                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//                   request.httpMethod = .get
//
//                   URLSession.shared.dataTask(with: request) { data, response, error in
//                    if((error) == nil) {
//                        guard let data = data else {
//                            return
//                        }
//                        completion( .success(data, response ) )
//                    } else {
//                        if let error = error {
//                            completion( .failer(error))
//                            print("erro:",error.localizedDescription)
// 
//                        }
//                    }
//                   }.resume()
//                break;
//        
//            }
//            
//    }
//   
//    
//    extension Dictionary {
//        func percentEncoded() -> Data? {
//            return map { key, value in
//                let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//                let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//                return escapedKey + "=" + escapedValue
//            }
//            .joined(separator: "&")
//            .data(using: .utf8)
//        }
//    }
//}
//
//  ds.swift
//  DipeshNewProject
//
//  Created by mac on 30/07/19.
//  Copyright © 2019 mac. All rights reserved.
//
 
 import UIKit
import Foundation

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case post    = "POST"
  
}

enum HttpMethod : String{
    case  GET
    case  POST
  
}

extension String {
    static let get = "GET"
    static let post = "POST"
}

enum requestResult {
    case success(Data? , Any? )
    case failer(Error)
}


class Api_Http_Class {
    
    private init(){
    }
    class var shareinstance : Api_Http_Class {
        
        struct singletone {
            static var instance = Api_Http_Class()
        }
        return singletone.instance
    }
    
    func APICall(methodName : String,params:  Data? , method: HTTPMethod, vc: UIViewController? = nil, completion:@escaping (requestResult) -> Void) {
        
        let strUrl = String(format: "%@%@", APIConstant.baseUrl, methodName)
        let getUrl = String(format: "%@%@", APIConstant.getBaseUrl, methodName)
        if Reachability.shareinstance.isConnectedToNetwork() == true {
        } else {
            
        }
        switch method  {
        case .options:
            break;
        case .get:
            guard  let url = URL(string: getUrl)else {
                return
            }
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = .get
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if((error) == nil) {
                    guard let data = data else {
                        return
                    }
                    completion( .success(data, response ) )
                } else {
                    if let error = error {
                        completion( .failer(error))
                        
                    }
                }
            }.resume()
            break;
        case .post:
            guard  let url = URL(string: strUrl)else {
                return
            }
            var request = URLRequest(url: url)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod  = .post
            request.httpBody    = params
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if((error) == nil ) {
                    guard let data = data else {
                        return
                    }
                    completion( .success(data, response ))
                } else {
                    if let error = error {
                        completion( .failer(error))
                        //   lf.alrtMathod(des: AlertClass.interestMsg, vc: vc)
                    }
                }
            }.resume()
        }
        
    }
    
}



extension Api_Http_Class {
    func convertFormField(named name: String, value: String, using boundary: String) -> String {
      var fieldString = "--\(boundary)\r\n"
      fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"
      fieldString += "\r\n"
      fieldString += "\(value)\r\n"

      return fieldString
    }
    func convertFileData(fieldName: String, fileName: String, mimeType: String, fileData: Data, using boundary: String) -> Data {
      let data = NSMutableData()
      data.appendString("--\(boundary)\r\n")
      data.appendString("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n")
      data.appendString("Content-Type: \(mimeType)\r\n\r\n")
      data.append(fileData)
      data.appendString("\r\n")
      return data as Data
    }
}

extension NSMutableData {
  func appendString(_ string: String) {
    if let data = string.data(using: .utf8) {
      self.append(data)
    }
  }
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

 


 
extension Data{
mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
    if let data = string.data(using: encoding) {
        append(data)
    }
}
}
