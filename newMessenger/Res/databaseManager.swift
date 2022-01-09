//
//  databaseManager.swift
//  newMessenger
//
//  Created by amnah alhwaiml on 06/06/1443 AH.
//

import Foundation
import FirebaseDatabase

final class databaseManager{
   static let shared = databaseManager()
    private let database = Database.database().reference()
    
}


// MARK: - accunt managment

extension databaseManager{
    
    
    public func isExist(whith email:String, completion : @escaping ((Bool) -> Void)){
        var safeEmail = email.replacingOccurrences(of: "@", with: "_")
        safeEmail = email.replacingOccurrences(of: ".", with: "_")

        database.child(safeEmail).observeSingleEvent(of: .value , with: { snapshot in
            guard snapshot.value as? String != nil else {
                
                completion(false)
                return
            }
            completion(true)
        })
    }
    /// fill user info
    func insertUser (with user :newMessengerUser){
        var safeEmail = user.email.replacingOccurrences(of: "@", with: "_")
        safeEmail = safeEmail.replacingOccurrences(of: ".", with: "_")
        
        database.child(safeEmail).setValue(["first_name":user.first_name,
                       "last_name":user.last_name])
    }
    
}

struct newMessengerUser{
    var first_name :String
    var last_name:String
    var email:String
    //var profileImage : URL
}
