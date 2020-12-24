import UIKit

class AppStoreService {
    
    
    
    static let shared = AppStoreService()
    
    
    
    func fetchCovidForCountry(completion: @escaping (Result<CovidManager, Error>) -> ()) {
        let endPoint = "https://pomber.github.io/covid19/timeseries.json"
        
        guard let url = URL(string: endPoint) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, res, e) in
            if let e = e {
                completion(.failure(e))
                return
            }
            guard let data = data else { return }
            do {
                let covid = try JSONDecoder().decode(CovidManager.self , from: data)
                completion(.success(covid))
            } catch let jsonErro {
                completion(.failure(jsonErro))
            }
        }
        task.resume()
        
    }
    func fetchData(completion: @escaping (Result<AppStoreManager, Error>) -> () ) {
        let endPoint = "https://api.letsbuildthatapp.com/appstore/featured"
        guard let url = URL(string: endPoint) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (d, r, e) in
            
            if let e = e {
                completion(.failure(e))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(AppStoreManager.self, from: d!)
                completion(.success(data))
                
            } catch let jsonErro {
                completion(.failure(jsonErro))
            }
            
            
        }
        task.resume()
    }
}
