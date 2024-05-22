//
//  TableViewController.swift
//  AutoLayout
//
//  Created by uunwon on 5/22/24.
//

import UIKit

/* 목록에 섹션 추가하기 */
struct Animal {
    let name: String
}

struct AnimalCategory {
    let category: String
    let animals: [Animal]
}

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let items = ["Cat", "Dog", "Bird", "Fish", "Dolphin"]
    let categories = [
        AnimalCategory(category: "포유류", animals: [Animal(name: "고양이"), Animal(name: "강아지")]),
        AnimalCategory(category: "파충류", animals: [Animal(name: "거북이"), Animal(name: "도마뱀")])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // 생성자 함수 내에서 테이블 스타일 변경 가능
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped) // 화면에 꽉 채우겠다 이거임
        tableView.dataSource = self // 애플 개발자들아 네가 만든 테이블 내가 완성할게 ~ 이런 의미
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // 재사용 가능한 셀을 등록함
        view.addSubview(tableView)
    }
    
    /* List with TableView
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
    } */
    
    /* TableView with section */
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].animals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].category
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        var config = cell.defaultContentConfiguration()
        config.text = categories[indexPath.section].animals[indexPath.row].name
        cell.contentConfiguration = config
        
        return cell
    }
}
