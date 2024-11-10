import UIKit

class MonogramIconUIView: UIView {
	
	private let initialsLabel = UILabel()
	
	init(initials: String, backgroundColour: UIColor) {
		super.init(frame: .zero)
		setupView(initials: initials, backgroundColour: backgroundColour)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView(initials: "", backgroundColour: .systemBlue)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = bounds.width / 2
	}
	
	private func setupView(initials: String, backgroundColour: UIColor) {
		self.backgroundColor = backgroundColour
		self.clipsToBounds = true
		
		// Configure initials label
		initialsLabel.text = initials.uppercased().components(separatedBy: " ")
			.compactMap { $0.first }
			.map { String($0) }
			.joined()
		initialsLabel.font = UIFont.systemFont(ofSize: 40)
		initialsLabel.textColor = .white
		initialsLabel.textAlignment = .center
		initialsLabel.translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(initialsLabel)
		
		// Activate constraints
		NSLayoutConstraint.activate([
			initialsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			initialsLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
	}
	
	func configure(initials: String, backgroundColour: UIColor) {
		initialsLabel.text = initials.uppercased().components(separatedBy: " ")
			.compactMap { $0.first }
			.map { String($0) }
			.joined()
		self.backgroundColor = backgroundColour
	}
	
	func asImage() -> UIImage {
		let renderer = UIGraphicsImageRenderer(bounds: bounds)
		return renderer.image { context in
			layer.render(in: context.cgContext)
		}
	}
}
