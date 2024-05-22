//
//  TableViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/22/24.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let items = ["Cat", "Dog", "Bird", "Fish", "Dolphin"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: view.bounds) // 화면에 꽉 채우겠다 이거임
        tableView.dataSource = self // 애플 개발자들아 네가 만든 테이블 내가 완성할게 ~ 이런 의미
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // 재사용 가능한 셀을 등록함
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // TableView 의 데이터를 뿌려주는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        var config = cell.defaultContentConfiguration() // 내용물 채우는 부분을 의존성 분리한거야
        config.text = items[indexPath.row]
        cell.contentConfiguration = config
        
        return cell
    }
    
    // TableView 각 셀 클릭 이벤트 처리 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Click number \(indexPath.row)")
    }
}
