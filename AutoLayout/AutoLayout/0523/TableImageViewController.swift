//
//  TableImageViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/23/24.
//

import UIKit

class CustomCell: UITableViewCell {
    let animalImageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        // 안에 들어가는 이미지
        animalImageView.contentMode = .scaleAspectFit
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(animalImageView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            animalImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            animalImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            animalImageView.widthAnchor.constraint(equalToConstant: 50),
            animalImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(item: Animals) {
        animalImageView.image = item.image
        nameLabel.text = item.name
    }
}

struct Animals {
    let name: String
    let image: UIImage
}

class TableImageViewController: UIViewController, UITableViewDataSource {
    
    
    let animals = [
        Animals(name: "Cat", image: UIImage(systemName: "cat")!),
        Animals(name: "Dog", image: UIImage(systemName: "dog")!),
        Animals(name: "Rabbit", image: UIImage(systemName: "hare")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }
    
    // "SOLID 원칙"에 따라 단일 책임으로 이렇게 데이터 뿌리는 걸 따로 만든거임
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
//        var config = cell.defaultContentConfiguration()
//        config.text = animals[indexPath.row].name
//        config.secondaryText = "Description about \(animals[indexPath.row].name)"
//        config.image = animals[indexPath.row].image
//        cell.contentConfiguration = config
        
        // TableView CustomCell 만들기
//        cell.animalImageView.image = animals[indexPath.row].image
//        cell.nameLabel.text = animals[indexPath.row].name
        
        // 바로 위 코드 리팩토링 해주기
        let animal: Animals = animals[indexPath.row]
        cell.configure(item: animal)
        
        return cell
    }
}
