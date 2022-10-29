//
//  ViewController.swift
//  iOS-UI-Lesson5
//
//  Created by Максим Донских on 28.10.2022.
//

import UIKit

class ViewController: UIViewController {

    private lazy var profileView: ProfileView = {
        let profileView = ProfileView(frame: CGRect(x: 0, y: 88, width: 414, height: 808))
        profileView.delegate = self
        return profileView
    }()
    
    private let profile = Profile(firstName: "Maksim",
                                  secondName: "Donskikh",
                                  job: "iOS-Developer",
                                  description: "Hockey",
                                  image: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "My Title"
        self.view.backgroundColor = .systemGray
        print(self.view.frame)
        
        self.view.addSubview(self.profileView)
        self.profileView.setup(with: self.profile)
//        self.profileView.frame = self.view.bounds

    }
}

extension ViewController: ProfileViewDelegate {
   
    func openImagePickerController() {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        
        self.present(vc, animated: true)
    }
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        print(#function)
        
        self.profileView.setupAvatar(image)
        self.dismiss(animated: true)
        
    }
    
}
