//
//  AddNewGameViewController.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/9/24.
//

import UIKit

class AddNewGameViewController: UIViewController {
	@IBOutlet weak var gameIconImageView: UIImageView!
	@IBOutlet weak var gameTitleTextField: UITextField!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
	
	
	var newGame: Game = .init(name: "", players: [])
	
	var hasChosenImage: Bool = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GenericPlayerTableViewCell")
	}
	
	
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard segue.destination is GameMenuTableViewController else {	return	}
		// Get the new view controller using segue.destination.
		newGame.name = gameTitleTextField.text ?? ""
		if !hasChosenImage {
			let monogramView: MonogramIconUIView = .init(initials: newGame.name.first?.uppercased() ?? "", backgroundColour: .systemBlue)
			monogramView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
			monogramView.layoutIfNeeded()
			newGame.gameImage = .init(image: monogramView.asImage())
		}
		
		// Pass the selected object to the new view controller.
	}
	
	@IBAction func addNewPlayerButtonTapped(_ sender: UIButton) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		if let addNewPlayerVC = storyboard.instantiateViewController(withIdentifier: "AddNewPlayerTableViewController") as? AddNewPlayerTableViewController {
			addNewPlayerVC.delegate = self
			addNewPlayerVC.modalPresentationStyle = .fullScreen
			present(addNewPlayerVC, animated: true, completion: nil)
		}
	}
	
	@IBAction func chooseImageButtonTapped(_ sender: UIButton) {
		if !hasChosenImage {
			hasChosenImage = true
		}
		
		chooseImage(sender)
	}
	
	
	@IBAction func scoreSortValueChanged(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 1:
			newGame.sortType = .lowestScore
		default:
			newGame.sortType = .highestScore
		}
		refreshPlayerSortType(newGame.sortType)
		newGame.players.sort()
		tableView.reloadData()
	}
	

	@IBAction func winnerSortValueChanged(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 1:
			newGame.winType = .lowestScore
			refreshPlayerSortType(.lowestScore)
		default:
			newGame.winType = .highestScore
		}
		refreshPlayerSortType(newGame.sortType)
		newGame.players.sort()
		tableView.reloadData()
	}
	
	@IBAction func unwindToAddNewGame(_ segue: UIStoryboardSegue) {
		guard segue.identifier == "unwindToAddNewGame",
			  let addNewPlayerVC = segue.source as? AddExistingPlayerTableViewController,
			  let playerToPass = addNewPlayerVC.playerToPass else { return }
		print(playerToPass)
			newGame.players.append(playerToPass)
			refreshPlayerSortType(newGame.sortType)
			tableView.reloadData()
	}
	
	func refreshPlayerSortType(_ sortType: ScoreType) {
		for element in newGame.players {
			newGame.players[newGame.players.firstIndex(of: element)!].sortType = sortType
		}
	}
}



extension AddNewGameViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		newGame.players.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewGamePlayerCell") as? GenericPlayerTableViewCell else {
			print("Cell Error")
			return UITableViewCell()	}
		cell.configure(with: newGame.players[indexPath.row])
		return cell
	}
	
	
}

extension AddNewGameViewController: NewPlayerDelegate {
	func didAddNewPlayer(_ player: Player) {
		newGame.players.append(player)
		refreshPlayerSortType(newGame.sortType)
		newGame.players.sort()
		tableView.reloadData()
	}
}

extension AddNewGameViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
		gameIconImageView.image = selectedImage
		newGame.gameImage = .init(image: selectedImage)
		dismiss(animated: true, completion: nil)
	}
}
