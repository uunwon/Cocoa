//
//  FormViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/23/24.
//

import UIKit

class FormViewController: UIViewController {
    let formOneLabel = UILabel()
    let formOneTextField = UITextField()
    let formTwoLabel = UILabel()
    let formTwoTextField = UITextField()
    let resultLabelOne = UILabel()
    let resultLabelTwo = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupFormOne()
        setupFormTwo()
        setupResults()
        
        // 텍스트 칠 때 반응에 대해 첫번째 방식
        formOneTextField.addAction(UIAction { [weak self] _ in
            self?.resultLabelOne.text = "Form #1 = \(self?.formOneTextField.text ?? "")"
        }, for: .editingChanged)
        
        formTwoTextField.addAction(UIAction { [weak self] _ in
            self?.resultLabelTwo.text = "Form #2 = \(self?.formTwoTextField.text ?? "")"
        }, for: .editingChanged)
        
        // 텍스트 칠 때 반응에 대해 두번째 방식
        formOneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        formTwoTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func setupFormOne() {
        formOneLabel.text = "This is First Form"
        formOneLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formOneLabel)
        
        formOneTextField.borderStyle = .roundedRect
        formOneTextField.placeholder = "Write here . ."
        formOneTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formOneTextField)
        
        NSLayoutConstraint.activate([
            formOneLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            formOneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            formOneTextField.topAnchor.constraint(equalTo: formOneLabel.bottomAnchor, constant: 10),
            formOneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formOneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupFormTwo() {
        formTwoLabel.text = "This is Second Form"
        formTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formTwoLabel)
        
        formTwoTextField.borderStyle = .roundedRect
        formTwoTextField.placeholder = "Write here something . ."
        formTwoTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formTwoTextField)
        
        NSLayoutConstraint.activate([
            formTwoLabel.topAnchor.constraint(equalTo: formOneTextField.bottomAnchor, constant: 20),
            formTwoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            formTwoTextField.topAnchor.constraint(equalTo: formTwoLabel.bottomAnchor, constant: 10),
            formTwoTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formTwoTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupResults() {
        resultLabelOne.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabelOne)
        
        resultLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabelTwo)
        
        NSLayoutConstraint.activate([
            resultLabelOne.topAnchor.constraint(equalTo: formTwoTextField.bottomAnchor, constant: 20),
            resultLabelOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabelTwo.topAnchor.constraint(equalTo: resultLabelOne.bottomAnchor, constant: 10),
            resultLabelTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == formOneTextField {
            resultLabelOne.text = "Form #1 = \(textField.text ?? "")"
        } else {
            resultLabelTwo.text = "Form #2 = \(textField.text ?? "")"
        }
    }
}
