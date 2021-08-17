import UIKit

final class CharactersView: UIView {
    
    // MARK: - UI Components
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(CharacterCell.self, forCellReuseIdentifier: "characterCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    // MARK: - Initialization
    
    init(dataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        tableView.dataSource = dataSource
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("This view should only be used programatically")
    }
    
    // MARK: - View lifecycle
    
    private func setupTableView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    // MARK: - Internal API
    
    func updateCharacters() {
        tableView.reloadData()
    }
}

final class CharacterCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup subviews
    
    private func setupNameLabel() {
        nameLabel.layout(on: contentView) {[
            $0.topAnchor.constraint(equalTo: contentView.topAnchor),
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            $0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ]}
    }
    
    // MARK: - Public API
    
    func configure(using character: Character) {
        nameLabel.text = character.name
    }
}

extension UIView {
    func layout(on view: UIView, using constraints: (UIView) -> [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        NSLayoutConstraint.activate(constraints(self))
    }
}
