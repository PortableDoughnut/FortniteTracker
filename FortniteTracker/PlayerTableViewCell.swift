//
//  PlayerTableViewCell.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/6/24.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
	@IBOutlet weak var profilePictureImage: ProfilePictureImageView!
	@IBOutlet weak var playerLabel: UILabel!
	@IBOutlet weak var playerStepper: UIStepper!
	@IBOutlet weak var scoreLabel: UILabel!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func configure(with player: Player) {
		profilePictureImage.image = player.profilePicture.image
		playerLabel.text = player.name
		scoreLabel.text = "\(player.score)"
	}

}
