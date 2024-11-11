//
//  PreExistingPlayerTableViewCell.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/10/24.
//

import UIKit

class PreExistingPlayerTableViewCell: UITableViewCell {
	@IBOutlet weak var playerNameLabel: UILabel!
	@IBOutlet weak var playerProfilePicture: ProfilePictureImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func configure(with player: Player) {
		playerNameLabel.text = player.name
		playerProfilePicture.image = player.profilePicture.image
	}
}
