//
//  AddEditCategoryVC.swift
//  ArtableAdmin
//
//  Created by Cristian Sedano Arenas on 29/06/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore

class AddEditCategoryVC: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var categoryImage: RoundedImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var categoryToEdit: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        tap.numberOfTapsRequired = 1
        categoryImage.isUserInteractionEnabled = true
        categoryImage.addGestureRecognizer(tap)
    }
    
    @objc func imageTapped(_ tap: UITapGestureRecognizer) {
        launchImagePicker()
    }
    
    @IBAction func addCategoryClicked(_ sender: Any) {
        activityIndicator.startAnimating()
        uploadImageThenDocument()
    }
    
    func uploadImageThenDocument() {
        
        guard let image = categoryImage.image,
              let categoryName = nameText.text, categoryName.isNotEmpty else {
                simpleAlert(title: "Error", message: "Must add category image and name")
                return
        }
        guard let imageData = image.jpegData(compressionQuality: 0.2) else { return }
        
        let imageRef = Storage.storage().reference().child("/categoryImages/\(categoryName).jpg")
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        imageRef.putData(imageData, metadata: metaData) { (metaData, error) in
            if let error = error {
                self.handlerError(error: error, message: "Unable to upload image")
                return
            }

            imageRef.downloadURL { (url, error) in
                if let error = error {
                    self.handlerError(error: error, message: "Unable to upload image")
                    return
                }
                
                guard let url = url else { return }
                print(url)
                self.uploadDocuments(url: url.absoluteString)
            }
        }
    }
    
    func uploadDocuments(url: String) {
        
        var docRef: DocumentReference!
        var category = Category.init(name: nameText.text!, id: "", imageURL: url, timeStamp: Timestamp())
        
        docRef = Firestore.firestore().collection("categories").document()
        category.id = docRef.documentID
        
        let data = Category.modelToData(category: category)
        docRef.setData(data, merge: true) { (error) in
            
            if let error = error {
                self.handlerError(error: error, message: "Unable to upload new Category to Firebase")
                return
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func handlerError(error: Error, message: String) {
        
        debugPrint(error.localizedDescription)
        self.simpleAlert(title: "Error", message: message)
        self.activityIndicator.stopAnimating()
    }
}

extension AddEditCategoryVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func launchImagePicker() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else { return }
        categoryImage.contentMode = .scaleAspectFill
        categoryImage.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}