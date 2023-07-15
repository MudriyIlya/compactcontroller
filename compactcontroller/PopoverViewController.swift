//
//  PopoverViewController.swift
//  compactcontroller
//
//  Created by Илья Мудрый on 15.07.2023.
//

import UIKit

final class PopoverViewController: UIViewController {

	private lazy var segmentControl: UISegmentedControl = {
		let control = UISegmentedControl(items: ["280pt","150pt"])
		control.selectedSegmentIndex = 0
		control.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
		return control
	}()

	private lazy var closeButton: UIButton = {
		let button = UIButton.close
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
		return button
	}()

	private lazy var label: UILabel = {
		let label = UILabel()
		label.numberOfLines = 2
		label.textAlignment = .center
		return label
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

		configureUI()
		firstSegmentTap()
	}
}

// MARK: - Private

private extension PopoverViewController {

	func configureUI() {
		preferredContentSize = CGSize(width: 300, height: 280)
		view.backgroundColor = .white

		[segmentControl, closeButton, label].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
		}

		NSLayoutConstraint.activate([
			segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),

			closeButton.heightAnchor.constraint(equalToConstant: 20),
			closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor, multiplier: 1),
			closeButton.centerYAnchor.constraint(equalTo: segmentControl.centerYAnchor),
			closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

			label.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 10),
			label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
		])
	}

	@objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
		if sender.selectedSegmentIndex == 0 {
			firstSegmentTap()
		} else {
			secondSegmentTap()
		}
	}

	func firstSegmentTap() {
		preferredContentSize.height = 280
		label.text = "Ширина: \(preferredContentSize.width)\nВысота: \(preferredContentSize.height)"
		label.textColor = UIColor(red: 96/255, green: 216/255, blue: 56/255, alpha: 1)
	}

	func secondSegmentTap() {
		preferredContentSize.height = 150
		label.text = "Ширина: \(preferredContentSize.width)\nВысота: \(preferredContentSize.height)"
		label.textColor = UIColor(red: 3/255, green: 118/255, blue: 187/255, alpha: 1)
	}

	@objc func closeButtonTapped() {
		dismiss(animated: true)
	}
}
