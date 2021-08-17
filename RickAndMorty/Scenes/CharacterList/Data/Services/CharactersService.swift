import Foundation

final class CharacterService {
    func fetchCharacters(completion: @escaping (Data) -> Void ) {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let request = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            completion(data)
        }
        request.resume()
    }
}
