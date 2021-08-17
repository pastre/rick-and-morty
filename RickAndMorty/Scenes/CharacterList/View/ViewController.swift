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
    
    @IBOutlet weak var charactersTableView: UITableView!
    
    let adapter = CharacterListAdapter()
    let fetchCharactersUseCase = FetchCharactersUseCase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAdapter()
        loadData()
    }
    
    func loadData() {
        fetchCharactersUseCase.execute { characters in
            self.updateCharacters(using: characters)
        }
    }
    
    func setupAdapter() {
        charactersTableView.dataSource = adapter
    }
    
    func updateCharacters(using characters: [Character]) {
        adapter.characters = characters
        charactersTableView.reloadData()
    }
}
