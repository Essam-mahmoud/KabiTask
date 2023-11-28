//  GoLyv
//
//  Created by Essam Orabi on 20/10/2023.
//

import Foundation

class NetworkManager {
    class func loadData<T: Decodable>(from url: URL?, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(type, from: data)
                completion(.success(results))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
}
