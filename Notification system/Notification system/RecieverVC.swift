//
//  RecieverVC.swift
//  Notification system
//
//  Created by nika razmadze on 02.08.25.
//

import UIKit

final class ReceiverViewController: UIViewController {
    
    private let statusLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Waiting for ping…"
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 17, weight: .medium)
        return lbl
    }()
    
    private var notificationToken: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(statusLabel)
        statusLabel.center = view.center
        
        notificationToken = NotificationCenter.default.addObserver(
            forName: .didPressCustomButton,
            object: nil,
            queue: .main
        ) { [weak self] note in
            let date = note.userInfo?["timestamp"] as? Date ?? Date()
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .medium
            self?.statusLabel.text = "Received at \(formatter.string(from: date))"
        }
    }
    
    deinit {
        if let token = notificationToken {
            NotificationCenter.default.removeObserver(token)
        }
    }
}
