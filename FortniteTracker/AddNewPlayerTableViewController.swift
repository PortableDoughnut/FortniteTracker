//
//  AddNewPlayerTableViewController.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/7/24.
//

import UIKit

class AddNewPlayerTableViewController: UITableViewController {
	@IBOutlet weak var playerNameTextField: UITextField!
	@IBOutlet weak var currentScoreTextField: UITextField!
	@IBOutlet weak var choosePlayerImageButton: UIButton!
	@IBOutlet weak var playerImageView: UIImageView!
	@IBOutlet weak var savePlayerButton: UIButton!
	
	var elemenntsEntered: Int = 0
	var hasEditedPlayerName: Bool = false
	var hasEditedCurrentScore: Bool = false
	var hasChosenImage: Bool = false
	
	var newPlayer: Player?
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		savePlayerButton.isEnabled = false
    }
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
		guard segue.identifier == "scoreboardUnwind" else {	return	}
        // Pass the selected object to the new view controller.
		newPlayer = Player(
			name: playerNameTextField.text ?? "Player",
			profilePicture: playerImageView.image ?? UIImage(),
			score: Int(currentScoreTextField.text!) ?? 0
		)
    }

	@IBAction func chooseImageButton(_ sender: UIButton) {
		chooseImage(sender)
		
		if !hasChosenImage {
			hasChosenImage = true
			ifTrueEnableSaveButton()
		}
	}
	
	@IBAction func playerNameEditingDidBegin(_ sender: UITextField) {
		if !hasEditedPlayerName {
			hasEditedPlayerName = true
			ifTrueEnableSaveButton()
		}
	}
	
	@IBAction func currentScoreEditingDidBeginning(_ sender: UITextField) {
		if !hasEditedCurrentScore {
			hasEditedCurrentScore = true
			ifTrueEnableSaveButton()
		}
	}
	
	@IBAction func savePlayerButtonPressed(_ sender: UIButton) {
	}
	
	func ifTrueEnableSaveButton() {
		elemenntsEntered += 1
		
		if elemenntsEntered == 3 {
			savePlayerButton.isEnabled = true
		} else {
			savePlayerButton.isEnabled = false
		}
	}
	

}

extension AddNewPlayerTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func chooseImage(_ sender: UIButton) {
		let imagePicker: UIImagePickerController = .init()
		imagePicker.delegate = self
		
		let alertController: UIAlertController = .init(
			title: "Choose Image",
			message: nil,
			preferredStyle: .actionSheet
		)
		
		let calcelAction: UIAlertAction = .init(title: "Cancel", style: .cancel, handler: nil)
		alertController.addAction(calcelAction)
		
		if UIImagePickerController.isSourceTypeAvailable(.camera) {
			let cameraAction: UIAlertAction = .init(title: "Camera", style: .default) { _ in
				imagePicker.sourceType = .camera
				self.present(imagePicker, animated: true, completion: nil)
			}
			alertController.addAction(cameraAction)
		}
		
		if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
			let photoLibraryAction: UIAlertAction = .init(title: "Photo Library", style: .default) { _ in
				imagePicker.sourceType = .photoLibrary
				self.present(imagePicker, animated: true, completion: nil)
			}
			alertController.addAction(photoLibraryAction)
		}
		alertController.popoverPresentationController?.sourceView = sender
		
		present(alertController, animated: true, completion: nil)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
		guard let selectedImage: UIImage = info[.originalImage] as? UIImage else { return }
		playerImageView.image = selectedImage
		dismiss(animated: true, completion: nil)
	}
}
