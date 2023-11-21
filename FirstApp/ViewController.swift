//
//  ViewController.swift
//  FirstApp
//
//  Created by RLTG on 22.11.2023.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController, ASAuthorizationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appleSignInButton = ASAuthorizationAppleIDButton(type: .default, style: .black)
        appleSignInButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        appleSignInButton.addTarget(self, action: #selector(handleAppleSignInButtonTap), for: .touchUpInside)
        self.view.addSubview(appleSignInButton)
    }

    @IBOutlet weak var imageView: UIImageView!
    
    
    @objc func handleAppleSignInButtonTap() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    @IBAction func changeWhenClicked(_ sender: Any) {
        if imageView.image == UIImage(named: "GMX") {
            imageView.image = UIImage(named: "STG")
        } else {
            imageView.image = UIImage(named: "GMX")
        }
    }
}

