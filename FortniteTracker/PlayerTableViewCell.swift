//
//  PlayerTableViewCell.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/6/24.
//

import UIKit

protocol PlayerTableViewCellDelegate: AnyObject {
	func didChangeScore(forPlayer player: Player, newScore: Int)
}


class PlayerTableViewCell: UITableViewCell {
	@IBOutlet weak var profilePictureImage: ProfilePictureImageView!
	@IBOutlet weak var playerLabel: UILabel!
	@IBOutlet weak var playerStepper: UIStepper!
	@IBOutlet weak var scoreLabel: UILabel!
	
	weak var delegate: PlayerTableViewCellDelegate?
	
	var player: Player?
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	@IBAction func stepperValueChanged(_ sender: UIStepper) {
		guard let player = player else {	return	}
		
		let newScore: Int = Int(sender.value)
		scoreLabel.text = String(newScore)
		delegate?.didChangeScore(forPlayer: player, newScore: newScore)
	}
	
	func configure(with player: Player) {
		self.player = player
		profilePictureImage.image = player.profilePicture.image
		playerLabel.text = player.name
		scoreLabel.text = "\(Int(player.score))"
		playerStepper.value = Double(player.score)
		}

}
