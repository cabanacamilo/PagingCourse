//
//  ViewController.swift
//  PagingCourse
//
//  Created by Camilo Cabana on 4/09/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pageView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pageViewController = PageViewController()
    let dataSource = ["one", "Two", "Three", "Four"]
    var pageControllerIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setPageViewController()
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .red
        view.addSubview(pageView)
        pageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        pageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        pageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        pageView.addSubview(pageViewController.view)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.view.topAnchor.constraint(equalTo: pageView.topAnchor).isActive = true
        pageViewController.view.bottomAnchor.constraint(equalTo: pageView.bottomAnchor).isActive = true
        pageViewController.view.leadingAnchor.constraint(equalTo: pageView.leadingAnchor).isActive = true
        pageViewController.view.trailingAnchor.constraint(equalTo: pageView.trailingAnchor).isActive = true
    }
    
    func setPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        guard let startingViewController = detailViewController(index: pageControllerIndex) else { return }
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
    }
    
    func detailViewController(index: Int) -> DataViewController? {
        if index >= dataSource.count || dataSource.count == 0 {
            return nil
        }
        let dataViewController = DataViewController()
        dataViewController.index = index
        dataViewController.text = dataSource[index]
        return dataViewController
    }

}

extension ViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pageControllerIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return dataSource.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? DataViewController
        guard var index = dataViewController?.index else { return nil }
        pageControllerIndex = index
        if pageControllerIndex == 0 {
            return nil
        }
        index = index - 1
        return detailViewController(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let dataViewController = viewController as? DataViewController
        guard var index = dataViewController?.index else { return nil }
        if pageControllerIndex == dataSource.count {
            return nil
        }
        index = index + 1
        pageControllerIndex = index
        return detailViewController(index: index)
    }
    
    
}

