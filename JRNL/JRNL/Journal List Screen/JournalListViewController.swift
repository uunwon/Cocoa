//
//  ViewController.swift
//  JRNL
//
//  Created by uunwon on 5/7/24.
//

import UIKit

class JournalListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    var sampleJournalEntryData = SampleJournalEntryData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sampleJournalEntryData.createSampleJournalEntryData()
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sampleJournalEntryData.journalEntries.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let journalCell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath) as! JournalListTableViewCell
        let journalEntry = sampleJournalEntryData.journalEntries[indexPath.row]
        journalCell.photoImageView.image = journalEntry.photo
        journalCell.dateLabel.text = journalEntry.date.formatted(.dateTime.year().month().day())
        journalCell.titleLabel.text = journalEntry.entryTitle
        return journalCell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { // 탭 하나 밀면 삭제된다 🍎
            sampleJournalEntryData.journalEntries.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    // MARK: - Methods
    @IBAction func unwindNewEntryCancel(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindNewEntrySave(segue: UIStoryboardSegue) {
        if let sourceViewController = segue.source as?
            AddJournalEntryViewController, let newJournalEntry = sourceViewController.newJournalEntry {
            sampleJournalEntryData.journalEntries.append(newJournalEntry)
            tableView.reloadData()
        } else {
            print("No Entry or Controller")
        }
    }
    
    // MARK: - Navigation

    // 내가 entryDetail 라고 이름을 부여한 segue 가 호출될 때 나오는 함수인거야 🍏
    // 만약 세번째 줄을 눌렀다면 세번째 줄에 있는 디테일 뷰로 ✨ "데이터를 이관시켜서 보여준다" ✨
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "entryDetail" else {
            return // 다른 세그웨이 호출된 거면 난 몰라
        }
        guard let journalEntryDetailViewController = segue.destination as? JournalEntryDetailViewController,
              let selectedJournalEntryCell = sender as? JournalListTableViewCell,
              let indexPath = tableView.indexPath(for: selectedJournalEntryCell) else {
            fatalError("Could not get indexPath")
        }
        let selectedJournalEntry = sampleJournalEntryData.journalEntries[indexPath.row]
        journalEntryDetailViewController.selectedJournalEntry = selectedJournalEntry
    }
}

