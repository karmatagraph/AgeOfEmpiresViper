//
//  Presenter.swift
//  AgeOfEmpiresViper
//
//  Created by karma on 4/29/22.
//

import Foundation

// Object
// Protocol
// ref to Interactor, router, view

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var interactor: AnyInteractor? { get set }
    var router: AnyRouter? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchCivs(with: Result<[Civilization], Error>)
    
}

class UserPresenter: AnyPresenter {
    var view: AnyView?
    
    
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet{
            interactor?.getCivs(url: Endpoints.civs.url)
        }
    }
    
    func interactorDidFetchCivs(with result: Result<[Civilization], Error>) {
        switch result{
            
        case .success(let civs):
            view?.update(with: civs)
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
    
}

//extension UserPresenter: InteractorOuput {
//    func getDataSuccessfull() {
//        view.presentData()
//    }
//}
