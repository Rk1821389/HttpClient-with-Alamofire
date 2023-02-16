//
//  ViewController.swift
//  Sample HttpClient
//
//  Created by Manoj kumar on 16/02/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var entries: [Entries] = [Entries]()
    
    let httpClient = HttpClient.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        httpClient.get(url: "https://api.publicapis.org/entries", completion: { [weak self] (result: Result<Model, Error>) in
            switch result {
            case .success(let data):
                if let entries = data.entries {
                    self?.entries = entries
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    self?.present(alertController, animated: true, completion: nil)
                }
            }
        })
        
    }
    
    
}


//MARK: - TableViewDatasource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = entries[indexPath.row].API
        return cell
    }
}
