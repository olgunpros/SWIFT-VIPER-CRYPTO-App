
import Foundation
import UIKit

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func startExecution() -> AnyRouter
}

// EntryPoint'ı UIViewController olarak değiştirin
typealias EntryPoint = UIViewController

class CryptoRouter: AnyRouter {
    var entry: EntryPoint?

    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()

        var view: CryptoViewController = CryptoViewController()
        var presenter: AnyPresenter = CryptoPresenter()
        var interactor: AnyInteractor = CryptoInteractor()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.entry = view
        return router
    }
}
