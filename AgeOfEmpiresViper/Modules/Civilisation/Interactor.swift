//
//  Interactor.swift
//  AgeOfEmpiresViper
//
//  Created by karma on 4/29/22.
//

import Foundation
import Alamofire

// Object
// Protocol
// ref to presenter

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    func getCivs(url:URL)
    
}

protocol InteractorOuput {
    func getDataSuccessfull()
}

class UserInteractor: AnyInteractor {
//    func getCivs(url: URL, completion: () -> Void) {
//        <#code#>
//    }
    
    var presenter: AnyPresenter?
    var presenterOutput: InteractorOuput?
    
    // calling the api here
    func getCivs(url: URL){//, completion: @escaping WebServiceResponse){
        
        AF.request(url).response { response in
//            if let error = response.error {
//                completion(nil,error)
//            }else if let jsonArray = response.result {
//                print()
//            }
            
            let data = response.data
            
            do{
                guard let data = data else {
                    return
                }
                let decodedData = try JSONDecoder().decode(CivilizationResModel.self, from: data)
                guard let civs = decodedData.civilizations else {
                    // this means the api call was failed so we need to send the error data
                    self.presenter?.interactorDidFetchCivs(with: .failure(FetchError.failed))
                    
                    return
                    
                }
                
                // send the data to the presenter through protocol
                
                self.presenter?.interactorDidFetchCivs(with: .success(civs))
//                presenterOutput?.getDataSuccessfull()
//                print(decodedData.civilizations)
            }
            catch let error{
                print(error)
            }
//            print(response)
            
        }
        
    }
}
