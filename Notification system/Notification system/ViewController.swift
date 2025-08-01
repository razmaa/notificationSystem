//
//  ViewController.swift
//  Notification system
//
//  Created by nika razmadze on 02.08.25.
//

import UIKit

final class SenderViewController: UIViewController {

    private let triggerButton: UIButton = {
        var cfg = UIButton.Configuration.filled()
        cfg.title = "Ping!"
        let btn = UIButton(configuration: cfg)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(triggerButton)
        triggerButton.center = view.center
        triggerButton.addTarget(self,
                                action: #selector(didTapButton),
                                for: .touchUpInside)
    }

    @objc private func didTapButton() {
        NotificationCenter.default.post(
            name: .didPressCustomButton,
            object: self,                     
            userInfo: ["timestamp": Date()]
        )
    }
}

extension Notification.Name {
    static let didPressCustomButton = Notification.Name("didPressCustomButton")
}

