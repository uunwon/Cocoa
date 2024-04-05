//
//  ReposTableViewController.swift
//  CocoaTouch
//
//  Created by uunwon on 4/5/24.
//

import UIKit
import SafariServices

struct Repo: Codable {
    let name: String?
    let url: URL?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "html_url"
    }
}

enum FetchReposResult {
    case success([Repo])
    case failure(Error)
}

enum ResponseError: Error {
    case requestUnsuccessful
    case unexpectedResponseStructure
}

class ReposTableViewController: UITableViewController {
    
    internal var session = URLSession.shared // 공유할 수 있는 세션을 만듦
    internal var repos = [Repo]() // 레포지터리 구조체 배열을 저장하는
    
    @discardableResult // URLSessionDataTask 이 옵셔널한테 .. 그래서 넣음
    internal func fetchRepos(forUsername username: String,
                             completionHandler: @escaping (FetchReposResult) -> Void) -> URLSessionDataTask? {
        
                let urlString = "https://api.github.com/users/\(username)/repos"
                guard let url = URL(string: urlString) else {
                        return nil
                }
                
                var request = URLRequest(url: url)
                request.setValue("application/vnd.github.v3+json",
                  forHTTPHeaderField: "Accept")
                let task = session.dataTask(with: request) { (data,
                  response, error) in
                    
                    // First unwrap the optional data
                    guard let data = data else {
                        completionHandler(.failure(ResponseError.requestUnsuccessful))
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let responseObject = try decoder.decode([Repo].self, from: data)
                        
                        completionHandler(.success(responseObject))
                    } catch {
                        completionHandler(.failure(error))
                    }
                }
                task.resume()

                return task
    }

    // 화면이 만들어진 다음에 불리는 함수 ✨
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Repos"
        
        // let repo1 = Repo(name: "Test Repo 1", url: URL(string: "https://example.com/repo1")) // 더미 (가짜) 데이터
        // repos.append(contentsOf: [repo1, repo2]) // 뒤에 오는 배열을 repos 에 순차적으로 저장함
        
        fetchRepos(forUsername: "APP-iOS5th") { [weak self] result in // 따옴표로 넣은 하드코딩한거임
            switch result {
            case .success(let repos):
                self?.repos = repos
            case .failure(let error):
                self?.repos = []
                print("There was an error: \(error)")
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repos.count
    }

    
    // tableView 가 Reuseable 한 걸 만들어내는 거야 완전한 성능 개선 ✨
    // indexPath 가 몇층인지 | 건물은 그대로, 인테리어만 바뀌는 거라고 생각혀
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath)

        let repo = repos[indexPath.row] // 몇층인지, 우리 2개 넣었지
        cell.textLabel?.text = repo.name

        return cell
    }
    
    // 사용자가 특정 row 를 선택하면 호출되는 함수 ✨
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repo = repos[indexPath.row] // 몇번째 row 에 있는 애인지 가져와
        guard let repoURL = repo.url else { return } // URL 는 경우 여기서 종료
        
        let webViewController = SFSafariViewController(url: repoURL)
        show(webViewController, sender: nil)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
