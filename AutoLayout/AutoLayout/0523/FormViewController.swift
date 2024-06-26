//
//  FormViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/23/24.
//

import UIKit

class FormViewController: UIViewController, UITableViewDataSource {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let formOneLabel = UILabel()
    let formOneTextField = UITextField()
    let formOneSwitch = UISwitch()
    let formTwoLabel = UILabel()
    let formTwoTextField = UITextField()
    let resultLabelOne = UILabel()
    let resultLabelTwo = UILabel()
    let resultButton = UIButton(type: .system)
    lazy var textFieldAction = UIAction(handler: textFieldDidChange)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
//        // 텍스트 칠 때 반응에 대해 첫번째 방식
//        formOneTextField.addAction(UIAction { [weak self] _ in
//            self?.resultLabelOne.text = "Form #1 = \(self?.formOneTextField.text ?? "")"
//        }, for: .editingChanged)
//        
//        formTwoTextField.addAction(UIAction { [weak self] _ in
//            self?.resultLabelTwo.text = "Form #2 = \(self?.formTwoTextField.text ?? "")"
//        }, for: .editingChanged)
//        
//        // 텍스트 칠 때 반응에 대해 두번째 방식
//        formOneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
//        formTwoTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        switch section {
        case 0:
            return 3
        case 1:
            return formOneSwitch.isOn ? 2 : 0
        case 2:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 2 {
            return "result"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Form #1"
        case 1:
            return formOneSwitch.isOn ? "Form #2" : nil
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.contentView.subviews.forEach({ view in view.removeFromSuperview() })
        
        switch indexPath.section {
        case 0:
            setupFormOne(view: cell.contentView, indexPath: indexPath)
        case 1:
            setupFormTwo(view: cell.contentView, indexPath: indexPath)
        case 2:
            setupResults(view: cell.contentView, indexPath: indexPath)
        default:
            break
        }
        return cell
    }
    
    // 액션 개체 생성 + 삭제 코드 추가
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        formOneTextField.addAction(textFieldAction, for: .editingChanged)
        formTwoTextField.addAction(textFieldAction, for: .editingChanged)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        formOneTextField.removeAction(textFieldAction, for: .editingChanged)
        formTwoTextField.removeAction(textFieldAction, for: .editingChanged)
    }
    
    func setupFormOne(view: UIView, indexPath: IndexPath) {
        if indexPath.section != 0 { return }
        
        switch indexPath.row {
        case 0:
            formOneLabel.text = "This is First Form"
            formOneLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(formOneLabel)
            NSLayoutConstraint.activate([
                formOneLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                formOneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            ])
        case 1:
            formOneTextField.borderStyle = .roundedRect
            formOneTextField.placeholder = "Write here . ."
            formOneTextField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(formOneTextField)
            
            NSLayoutConstraint.activate([
                formOneTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                formOneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                formOneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        case 2:
            formOneSwitch.translatesAutoresizingMaskIntoConstraints = false
           
            formOneSwitch.addAction(UIAction { [weak self] _ in self?.tableView.reloadData() }, for: .valueChanged)
                   
            view.addSubview(formOneSwitch)
            NSLayoutConstraint.activate([
                formOneSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                formOneSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
        default:
            break
        }
    }
    
    func setupFormTwo(view: UIView, indexPath: IndexPath) {
        if indexPath.section != 1 { return }
        
        switch indexPath.row {
        case 0:
            formTwoLabel.text = "This is Second Form"
            formTwoLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(formTwoLabel)
            NSLayoutConstraint.activate([
                formTwoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                formTwoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ])

        case 1:
            formTwoTextField.borderStyle = .roundedRect
            formTwoTextField.placeholder = "Write here . ."
            formTwoTextField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(formTwoTextField)
            NSLayoutConstraint.activate([
                formTwoTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                formTwoTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                formTwoTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        default:
            break
        }
    }
    
    func setupResults(view: UIView, indexPath: IndexPath) {
        if indexPath.section != 2 { return }
        
        switch indexPath.row {
        case 0:
            resultLabelOne.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(resultLabelOne)
            NSLayoutConstraint.activate([
                resultLabelOne.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                resultLabelOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            ])
            
        case 1:
            resultLabelTwo.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(resultLabelTwo)
            NSLayoutConstraint.activate([
                resultLabelTwo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                resultLabelTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            ])
            
        case 2:
            resultButton.translatesAutoresizingMaskIntoConstraints = false
            resultButton.setTitle("Click here", for: .normal)
            resultButton.isEnabled = formOneSwitch.isOn
            view.addSubview(resultButton)
            NSLayoutConstraint.activate([
                resultButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                resultButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            
        default:
            break
        }
    }
    
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        if textField == formOneTextField {
//            resultLabelOne.text = "Form #1 = \(textField.text ?? "")"
//        } else {
//            resultLabelTwo.text = "Form #2 = \(textField.text ?? "")"
//        }
//    }
    
    func textFieldDidChange(_ action: UIAction) {
        guard let textField = action.sender as? UITextField else { return }
        
        if textField == formOneTextField {
            resultLabelOne.text = "Form #1 = \(textField.text ?? "")"
        } else {
            resultLabelTwo.text = "Form #2 = \(textField.text ?? "")"
        }
    }
}
