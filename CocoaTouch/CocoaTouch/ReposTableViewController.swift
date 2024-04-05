//
//  ReposTableViewController.swift
//  CocoaTouch
//
//  Created by uunwon on 4/5/24.
//

import UIKit

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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Repos"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
