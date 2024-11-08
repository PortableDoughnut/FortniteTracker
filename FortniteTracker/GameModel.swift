//
//  GameModel.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/8/24.
//

import UIKit

enum ScoreType {
	case highestScore
	case lowestScore
}

struct Game {
	var id: UUID
	var name: String
	var players: [Player]
	var winType: ScoreType
	var sortType: ScoreType
	var winner: Player {
		if winType == sortType {
			players.sorted().first ?? Player(name: "Player", profilePicture: UIImage())
		} else {
			players.sorted().last ?? Player(name: "Player", profilePicture: UIImage())
		}
	}
	var gameImage: ProfilePictureImageView
	
	init(
		name: String,
		players: [Player],
		gameImage: UIImage,
		winType: ScoreType,
		sortType: ScoreType
	) {
		self.id = UUID()
		self.name = name
		self.players = players.map {
			Player.init(
				name: $0.name,
				profilePicture: $0.profilePicture.image ?? UIImage(),
				sortType: sortType
			)
		}
		self.winType = winType
		self.sortType = sortType
		self.gameImage = ProfilePictureImageView(image: gameImage)
	}
	}

var games: [Game] = [Game(name: "Fortnite", players: [
	Player(name: "Roberto Gómez Bolaños", profilePicture: #imageLiteral(resourceName: "ChapolinColorado.jpg")),
	Player(name: "Izuku Midoriya", profilePicture: #imageLiteral(resourceName: "Deku.jpg")),
	Player(name: "Goku", profilePicture: #imageLiteral(resourceName: "Goku.jpg")),
	Player(name: "Gwen Poole", profilePicture: #imageLiteral(resourceName: "Gwenpool.jpg")),
	Player(name: "Jennifer Walters", profilePicture: #imageLiteral(resourceName: "JenniferWalters.jpg")),
	Player(name: "Jubilation Lee", profilePicture: #imageLiteral(resourceName: "Jubilee.jpg")),
	Player(name: "Gwen Stacy", profilePicture: #imageLiteral(resourceName: "SpiderGwen.jpg"))
], gameImage: UIImage(), winType: .highestScore, sortType: .highestScore)]
