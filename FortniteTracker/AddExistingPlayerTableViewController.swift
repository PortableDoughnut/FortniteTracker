//
//  AddExistingPlayerTableViewController.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/10/24.
//

import UIKit

class AddExistingPlayerTableViewController: UITableViewController {
	
	var existingPlayers: [Player] = []
	var playerToPass: Player?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		getExistingPlayers()
	}
	
	func getExistingPlayers() {
		for game in games {
			for player in game.players {
				if !existingPlayers.contains(where: {	$0.id == player.id	}) {
					existingPlayers.append(Player(name: player.name, profilePicture: player.profilePicture.image ?? UIImage(), score: 0, id: player.id))
				}
			}
		}
	}
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		existingPlayers.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExistingPlayerCell", for: indexPath) as? PreExistingPlayerTableViewCell else { return UITableViewCell() }
		
		cell.configure(with: existingPlayers[indexPath.row])
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		playerToPass = existingPlayers[indexPath.row]
		performSegue(withIdentifier: "unwindToAddNewGame", sender: self)
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
