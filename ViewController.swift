//
//  ViewController.swift
//  AdoptingTDD
//
//  Created by VenD-Omeir on 12/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var service: UserViewModelProtocol?
    
    var itemViewModels = [UserViewModel]()
    
    fileprivate func setupTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
        setupTableViewDelegates()
        service?.loadUsers(completion: { (itemViewModels) in
            self.itemViewModels = itemViewModels
            self.tableView.reloadData()
        })
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") else { return UITableViewCell() }
        let item = itemViewModels[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemViewModels[indexPath.row]
        item.select()
    }
    
}
