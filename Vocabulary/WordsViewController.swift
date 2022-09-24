//
//  WordsViewController.swift
//  Vocabulary
//
//  Created by Alejandro Pallares on 27/08/22.
//

import UIKit

class WordsViewController: UITableViewController, AddWordViewControllerDelegate {
    
        func addWordViewControllerDidCancel(_ controller: AddWordViewController) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
    func addWordViewController(_ controller: AddWordViewController, didFinishAdding word: Word) {
        let newRowIndex = language.words.count
        
        language.words.append(word)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        
        let indexPaths = [indexPath]
        
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
    
    func addWordViewController(_ controller: AddWordViewController, didFinishEditing word: Word) {
        
        if let index = language.words.firstIndex(of: word) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                
                cell.textLabel!.text = word.name
                
            }
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    var language: Language!
    
    var dataModel = DataModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let language = language {
            title = language.name
        }
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWord" {
            let destination = segue.destination as! AddWordViewController
            destination.delagate = self
        } else if segue.identifier == "EditWord" {
            let destination = segue.destination as! AddWordViewController
            destination.delagate = self
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                destination.wordToEdit = language.words[indexPath.row]
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return language.words.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        language.words.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        
        let word = language.words[indexPath.row]
        
        cell.textLabel?.text = word.name
        
        return cell
    }

}
