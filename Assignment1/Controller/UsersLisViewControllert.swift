//
//  UsersList.swift
//  Assignment1
//
//  Created by Waqas on 11/15/19.
//  Copyright © 2019 Waqas. All rights reserved.
//

import Foundation
import UIKit

class UsersListViewController : UIViewController, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var usersList: [UserInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        self.title = "Users List"
        
        let sort = UIBarButtonItem(title: "Sort Type", style: .plain, target: self, action: #selector(displaySortOptions))
        
        navigationItem.rightBarButtonItems = [sort]
        
        // Get hard coded users list 
        usersList = MockedData.getMockedUsersList()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
    }
    
    
    @objc func displaySortOptions() {
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let sortByName = UIAlertAction(title: "Sort By Name", style: .default) { (action) in
            self.sortList(type: SortTypes.sortByName)
        }
        
        let sortById = UIAlertAction(title: "Sort By Id", style: .default) { (action) in
            self.sortList(type: SortTypes.sortById)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        optionMenu.addAction(sortByName)
        optionMenu.addAction(sortById)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func sortList(type: SortTypes){
        switch type {
        case SortTypes.sortById:
            usersList = usersList.sorted(by: { $0.id < $1.id })
            tableView.reloadData()
            
        case SortTypes.sortByName:
            usersList = usersList.sorted {
                $0.name < $1.name
            }
            tableView.reloadData()
        }
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersList.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let id = usersList[indexPath.row].id
        let txtID = "ID:  \(id)"
        var name = usersList[indexPath.row].name
        name = "Name: " + name
        cell.lblID.text = txtID
        cell.lblName.text = name
        cell.selectionStyle = .none
        
        return cell
    }
}



