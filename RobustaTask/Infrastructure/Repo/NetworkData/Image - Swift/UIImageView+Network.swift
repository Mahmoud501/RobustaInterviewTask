//
//  UIImageView+Network.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/8/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func loadImage(fromURL url: String) {
        
        //1.
        guard let imageURL = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
            return
        }

        //2.
        let cache = URLCache.shared
        var request = URLRequest(url: imageURL)
        request.httpMethod = "GET"
        //3.
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = cache.cachedResponse(for: request)?.data , let image = UIImage.init(data: data) {
                //cache image image
                DispatchQueue.main.async {
                    self.image = image
                }
            }else {
                URLSession.shared.dataTask(with: request) {(data, urlResponse, error) in
                    print("test")
                    if let data = data , let response = urlResponse , ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300,let image = UIImage.init(data: data) {
                        let cacheData = CachedURLResponse(response: response, data: data)
                        cache.storeCachedResponse(cacheData, for: request)
                        DispatchQueue.main.async {
                            self.image = image
                        }
                    }else {
                        print(error?.localizedDescription)
                    }
                }.resume()
            }
        }
    }

}
