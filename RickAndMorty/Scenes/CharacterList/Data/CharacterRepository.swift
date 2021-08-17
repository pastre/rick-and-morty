import Foundation

// Essa camada decide da onde vem os dados, e como transformálos de bytes em um modelo
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
