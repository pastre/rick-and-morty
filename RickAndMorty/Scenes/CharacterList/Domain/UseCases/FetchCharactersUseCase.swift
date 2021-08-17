
// Essa camada faz uma regra de negócio
final class FetchCharactersUseCase {
    
    let repository = CharacterRepository()
    
    func execute(completion: @escaping ([Character]) -> Void) {
        repository.fetchCharacters(completion: completion)
    }
}
