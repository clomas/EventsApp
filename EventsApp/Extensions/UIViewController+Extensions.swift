//
//  UIViewController+Extensions.swift
//  EventsApp
//
//  Created by Clint Thomas on 7/12/20.
//

import UIKit


extension UIViewController {

    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }

}
