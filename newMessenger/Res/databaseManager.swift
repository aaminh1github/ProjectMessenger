//
//  databaseManager.swift
//  newMessenger
//
//  Created by amnah alhwaiml on 06/06/1443 AH.
//

import Foundation
import FirebaseDatabase

final class databaseManager{
    let shared = databaseManager()
    let database = Database.database().reference()
    
    func test (First_name:String){
        database.child("First_Name").setValue(First_name)
    }
    
    
    
}
