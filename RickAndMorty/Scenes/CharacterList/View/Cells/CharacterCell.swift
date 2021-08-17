import UIKit

final class XGoHorseCharacterCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var speciesLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var characterImageView: UIImageView!
    
    func configure(using character: Character) {
        
        nameLabel.text = character.name
        genderLabel.text = character.gender
        speciesLabel.text = character.species
        statusLabel.text = character.status
        
        let url = URL(string: character.image)!
        
        let request = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.characterImageView.image = image
            }
        }
        
        request.resume()
    }
}
