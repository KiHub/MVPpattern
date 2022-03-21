//
//  DetailPresenter.swift
//  MVP5
//
//  Created by  Mr.Ki on 21.03.2022.
//

import Foundation

//MARK: - Output protocol
protocol DetailViewProtocol: AnyObject {
    func setComent(coment: Coment?)
}

//MARK: - Input protocol
protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, coment: Coment?)
    func setComent()
}
    
    class DetailPresenter: DetailViewPresenterProtocol {
        weak var view: DetailViewProtocol?
        let networkService: NetworkServiceProtocol!
        var coment: Coment?
        
        required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, coment: Coment?) {
            self.view = view
            self.networkService = networkService
            self.coment = coment
        }
        
       public func setComent() {
           self.view?.setComent(coment: coment)
        }
        
    }

