//
//  PlayerModel.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/6/24.
//

import Foundation
import UIKit

struct Player {
	var name: String
	var profilePicture: ProfilePictureImageView
	var score: Int
	
	init(name: String, profilePicture: UIImage) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		score = 0
	}
	init (name: String, profilePicture: UIImage, score: Int) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		self.score = score
	}
}

extension Player: Comparable {
	static func < (lhs: Player, rhs: Player) -> Bool {
		if lhs.score == rhs.score {
			return lhs.name < rhs.name
		} else {
			return lhs.score < rhs.score
		}
	}
}

extension Player: Equatable {
	static func == (lhs: Player, rhs: Player) -> Bool {
		lhs.name == rhs.name
	}
}

var players: [Player] = [
	Player(name: "Roberto Gómez Bolaños", profilePicture: #imageLiteral(resourceName: "ChapolinColorado.jpg")),
	Player(name: "Izuku Midoriya", profilePicture: #imageLiteral(resourceName: "Deku.jpg")),
	Player(name: "Goku", profilePicture: #imageLiteral(resourceName: "Goku.jpg")),
	Player(name: "Gwen Poole", profilePicture: #imageLiteral(resourceName: "Gwenpool.jpg")),
	Player(name: "Jennifer Walters", profilePicture: #imageLiteral(resourceName: "JenniferWalters.jpg")),
	Player(name: "Jubilation Lee", profilePicture: #imageLiteral(resourceName: "Jubilee.jpg")),
	Player(name: "Gwen Stacy", profilePicture: #imageLiteral(resourceName: "SpiderGwen.jpg"))
].sorted()
