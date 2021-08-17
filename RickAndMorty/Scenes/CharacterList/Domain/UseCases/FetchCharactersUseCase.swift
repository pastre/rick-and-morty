final class FetchCharactersUseCase {
    
    let repository = CharacterRepository()
    
    func execute(completion: @escaping ([Character]) -> Void) {
        repository.fetchCharacters(completion: completion)
    }
}
