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
	var sortType: ScoreType
	var id: UUID
	
	init(name: String, profilePicture: UIImage, sortType: ScoreType) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		score = 0
		self.sortType = sortType
		self.id = UUID()
	}
	init (
		name: String,
		profilePicture: UIImage,
		score: Int,
		sortType: ScoreType
	) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		self.score = score
		self.sortType = sortType
		self.id = UUID()
	}
	init(name: String, profilePicture: UIImage) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		score = 0
		self.sortType = .highestScore
		self.id = UUID()
	}
	init (
		name: String,
		profilePicture: UIImage,
		score: Int
	) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		self.score = score
		self.sortType = .highestScore
		self.id = UUID()
	}
	init(name: String, sortType: ScoreType) {
		self.name = name
		let monogramView: MonogramIconUIView = .init(initials: name.first?.uppercased() ?? "", backgroundColour: .systemRed)
		monogramView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		monogramView.layoutIfNeeded()
		self.profilePicture = .init(image: monogramView.asImage())
		score = 0
		self.sortType = sortType
		self.id = UUID()
	}
	init (
		name: String,
		score: Int,
		sortType: ScoreType
	) {
		self.name = name
		let monogramView: MonogramIconUIView = .init(initials: name.first?.uppercased() ?? "", backgroundColour: .systemRed)
		monogramView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		monogramView.layoutIfNeeded()
		self.profilePicture = .init(image: monogramView.asImage())
		self.score = score
		self.sortType = sortType
		self.id = UUID()
	}
	init(name: String) {
		self.name = name
		let monogramView: MonogramIconUIView = .init(initials: name.first?.uppercased() ?? "", backgroundColour: .systemRed)
		monogramView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		monogramView.layoutIfNeeded()
		self.profilePicture = .init(image: monogramView.asImage())
		score = 0
		self.sortType = .highestScore
		self.id = UUID()
	}
	init (
		name: String,
		score: Int
	) {
		self.name = name
		let monogramView: MonogramIconUIView = .init(initials: name.first?.uppercased() ?? "", backgroundColour: .systemRed)
		monogramView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		monogramView.layoutIfNeeded()
		self.profilePicture = .init(image: monogramView.asImage())
		self.score = score
		self.sortType = .highestScore
		self.id = UUID()
	}
	init(name: String, profilePicture: UIImage, sortType: ScoreType, id: UUID) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		score = 0
		self.sortType = sortType
		self.id = id
	}
	init (
		name: String,
		profilePicture: UIImage,
		score: Int,
		sortType: ScoreType,
		id: UUID
	) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		self.score = score
		self.sortType = sortType
		self.id = id
	}
	init(name: String, profilePicture: UIImage, id: UUID) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		score = 0
		self.sortType = .highestScore
		self.id = id
	}
	init (
		name: String,
		profilePicture: UIImage,
		score: Int,
		id: UUID
	) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		self.score = score
		self.sortType = .highestScore
		self.id = id
	}
	init(name: String, sortType: ScoreType, id: UUID) {
		self.name = name
		let monogramView: MonogramIconUIView = .init(initials: name.first?.uppercased() ?? "", backgroundColour: .systemRed)
		monogramView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		monogramView.layoutIfNeeded()
		self.profilePicture = .init(image: monogramView.asImage())
		score = 0
		self.sortType = sortType
		self.id = id
	}
	init (
		name: String,
		score: Int,
		sortType: ScoreType,
		id: UUID
	) {
		self.name = name
		let monogramView: MonogramIconUIView = .init(initials: name.first?.uppercased() ?? "", backgroundColour: .systemBlue)
		monogramView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		monogramView.layoutIfNeeded()
		self.profilePicture = .init(image: monogramView.asImage())
		self.score = score
		self.sortType = sortType
		self.id = id
	}
	init(name: String, id: UUID) {
		self.name = name
		let monogramView: MonogramIconUIView = .init(initials: name.first?.uppercased() ?? "", backgroundColour: .systemRed)
		monogramView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		monogramView.layoutIfNeeded()
		self.profilePicture = .init(image: monogramView.asImage())
		score = 0
		self.sortType = .highestScore
		self.id = id
	}
	init (
		name: String,
		score: Int,
		id: UUID
	) {
		self.name = name
		let monogramView: MonogramIconUIView = .init(initials: name.first?.uppercased() ?? "", backgroundColour: .systemRed)
		monogramView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		monogramView.layoutIfNeeded()
		self.profilePicture = .init(image: monogramView.asImage())
		self.score = score
		self.sortType = .highestScore
		self.id = id
	}
	
}

extension Player: Comparable {
	static func < (lhs: Player, rhs: Player) -> Bool {
		switch lhs.sortType {
		case .highestScore:
			if lhs.score == rhs.score {
				return lhs.name > rhs.name
			}
			return lhs.score > rhs.score
		case .lowestScore:
			if lhs.score == rhs.score {
				return lhs.name < rhs.name
			}
			return lhs.score < rhs.score
		}
	}
}

extension Player: Equatable {
	static func == (lhs: Player, rhs: Player) -> Bool {
		lhs.name == rhs.name
	}
}
