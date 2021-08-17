import UIKit

/*
    - Datasource da tableview
    - Configuracao da celula
 */
final class CharacterListAdapter: NSObject, UITableViewDataSource {
    
    var characters: [Character] = []
    
    // Quantas linhas vai ter?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    // Qual a celula para essa linha?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = characters[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! XGoHorseCharacterCell
        cell.configure(using: character)
        return cell
    }
}
