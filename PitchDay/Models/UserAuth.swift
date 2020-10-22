//
//  Auth.swift
//  PitchDay
//
//  Created by Josh on 10/21/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

struct UserAuth {
	
	static func createUser(_ user: NewUser) -> Bool {
		
		var returnValue: Bool = false
		
		Auth.auth().createUser(withEmail: user.email, password: user.password) { authResult, error in
			
			if error != nil {
				print("There was an error. Please contact info@novusclub.org for help. Error message: \(String(describing: error))")
			} else {
				
				returnValue = true
				
				// Storing User Information (firstName, lastName, companyName)
				let db = Firestore.firestore()
				db.collection("users").addDocument(data: ["firstName": user.fName,
														  "lastName": user.lName,
														  "companyName": user.companyName])
				{ (error) in
					if error != nil {
						print("User data could not be stored due to the following error. \(String(describing: error))")
					}}
				
				print("User data stored.")
			
			}}
		
		return returnValue
		
	}
	
}
