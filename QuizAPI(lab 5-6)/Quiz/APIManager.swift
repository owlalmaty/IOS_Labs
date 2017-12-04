//
//  APIManager.swift
//  Quiz
//
//  Created by Saulebekov Azamat on 08.10.17.
//  Copyright © 2017 Saulebekov Azamat. All rights reserved.
//

import Foundation

public typealias CompletionClosure = (_ data: Data) -> Void

class APIManager: NSObject{
    
    class func goToAPI(cClusure: @escaping CompletionClosure){
        let urlString = "https://jsonblob.com/api/jsonBlob/d0287d49-ac43-11e7-a12e-ffe9eb939d16"
        
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.addValue("xml", forHTTPHeaderField: "Con")
        request.httpBody = Data()
        
        request.httpMethod = "GET"
        let session = Foundation.URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error -> Void in
            if let jsonData = data{
                if let jsonString = String(data: jsonData, encoding: .utf8){
                    print(jsonString)
                }
                
                DispatchQueue.main.async {
                    cClusure(jsonData)
                }
            }
                
            else if let requestError = error{
                print("\(requestError) error")
            }
            else{
                print("Unexpected error")
            }
        }
        task.resume()
    }
}
