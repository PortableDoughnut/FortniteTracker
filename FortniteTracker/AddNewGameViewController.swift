//
//  AddNewGameViewController.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/9/24.
//

import UIKit

class AddNewGameViewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	
	var newGamePlayers: [Player] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GenericPlayerTableViewCell")
	}
	
	//	@IBAction func unwindToNewGame(_ segue: UIStoryboardSegue) {
	//		guard segue.identifier == "gameUnwind",
	//			  let source = segue.source as? AddNewPlayerTableViewController,
	//			  let newPlayer = source.newPlayer
	//		else {	return	}
	//
	//		newGamePlayers.append(newPlayer)
	//		tableView.reloadData()
	//	}
	
	
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		//		if let destination = segue.destination as? AddNewPlayerTableViewController {
		//			destination.sourceViewController = "gameUnwind"
		//		}
		// Get the new view controller using segue.destination.
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
	
	
}

extension AddNewGameViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		newGamePlayers.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewGamePlayerCell") as? GenericPlayerTableViewCell else {
			print("Cell Error")
			return UITableViewCell()	}
		cell.configure(with: newGamePlayers[indexPath.row])
		return cell
	}
	
	
}

extension AddNewGameViewController: NewPlayerDelegate {
	func didAddNewPlayer(_ player: Player) {
		print("""
New Player in NewGameViewController:
 Name: \(player.name)
 Score: \(player.score)
""")
		
		newGamePlayers.append(player)
		newGamePlayers.sort()
		tableView.reloadData()
	}
}
