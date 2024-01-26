
import Foundation

protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
    func downloadCryptos ()
}
class CryptoInteractor : AnyInteractor {
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            
            guard let data = data, error == nil else {
                return
            }
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                
                self.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
                
            }
            catch {
                    
                
            }
            
        }
        task.resume()
    }
    
    
}
