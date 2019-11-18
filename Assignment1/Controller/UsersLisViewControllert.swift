//
//  UsersList.swift
//  Assignment1
//
//  Created by Waqas on 11/15/19.
//  Copyright © 2019 Waqas. All rights reserved.
//

import Foundation
import UIKit

class UsersListViewController : UIViewController {
    
    
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
    }
    
    
    @objc func displaySortOptions() {
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let sortByName = UIAlertAction(title: "Sort By Name", style: .default) { (action) in
            self.sortByName()
        }
        
        let sortById = UIAlertAction(title: "Sort By Id", style: .default) { (action) in
            
             self.sortById()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        optionMenu.addAction(sortByName)
        optionMenu.addAction(sortById)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func sortByName(){
        usersList = usersList.sorted {
            $0.name < $1.name
        }
        tableView.reloadData()
    }
    
    func sortById(){
        usersList = usersList.sorted(by: { $0.id < $1.id })
         tableView.reloadData()
    }
    
}

//Mark: - UITableViewDataSource
extension UsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

//Mark: - UITableViewDelegate
extension UsersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < usersList.count){
            
        }
        
    }
}




