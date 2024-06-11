//
//  ViewController.swift
//  TODO
//
//  Created by uunwon on 5/24/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    
    let tableView = UITableView()
    var itemArray: [Any] = []
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        if let items = defaults.array(forKey: "TodoList") {
            itemArray = items
        }
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(navigationBar)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            navigationBar.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let navItem = UINavigationItem(title: "TODO")
        let addButton = UIBarButtonItem(title: "Add", image: UIImage(systemName: "plus"), target: self, action: #selector(addTodoItem))
        
        navItem.rightBarButtonItem = addButton
        navigationBar.setItems([navItem], animated: true)
    }

    @objc func addTodoItem(_ sender: UIButton) {
        print("Click Add Button")
        var myTextField = UITextField()
        let alert = UIAlertController(title: "Today Something new -", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            self.itemArray.append(false, myTextField.text)
            self.defaults.set(self.itemArray, forKey: "TodoList")
            self.tableView.reloadData()
        }
        
        alert.addTextField() { (alertTextField) in
            myTextField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("UserDefaults 안 개체 수: \(defaults.accessibilityElementCount())")
        return defaults.accessibilityElementCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = itemArray[indexPath].description.codingKey
        return cell
    }

}

