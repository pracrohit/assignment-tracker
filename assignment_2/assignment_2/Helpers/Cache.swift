//
//  Cache.swift
//  assignment_2
//
//  Created by Shreyas Prakash Chavan on 28/06/24.
//

import Foundation

extension UserDefaults {
    func addResponse(_ value: Response, forKey query: String) {
        print("saved response to cache with key : " + query)
        do {
            let data = try JSONEncoder().encode(value)
            set(data, forKey: query)
        } catch {
            print("Unable to encode array of CustomObject: \(error)")
        }
    }
    
    // Retrieve CustomObject array
    func getResponse(forKey query: String) -> Response? {
        print("read response from cache with key : " + query)
        guard let data = data(forKey: query) else { return nil }
        do {
            let array = try JSONDecoder().decode(Response.self, from: data)
            return array
        } catch {
            print("Unable to decode array of Response: \(error)")
            return nil
        }
    }
    
    func addImage(image: Data, forKey url: URL){
        print("saved image to cache for url: " + url.absoluteString)
        set(image, forKey: url.absoluteString)
    }
    func getImage(url: URL) -> Data? {
        print("read image form cache for url: " + url.absoluteString)
        return data(forKey: url.absoluteString)
    }
}
