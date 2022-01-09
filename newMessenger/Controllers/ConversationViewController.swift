//
//  ConversationViewController.swift
//  newMessenger
//
//  Created by amnah alhwaiml on 03/06/1443 AH.
//

import UIKit
import FirebaseAuth


class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      isLoggedin()
    }
    func isLoggedin(){
        if FirebaseAuth.Auth.auth().currentUser == nil
         {
             
             let vc = storyboard?.instantiateViewController(withIdentifier: "Login") as! LoginViewController
 //            let nav = UINavigationController(rootViewController: vc)
 //            nav.modalPresentationStyle = .fullScreen
 //            present(nav , animated: false)
             navigationController?.pushViewController(vc, animated: true)
         }
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
