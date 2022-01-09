//
//  LoginViewController.swift
//  newMessenger
//
//  Created by amnah alhwaiml on 03/06/1443 AH.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
  
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let userEmail = email.text,
              let userPass = password.text
        else{
            print("cannot Save login data")
            return
        }
        FirebaseAuth.Auth.auth().signIn(withEmail: userEmail, password: userPass) {
            [weak self] AuthDataResult, Error in
            guard let strongSelf = self else{
                               return
                           }
            guard let result = AuthDataResult, Error == nil else{
                print("faild to login")
                return
            }
            let user = result.user
            print("Logged in")
            DispatchQueue.main.async {
               
                strongSelf.navigationController?.dismiss(animated: true, completion: nil)

            }
                    }
        email.text = ""
        password.text = ""
        
        

    }
    //login
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
