//
//  UiImageViewExtension.swift
//  assignment_2
//
//  Created by Shreyas Prakash Chavan on 28/06/24.
//

import Foundation
import UIKit


extension UIImageView {
    func load(url: URL, completion: @escaping () -> Void) {
        if let cachedImageData = UserDefaults.standard.getImage(url: url) {
            self.image = UIImage(data: cachedImageData)
            completion()
            return
        }
        
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                UserDefaults.standard.addImage(image: data, forKey: url)
                DispatchQueue.main.async {
                    self?.image = image
                    completion()
                }
            }
        }
    }
}
