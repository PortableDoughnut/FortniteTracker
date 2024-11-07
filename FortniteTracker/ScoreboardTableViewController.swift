//
//  ScoreboardTableViewController.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/6/24.
//

import UIKit

class ScoreboardTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
			
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
		players.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? PlayerTableViewCell else {
			return UITableViewCell()
		}
		
		let player: Player = players[indexPath.section]
		cell.configure(with: player)
		cell.delegate = self

        return cell
    }


    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
			players.remove(at: indexPath.section)
			tableView.deleteSections([indexPath.section], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
	@IBAction func stepperValueChanged(_ sender: UIStepper) {
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

extension ScoreboardTableViewController: PlayerTableViewCellDelegate {
	func didChangeScore(forPlayer player: Player, newScore: Int) {
		if let index = players.firstIndex(where: { $0.name == player.name }) {
					players[index].score = newScore
					let indexPath = IndexPath(row: 0, section: index)
			tableView.reloadRows(at: [indexPath], with: .automatic)
				}
		players = players.sorted()
		tableView.reloadData()
	}

	
}
