//
//  ModuleBuilder.swift
//  MVP5
//
//  Created by  Mr.Ki on 20.03.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(coment: Coment?) -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkServoce()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    static func createDetailModule(coment: Coment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkServoce()
        let presenter = DetailPresenter(view: view, networkService: networkService, coment: coment)
        view.presenter = presenter
        return view
    }
    
}
