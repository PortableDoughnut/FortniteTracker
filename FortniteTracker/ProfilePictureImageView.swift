//
//  ProfilePictureImageView.swift
//  FortniteTracker
//
//  Created by Gwen Thelin on 11/6/24.
//

import UIKit

@IBDesignable class ProfilePictureImageView: UIImageView {
	override func layoutSubviews() {
			super.layoutSubviews()
			if (frame.width != frame.height) {
				NSLog("Ended up with a non-square frame -- so it may not be a circle");
			}
			layer.cornerRadius = frame.width / 2
			layer.masksToBounds = true
		}
}
