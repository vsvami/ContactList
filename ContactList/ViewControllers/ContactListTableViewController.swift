//
//  ContactListTableViewController.swift
//  ContactList
//
//  Created by Vladimir Dmitriev on 28.02.24.
//

import UIKit

final class ContactListTableViewController: UITableViewController {

    let persons = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailsVC = segue.destination as? PersonDetailsViewController
        detailsVC?.person = persons[indexPath.row]
    }
}

//MARK: - UITableViewDataSource
extension ContactListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = persons[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        
        cell.contentConfiguration = content
        return cell
    }
}
