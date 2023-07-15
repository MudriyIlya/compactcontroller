//
//  ViewController.swift
//  compactcontroller
//
//  Created by Илья Мудрый on 15.07.2023.
//

import UIKit

final class ViewController: UIViewController {

	private lazy var presentButton: UIButton = {
		let button = UIButton.presentation
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
	}
}

// MARK: - Private

private extension ViewController {

	func configureUI() {
		view.backgroundColor = .white
		view.addSubview(presentButton)

		NSLayoutConstraint.activate([
			presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
		])
	}

	@objc func presentButtonTapped() {
		let popoverViewController = PopoverViewController()
		popoverViewController.modalPresentationStyle = .popover

		if let popoverPresentationController = popoverViewController.popoverPresentationController {
			popoverPresentationController.permittedArrowDirections = .up
			popoverPresentationController.sourceView = self.view
			popoverPresentationController.sourceRect = presentButton.frame
			popoverPresentationController.delegate = self
			present(popoverViewController, animated: true)
		}
	}
}

// MARK: - UIPopoverPresentationControllerDelegate

extension ViewController: UIPopoverPresentationControllerDelegate {

	func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
		.none
	}

	func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
		true
	}
}
