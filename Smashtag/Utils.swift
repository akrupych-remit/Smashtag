//
//  Utils.swift
//  Smashtag
//
//  Created by Andriy Krupych on 6/6/17.
//  Copyright © 2017 Andriy Krupych. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func load(imageUrl: URL?) {
        guard let imageUrl = imageUrl else { return }
        URLSession.shared.dataTask(with: imageUrl) { [weak self] (data, response, error) in
            if error != nil {
                print("Failed fetching image:", error!)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Not a proper HTTPURLResponse or statusCode")
                return
            }
            
            DispatchQueue.main.async {
                self?.image = UIImage(data: data!)
            }
        }.resume()
    }
    
    func load(imageUrlString: String?){
        guard let imageUrlString = imageUrlString, let url = URL(string: imageUrlString) else { return }
        load(imageUrl: url)
    }
    
}
