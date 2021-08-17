import Foundation

final class CharacterRepository {
    
    let service = CharacterService()
    
    func fetchCharacters(completion: @escaping ([Character]) -> Void) {
        service.fetchCharacters { data in
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(Response.self, from: data)
                DispatchQueue.main.async {
                    completion(response.results)
                }
            } catch let error {
                print("deu ruim o decode", error)
            }
        }
    }
}
