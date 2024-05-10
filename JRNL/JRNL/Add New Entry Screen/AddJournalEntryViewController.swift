//
//  AddJournalEntryViewController.swift
//  JRNL
//
//  Created by uunwon on 5/10/24.
//

import UIKit

class AddJournalEntryViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var bodyTextView: UITextView!
    @IBOutlet var photoImageView: UIImageView!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    var newJournalEntry: JournalEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self // 이벤트 핸들링을 위해 작성 1
        bodyTextView.delegate = self // 이벤트 핸들링을 위해 작성 2
        updateSaveButtonState()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let title = titleTextField.text ?? ""
        let body = bodyTextView.text ?? ""
        let photo = photoImageView.image
        let rating = 3
        newJournalEntry = JournalEntry(rating: rating, title: title,
                                       body: body, photo: photo)
    }

    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // 키보드를 내려주는 함수
        return true // -> return 누르면 키보드 내려감 !! 🍎
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 🍎 Enter 치고 입력 종료할 때 실행되는 함수
        updateSaveButtonState()
    }
    
    // MARK: - UITextViewDelegate
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        // print("text: \(range.description) \(text)") // 어떤 값이 들어오는지
        if(text == "\n")  { // 엔터 입력시
            textView.resignFirstResponder()
        }
        return true // 여기는 바디 영역 엔터 치면 키보드 내려가게 🍎
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        updateSaveButtonState()
    }
    
    // MARK: - Methods
    private func updateSaveButtonState() {
        let textFieldText = titleTextField.text ?? ""
        let textViewText = bodyTextView.text ?? ""
        saveButton.isEnabled = !textFieldText.isEmpty && !textViewText.isEmpty
    }
}
