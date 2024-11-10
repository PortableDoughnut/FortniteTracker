//
//  GenericPlayerTableViewCell.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/9/24.
//

import UIKit

class GenericPlayerTableViewCell: UITableViewCell {
	@IBOutlet weak var playerProfilePictureImage: ProfilePictureImageView!
	@IBOutlet weak var playerNameLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func configure(with player: Player) {
		playerProfilePictureImage.image = player.profilePicture.image
		playerNameLabel.text = player.name
	}

}
