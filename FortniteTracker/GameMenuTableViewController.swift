//
//  GameMenuTableViewController.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/8/24.
//

import UIKit

class GameMenuTableViewController: UITableViewController {
	var gameToPass: Game = .init(
		name: "Game",
		players: [Player(name: "Player", profilePicture: UIImage())],
		gameImage: UIImage(),
		winType: .highestScore,
		sortType: .highestScore
	)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.leftBarButtonItem = self.editButtonItem
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return games.count
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: "GameCell",
			for: indexPath
		) as? GameTableViewCell else {	return UITableViewCell()	}
		
		// Configure the cell...
		cell.update(games[indexPath.section])
		
		return cell
	}
	
	// Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			games.remove(at: indexPath.section)
			tableView.deleteSections([indexPath.section], with: .fade)
		} else if editingStyle == .insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		84
	}
	
	override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
		let movedObject = games[fromIndexPath.section]
		games.remove(at: fromIndexPath.section)
		games.insert(movedObject, at: to.section)
	}
	
	// Override to support conditional rearranging of the table view.
	override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the item to be re-orderable.
		return true
	}
	
	// MARK: - Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destination.
		if segue.identifier == "gameToScoreboardSegue" {
			guard let destination = segue.destination as? ScoreboardTableViewController,
				  let senderCell = sender as? GameTableViewCell
			else {	return	}
			destination.currentGameIndex = tableView.indexPath(for: senderCell)!.section
		}
		// Pass the selected object to the new view controller.
	}
	
	@IBAction func unwindToGameMenu(_ segue: UIStoryboardSegue) {
		guard let source = segue.source as? AddNewGameViewController else { return }
		games.append(source.newGame)
		tableView.reloadData()
	}
	
}
