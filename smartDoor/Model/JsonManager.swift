//
//  JsonManager.swift
//  smartDoor
//
//  Created by Jesús Lugo Sáenz on 12/05/24.
//

import Foundation

struct JsonManager: Codable {
    let send: Send
    let answer: Answer
}

struct Answer: Codable {
    let unlocked, removed, added, deniedAccess: String
}

struct Send: Codable {
    let verifiedFID, deniedFID, add, remove: String
}

func load <T: Decodable>(_ fileName: String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)else{
        fatalError("No se encontro el siguiente nombre del archivo \(fileName)")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("No se pudo cargar la data: \(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("No se pudo decodificar la informacion como \(T.self):\(error)")
    }
}
