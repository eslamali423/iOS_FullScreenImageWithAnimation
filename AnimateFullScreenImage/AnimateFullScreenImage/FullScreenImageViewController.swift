//
//  FullScreenImageViewController.swift
//  AnimateFullScreenImage
//
//  Created by Eslam Ali  on 28/11/2022.
//

import UIKit

class FullScreenImageViewController: UIViewController, UIGestureRecognizerDelegate {
    
//MARK: - Variables
    
    var image: UIImage = UIImage()
    var dismissHandler: (() ->())?
  
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: self.image)
        imageView.frame = self.view.safeAreaLayoutGuide.layoutFrame
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var closeButton: UIButton = {
        let closeButtonColor: UIColor = .white
        let xmarkCircleFill = UIImage(systemName: "xmark.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.label)
        let closeButtonImage = xmarkCircleFill?.withTintColor(closeButtonColor) ?? UIImage()
        let button = UIButton()
        button.setImage(closeButtonImage, for: .normal)
        button.tintColor = closeButtonColor
        button.addTarget(self, action: #selector(self.handleDismiss), for: .touchUpInside)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.alpha = 0.9
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.setupCloseButton()
    }
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    @objc fileprivate func handleDismiss(button: UIButton) {
        button.isHidden = true
        dismissHandler?()
    }
    
  
    
    fileprivate func setupCloseButton() {
        let buttonWidth: CGFloat = 37
        let topConstant: CGFloat = 50
        let trailingConstant: CGFloat = -15
        
        self.view.addSubview(self.closeButton)
        self.view.bringSubviewToFront(self.closeButton)
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: topConstant).isActive = true
        self.closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: trailingConstant).isActive = true
        self.closeButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        self.closeButton.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    }
    
   
}
