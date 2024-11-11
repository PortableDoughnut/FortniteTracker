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
		var sortedPlayers: [Player]
		
		switch sortType {
		case .highestScore:
			sortedPlayers = players.sorted { $0.score > $1.score }
		case .lowestScore:
			sortedPlayers = players.sorted { $0.score < $1.score }
		}
		
		switch winType {
			case .highestScore:
			switch sortType {
			case .highestScore:
				return sortedPlayers.first ?? Player(name: "Player")
			case .lowestScore:
				return sortedPlayers.last ?? Player(name: "Player")
			}
			case .lowestScore:
				switch sortType {
				case .lowestScore:
					return sortedPlayers.first ?? Player(name: "Player")
				case .highestScore:
					return sortedPlayers.last ?? Player(name: "Player")
			}
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
				sortType: sortType,
				id: $0.id
			)
		}
		self.winType = winType
		self.sortType = sortType
		self.gameImage = ProfilePictureImageView(image: gameImage)
	}
	
	init(
		name: String,
		players: [Player],
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
		let monogramView: MonogramIconUIView = .init(initials: name, backgroundColour: .systemBlue)
		monogramView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
		monogramView.layoutIfNeeded()
		self.gameImage = .init(image: monogramView.asImage())
	}
	init(
		name: String,
		players: [Player],
		gameImage: UIImage,
		winType: ScoreType,
		sortType: ScoreType,
		id: UUID
	) {
		self.id = id
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
	
	init(
		name: String,
		players: [Player],
		winType: ScoreType,
		sortType: ScoreType,
		id: UUID
	) {
		self.id = id
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
		let monogramView: MonogramIconUIView = .init(initials: name, backgroundColour: .systemBlue)
		monogramView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
		monogramView.layoutIfNeeded()
		self.gameImage = .init(image: monogramView.asImage())
	}
	
	init(
		name: String,
		players: [Player]
	) {
		self.id = UUID()
		self.name = name
		self.players = players.map {
			Player.init(
				name: $0.name,
				profilePicture: $0.profilePicture.image ?? UIImage(),
				sortType: .highestScore
			)
		}
		let monogramView: MonogramIconUIView = .init(initials: name, backgroundColour: .systemBlue)
		monogramView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
		monogramView.layoutIfNeeded()
		self.gameImage = .init(image: monogramView.asImage())
		sortType = .highestScore
		winType = .highestScore
	}
}

extension Game: Comparable {
	static func < (lhs: Game, rhs: Game) -> Bool {
		let lhsScore: Int = lhs.winner.score
		let rhsScore: Int = rhs.winner.score
		
		switch lhs.sortType {
			case .highestScore:
				return lhsScore > rhsScore
			case .lowestScore:
				return lhsScore < rhsScore
		}
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
	], winType: .highestScore, sortType: .highestScore)]
