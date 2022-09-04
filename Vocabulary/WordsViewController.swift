//
//  WordsViewController.swift
//  Vocabulary
//
//  Created by Alejandro Pallares on 27/08/22.
//

import UIKit

class WordsViewController: UITableViewController, AddWordViewControllerDelegate{
    
    
    func addWordViewControllerDidCancel(_ controller: AddWordViewController) {
        <#code#>
    }
    
    func addWordViewController(_ controller: AddWordViewController, didFinishAdding word: Word) {
        <#code#>
    }
    
    func addWordViewController(_ controller: AddWordViewController, didFinishEditing word: Word) {
        <#code#>
    }
    
    
    
    var language: Language?
    
    var dataModel = DataModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let language = language {
            title = language.name
        }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        
        return language?.words.count ?? 0
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
