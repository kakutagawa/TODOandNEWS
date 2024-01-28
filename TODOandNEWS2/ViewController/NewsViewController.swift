//
//  NewsViewController.swift
//  TODOandNEWS2
//
//  Created by 芥川浩平 on 2024/01/28.
//

import UIKit
import SwiftUI

final class NewsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let newsViewController = UIHostingController(rootView: NewsView())
        addChild(newsViewController)
        view.addSubview(newsViewController.view)
        newsViewController.didMove(toParent: self)

        newsViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            newsViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            newsViewController.view.heightAnchor.constraint(equalTo: view.heightAnchor),
            newsViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newsViewController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension NewsViewController: NewsDelegate {
    func transition(article: Article) {
        let newsDetailViewController = NewsDetailViewController(selectedArticle: article)
        navigationController?.pushViewController(newsDetailViewController, animated: true)
    }
}
