//
//  GameTableViewCell.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/8/24.
//

import UIKit

class GameTableViewCell: UITableViewCell {
	@IBOutlet weak var gamePictureImage: ProfilePictureImageView!
	@IBOutlet weak var gameNameLabel: UILabel!
	@IBOutlet weak var winnerProfilePictureImage: UIImageView!
	@IBOutlet weak var winnerNameLabel: UILabel!
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func update(_ game: Game) {
		gamePictureImage.image = game.gameImage.image
		gameNameLabel.text = game.name
		winnerProfilePictureImage.image = game.winner.profilePicture.image
		winnerNameLabel.text = game.winner.name
	}

}
