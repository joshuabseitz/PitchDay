
//
//  ViewController.swift
//  PitchDay
//
//  Created by Josh on 10/11/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
	
	//	MARK: - Properties
	
	// TODO: logo UIImageView
	
	// Login Button
	let loginButtonCornerRadius: CGFloat = 5.0
	let loginButtonBorderColor = UIColor.white
	let loginButtonBackgroundColor = UIColor.white
	let loginButtonTitle = "Sign In"
	
	// Password Field
	let passwordPlaceholder = NSAttributedString(string: "Password",
												 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let passwordFieldButtonCornerRadius: CGFloat = 5.0
	let passwordFieldButtonBorderColor = UIColor.white.cgColor
	let passwordFieldBorderWidth: CGFloat = 0.75
	let passwordFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// Email Field
	let emailPlaceholder = NSAttributedString(string: "Email",
											  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let emailFieldButtonCornerRadius: CGFloat = 5.0
	let emailFieldButtonBorderColor = UIColor.white.cgColor
	let emailFieldBorderWidth: CGFloat = 0.75
	let emailFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// Sign Up Button
	let signUpButtonText = "Don't already have an account?"
	
	// Footer Label
	let footerLabelText = "novusclub.org"
	
	//	MARK: - IBOUTLETS
	@IBOutlet weak var emailField: CustomTextField!
	@IBOutlet weak var passwordField: CustomTextField!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var logo: UIImageView!
	@IBOutlet weak var footerLabel: UILabel!
	@IBOutlet weak var signUpButton: UIButton!
	
	//	MARK: - View Lifecycles
	override func viewDidLoad() {
		super.viewDidLoad()
		
		emailField.attributedPlaceholder = emailPlaceholder
		emailField.layer.borderColor = emailFieldButtonBorderColor
		emailField.layer.borderWidth = emailFieldBorderWidth
		emailField.layer.cornerRadius = emailFieldButtonCornerRadius
		emailField.leftView = emailFieldPaddingView
		emailField.leftViewMode = .always
		
		passwordField.attributedPlaceholder = passwordPlaceholder
		passwordField.layer.borderColor = passwordFieldButtonBorderColor
		passwordField.layer.borderWidth = passwordFieldBorderWidth
		passwordField.layer.cornerRadius = passwordFieldButtonCornerRadius
		passwordField.leftView = passwordFieldPaddingView
		passwordField.leftViewMode = .always
		
		loginButton.backgroundColor = loginButtonBackgroundColor
		loginButton.layer.cornerRadius = loginButtonCornerRadius
		loginButton.setTitle(loginButtonTitle, for: .normal)
		
		signUpButton.setTitle(signUpButtonText, for: .normal)
		footerLabel.text = footerLabelText
		
	}
	
	// MARK - IBAction
	
//	@IBAction func didTapLogin(_ sender: Any) {
//
//		if CustomTextField.textFieldEmpty(textField: passwordField) || CustomTextField.textFieldEmpty(textField: emailField) {
//
//			displayAlertMessage(messageToDisplay: "Please make sure you have filled out all fields.")
//
//		} else {
//
//			let signInUser: NewUser = 	NewUser(email: emailField.text!,
//											password: passwordField.text!)
//
//			if !signInUser.isEmailValid() {
//				displayAlertMessage(messageToDisplay: "Please enter a valid email.")
//				
//			} else {
//				
//				if (UserAuth.userSignIn(signInUser)) {
//					
//					// ...
//					
//				} else {
//					
//					print("Email and password match not found")
//					displayAlertMessage(messageToDisplay: "We could not find an account associated with that email and password combination.")
//					
//				}
//				
//			}
//
//		}
//
//	}
	
	@IBAction func didTapSignUp(_ sender: Any) {
		performSegue(withIdentifier: "signUp", sender: sender)
	}
	
	func displayAlertMessage(messageToDisplay: String){
		let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
			print("Ok button tapped");
			
		}
		
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion:nil)
	}
	
}
