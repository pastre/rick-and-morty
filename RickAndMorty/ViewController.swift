//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Bruno Pastre on 16/08/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var charactersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

final class XGoHorseCharacterCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
}
