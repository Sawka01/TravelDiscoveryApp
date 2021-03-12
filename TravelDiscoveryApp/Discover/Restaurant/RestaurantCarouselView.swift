//
//  RestaurantCarouselView.swift
//  TravelDiscoveryApp
//
//  Created by Khushvaktov Temur on 13.03.2021.
//

import SwiftUI
import Kingfisher

struct RestaurantCarouselContainer: UIViewControllerRepresentable {

    let imageUrlStrings: [String]
    let selectedIndex: Int

    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = CarouselPageViewController(imageUrlStrings: imageUrlStrings, selectedIndex: selectedIndex)
        return pvc
    }

    typealias UIViewControllerType = UIViewController

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

    }
}

class CarouselPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return allControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.selectedIndex
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil}

        if index == 0 { return nil }
        return allControllers[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil}

        if index == allControllers.count - 1 { return nil }
        return allControllers[index + 1]
    }

    var allControllers: [UIViewController] = []
    var selectedIndex: Int

    init(imageUrlStrings: [String], selectedIndex: Int) {
        self.selectedIndex = selectedIndex
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .red

        super.init(transitionStyle: .scroll,
                   navigationOrientation: .horizontal,
                   options: nil)

        allControllers = imageUrlStrings.map({ imageUrlString in
            let hostingController =
                UIHostingController(rootView:
                                        ZStack {
                                            Color.black
                                            KFImage(URL(string: imageUrlString))
                                            .resizable()
                                            .scaledToFit()
                                        }
                )
            hostingController.view.clipsToBounds = true
            return hostingController
        })

        if selectedIndex < allControllers.count {
            setViewControllers([allControllers[selectedIndex]],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }

        self.dataSource = self
        self.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
