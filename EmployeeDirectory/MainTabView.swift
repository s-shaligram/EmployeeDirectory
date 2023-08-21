//
//  MainTabView.swift
//  EmployeeDirectory
//
//  Created by Sameer Shaligram on 2023-08-12.
//

import Foundation
import SwiftUI
import UIKit



struct BlurredTabBarControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> BlurredTabBarController {
        BlurredTabBarController()
    }
    
    func updateUIViewController(_ uiViewController: BlurredTabBarController, context: Context) {}
}

class BlurredTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = true
        tabBar.barTintColor = .clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.insertSubview(blurView, at: 0)
    }
    
    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        return UIVisualEffectView(effect: blurEffect)
    }()
}

struct MainTabView: View {
    var body: some View {
        BlurredTabBarControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
            .overlay(TabViewContent()) // Your TabView content
    }
}

struct TabViewContent: View {
    var body: some View {
        TabView {
            EmployeesView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Employees")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

