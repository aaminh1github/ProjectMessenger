//
//  RegisterViewController.swift
//  newMessenger
//
//  Created by amnah alhwaiml on 03/06/1443 AH.
//

import UIKit
import FirebaseAuth


class RegisterViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBAction func registerButtonPressed(_ sender: Any) {
        guard let firstname  = firstName.text,
                let lastname = lastName.text,
                let userEmail = email.text,
        let userpass = password.text
        
        else {
            print("errror saving the data")
            return
        }
        FirebaseAuth.Auth.auth().createUser(withEmail: userEmail, password: userpass, completion: {[weak self] authResult, error in
           
                guard let result = authResult , error == nil else {
                    print("Error cureating user")
                    return
                }
            let user = result.user
            print("created user \(user)")
            DispatchQueue.main.async {
                guard let strongSelf = self else{
                    return
                }
                strongSelf.navigationController?.dismiss(animated: true, completion: nil)

            }
            
            
            
            
//            UserDefaults.standard.setValue(self.email, forKey: "email")
//            UserDefaults.standard.setValue("\(self.firstName) \(lastName)", forKey: "name")


             })
    }
    @IBOutlet weak var ProfileImage: UIImageView!
    override func viewDidLoad() {
        
        didTapChangeprofilePic()
        super.viewDidLoad()
        ProfileImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(didTapChangeprofilePic))
        ProfileImage.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
    }
    @objc private func didTapChangeprofilePic(){
        print("profile")
        presentPhotoActionSheet()
        
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
extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // get results of user taking picture or selecting from camera roll
    func presentPhotoActionSheet(){
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        present(actionSheet, animated: true)
    }
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // take a photo or select a photo
        
        // action sheet - take photo or choose photo
        picker.dismiss(animated: true, completion: nil)
        print(info)
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        self.ProfileImage.image = selectedImage
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
