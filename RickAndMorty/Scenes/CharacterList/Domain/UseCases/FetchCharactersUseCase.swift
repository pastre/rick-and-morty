final class FetchCharactersUseCase {
    
    private let repository: CharacterRepositoryProtocol
    
    private var characters: [Character] = []
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(completion: @escaping () -> Void) {
        repository.fetchCharacters {
            self.characters = $0
            completion()
        }
    }
}

extension FetchCharactersUseCase: AdapterDataSource {
    func characterCount() -> Int {
        characters.count
    }
    
    func character(at indexPath: Int) -> Character {
        characters[indexPath]
    }
}
