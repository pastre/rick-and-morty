import UIKit

enum CharacterListFactory {
    static func make() -> UIViewController {
        let service = CharacterService()
        let repository = CharacterRepository(service: service)
        let useCase = FetchCharactersUseCase(repository: repository)
        let adapter = CharacterListAdapter(adapterDataSource: useCase)
        let controller = ViewController(
            useCases: .init(
                fetchCharactersUseCase: useCase
            ),
            dataSource: adapter
        )
        return controller
    }
}
