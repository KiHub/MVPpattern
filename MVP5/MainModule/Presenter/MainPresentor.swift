//
//  MainPresentor.swift
//  MVP5
//
//  Created by  Mr.Ki on 20.03.2022.
//

import Foundation

//MARK: - Output protocol
protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

//MARK: - Input protocol
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getComents()
    var coments: [Coment]? {get set}
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var coments: [Coment]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComents()
    }
    func getComents() {
        networkService.getComents { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let coments):
                    self.coments = coments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
