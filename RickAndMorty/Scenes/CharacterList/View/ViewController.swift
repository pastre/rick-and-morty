import UIKit

/*
    - Binding
    - View
 */

// Acoplamento | Coesao
// Baixa       | Alto

// S | OLID

// Design patterns

class ViewController: UIViewController {
    
    // MARK: - Inner type
    
    struct UseCases {
        let fetchCharactersUseCase: FetchCharactersUseCase
    }
    
    // MARK: - Dependencies
    
    private let useCases: UseCases
    private let dataSource: UITableViewDataSource
    
    // MARK: - Properties
    
    private lazy var charactersView = CharactersView(dataSource: dataSource)
    
    // MARK: - Initialization
    
    init(useCases: UseCases, dataSource: UITableViewDataSource) {
        self.useCases = useCases
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Controller lifecycle
    
    override func loadView() {
        self.view = charactersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        useCases.fetchCharactersUseCase.execute {
            self.charactersView.updateCharacters()
        }
    }
}
