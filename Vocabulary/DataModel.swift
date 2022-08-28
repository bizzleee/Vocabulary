//
//  DataModel.swift
//  Vocabulary
//
//  Created by Alejandro Pallares on 21/08/22.
//

import Foundation

class DataModel {
    
    var list = [Language]()
    
    func documentDirectory() -> URL {
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func dataFile() -> URL {
        documentDirectory().appendingPathComponent("Vocabulary.plist")
    }
    
    func saveVocabulary() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try? encoder.encode(list)
            try data?.write(to: dataFile(), options: .atomic)
            
        } catch {
            print("Error encoding list array: \(error.localizedDescription)")
        }
    }
    
    
    
}
