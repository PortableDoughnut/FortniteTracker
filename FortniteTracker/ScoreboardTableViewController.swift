//
//  ScoreboardTableViewController.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/6/24.
//

import UIKit

class ScoreboardTableViewController: UITableViewController {

	var currentGameIndex: Int?
	var currentGamePlayers: [Player] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		currentGamePlayers = games[currentGameIndex!].players.sorted()
    }
	
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
		currentGamePlayers.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? PlayerTableViewCell else {
			return UITableViewCell()
		}
		
		let player: Player = currentGamePlayers[indexPath.section]
		cell.configure(with: player)
		cell.delegate = self

        return cell
    }


    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
			games[currentGameIndex!].players.remove(at: indexPath.section)
			tableView.deleteSections([indexPath.section], with: .fade)
			sortReload()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
	@IBAction func stepperValueChanged(_ sender: UIStepper) {
	}
	
	@IBAction func addPlayerButtonTapped(_ sender: UIBarButtonItem) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		if let addNewPlayerVC = storyboard.instantiateViewController(withIdentifier: "AddNewPlayerTableViewController") as? AddNewPlayerTableViewController {
			addNewPlayerVC.delegate = self
			addNewPlayerVC.modalPresentationStyle = .fullScreen
			present(addNewPlayerVC, animated: true, completion: nil)
		}
	}
	
	func sortReload() {
		currentGamePlayers = games[currentGameIndex!].players.sorted()
		tableView.reloadData()
	}

}

extension ScoreboardTableViewController: PlayerTableViewCellDelegate {
	func didChangeScore(forPlayer player: Player, newScore: Int) {
		if let index = games[currentGameIndex!].players.firstIndex(where: { $0.name == player.name }) {
			games[currentGameIndex!].players[index].score = newScore
					let indexPath = IndexPath(row: 0, section: index)
			tableView.reloadRows(at: [indexPath], with: .automatic)
				}
		sortReload()
	}

	
}

extension ScoreboardTableViewController: NewPlayerDelegate {
	func didAddNewPlayer(_ player: Player) {
		guard let currentGameIndex = currentGameIndex else {	return	}
		games[currentGameIndex].players.append(player)
		games[currentGameIndex].players.sort()
		sortReload()
	}
}
