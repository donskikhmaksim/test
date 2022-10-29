//
//  ProfileViewController.swift
//  iOS-UI-Lesson5
//
//  Created by Максим Донских on 28.10.2022.
//

import UIKit

protocol ProfileViewDelegate: AnyObject {
    func openImagePickerController()
}

class ProfileView: UIView {

    private lazy var avatarImageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 57, y: 88, width: 300, height: 300))
//        imageView.backgroundColor = .systemRed
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var cameraImageView: UIImageView = {
//        let button = UIButton(frame: CGRect(x: 282, y: 313, width: 75, height: 75))
        let cameraImageView = UIImageView(frame: CGRect(x: 282, y: 313, width: 75, height: 75))
//        cameraImageView.backgroundColor = .systemBlue
//        cameraImageView.setTitleColor(.white, for: .normal)
        cameraImageView.contentMode = .scaleAspectFit
        cameraImageView.layer.cornerRadius = 16
        cameraImageView.clipsToBounds = true
        cameraImageView.isUserInteractionEnabled = true
        cameraImageView.layer.borderColor = UIColor.white.cgColor
        cameraImageView.layer.borderWidth = 3
        return cameraImageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 217.5, height: 20.5))
//        label.backgroundColor = .orange
        return label
    }()
    
    private lazy var jobLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 28.5, width: 217.5, height: 20.5))
//        label.backgroundColor = .purple
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 57, width: 217.5, height: 20.5))
//        label.backgroundColor = .white
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: CGRect(x: 57, y: 410, width: 217.5, height: 77.5))
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
//        stackView.backgroundColor = .black
        return stackView
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 57, y: 511, width: 300, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(self.cameraImageViewHandler), for: .touchUpInside)
//        button.backgroundColor = .yellow
        
        return button
    }()
    
    weak var delegate: ProfileViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
//        self.backgroundColor = .systemGreen
        self.backgroundColor = .systemBackground
        
        self.addSubview(self.avatarImageView)
        self.addSubview(self.cameraImageView)
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.nameLabel)
        self.stackView.addArrangedSubview(self.jobLabel)
        self.stackView.addArrangedSubview(self.descriptionLabel)
        self.addSubview(self.editButton)
        
        self.setupGestures()
    }
    
    func setup(with profile: Profile) {
        self.avatarImageView.image = profile.image ?? UIImage(systemName: "person.circle")
        self.cameraImageView.image = UIImage(systemName: "camera")
        self.nameLabel.text = profile.fullname
        self.jobLabel.text = profile.job
        self.descriptionLabel.text = profile.description
    }
    
    func setupAvatar(_ image: UIImage) {
        self.avatarImageView.image = image
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cameraImageViewHandler))
        self.cameraImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func cameraImageViewHandler() {
        self.delegate?.openImagePickerController()
    }
    
}
