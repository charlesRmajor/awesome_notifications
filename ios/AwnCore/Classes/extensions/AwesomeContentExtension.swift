//
//  AwesomeContentExtension.swift
//  awesome_notifications
//
//  Created by Rafael Setragni on 22/10/20.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import Foundation

// https://stackoverflow.com/questions/39882188/how-do-you-create-a-notification-content-extension-without-using-a-storyboard
struct NotificationView: View {
    var body: some View {
        Text("Hello, World this is a SwiftUI view!")
            .fontWeight(.bold)
    }
}

@available(iOS 10.0, *)
open class AwesomeContentExtension: UIViewController, UNNotificationContentExtension {
    var hostingView: UIHostingController<NotificationView>!

    open override func viewDidLoad() {
        print('AwesomeContentExtension viewDidLoad');
        super.viewDidLoad()
        view.backgroundColor = .red

    }
    
    public func didReceive(_ notification: UNNotification) {
      print('AwesomeContentExtension didReceive');

      let notificationView = NotificationView()
      hostingView = UIHostingController(rootView: notificationView)

      self.view.addSubview(hostingView.view)
      hostingView.view.translatesAutoresizingMaskIntoConstraints = false

      hostingView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      hostingView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      hostingView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      hostingView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
