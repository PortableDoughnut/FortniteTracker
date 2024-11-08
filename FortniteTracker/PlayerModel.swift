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
	
	init(name: String, profilePicture: UIImage, sortType: ScoreType) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		score = 0
		self.sortType = sortType
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
		self.sortType = sortType	}
	init(name: String, profilePicture: UIImage) {
		self.name = name
		self.profilePicture = .init(image: profilePicture)
		score = 0
		self.sortType = .highestScore
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
	}

}

extension Player: Comparable {
	static func < (lhs: Player, rhs: Player) -> Bool {
		if lhs.score == rhs.score {
			return lhs.name > rhs.name
		} else {
			switch lhs.sortType {
				case .highestScore:
					return lhs.score > rhs.score
				case .lowestScore:
					return lhs.score < rhs.score
			}
		}
	}
}

extension Player: Equatable {
	static func == (lhs: Player, rhs: Player) -> Bool {
		lhs.name == rhs.name
	}
}
