import UIKit

/*
    - Datasource da tableview
    - Configuracao da celula
 */

protocol AdapterDataSource {
    func characterCount() -> Int
    func character(at indexPath: Int) -> Character
}

final class CharacterListAdapter: NSObject, UITableViewDataSource {
    
    private let adapterDataSource: AdapterDataSource
    
    init(adapterDataSource: AdapterDataSource) {
        self.adapterDataSource = adapterDataSource
    }
    
    // Quantas linhas vai ter?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        adapterDataSource.characterCount()
    }
    
    // Qual a celula para essa linha?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = adapterDataSource.character(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterCell
        cell.configure(using: character)
        return cell
    }
}
