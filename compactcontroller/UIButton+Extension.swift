//
//  UIButton+Extension.swift
//  compactcontroller
//
//  Created by Илья Мудрый on 15.07.2023.
//

import UIKit

extension UIButton {

	static let presentation = {
		var configuration = UIButton.Configuration.filled()
		configuration.baseBackgroundColor = UIColor(red: 96/255, green: 216/255, blue: 56/255, alpha: 1)
		configuration.baseForegroundColor = .black.withAlphaComponent(0.7)
		configuration.contentInsets = .init(top: 5, leading: 10, bottom: 5, trailing: 10)
		configuration.title = "PRESENT"
		configuration.titleAlignment = .center
		let button = UIButton(configuration: configuration)
		return button
	}()

	static let close = {
		let button = UIButton(type: .close)
		button.backgroundColor = .systemPink.withAlphaComponent(0.3)
		button.tintColor = .systemBlue
		button.layer.cornerRadius = button.frame.width / 2
		button.layer.cornerCurve = .continuous
		button.layer.masksToBounds = true
		button.clipsToBounds = true
		return button
	}()
}
