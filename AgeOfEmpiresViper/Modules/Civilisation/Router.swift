//
//  Router.swift
//  AgeOfEmpiresViper
//
//  Created by karma on 4/29/22.
//

import UIKit
typealias EntryPoint = AnyView & UIViewController
// i can use router to navigate else i can use wireframe to navigate also
protocol AnyRouter {
    //declare the navigation func here
    var entry: EntryPoint? { get }
}

class UserRouter: AnyRouter {
    var entry: EntryPoint?
    
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        // Assign VIP
        let vc = UIStoryboard(name: "UserViewController", bundle: nil).instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        var view: AnyView = vc
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        router.entry = view as? EntryPoint
    
        return router
    }
}

