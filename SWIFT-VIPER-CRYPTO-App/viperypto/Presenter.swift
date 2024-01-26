

import Foundation

protocol AnyPresenter {
    var view: AnyView? { get set }
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto],Error>)
        
    
}
class CryptoPresenter : AnyPresenter {
    var view: AnyView?
    
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    
    func interactorDidDownloadCrypto(result: Result<[Crypto],Error>) {
        switch result {
        case .success(let cryptos):
            view?.update(with: cryptos)
        case .failure(_):
            view?.update(with: "try again later...")
        }
    }

}


