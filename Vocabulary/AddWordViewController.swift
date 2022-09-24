//
//  AddWordViewController.swift
//  Vocabulary
//
//  Created by Alejandro Pallares on 27/08/22.
//

import UIKit


protocol AddWordViewControllerDelegate: AnyObject {
    
    func addWordViewControllerDidCancel(_ controller: AddWordViewController)
    
    func addWordViewController(_ controller: AddWordViewController, didFinishAdding word: Word)
    
    func addWordViewController(_ controller: AddWordViewController, didFinishEditing word: Word)
}


class AddWordViewController: UITableViewController {
    
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var meaningTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if wordToEdit != nil {
            title = "Edit:\(wordToEdit!.name)"
            
            wordTextField.text = wordToEdit!.name
            meaningTextField.text = wordToEdit!.meaning
        }
        
    }
    
    weak var delagate: AddWordViewControllerDelegate?

    var wordToEdit: Word?
    
    
    @IBAction func cancelButton() {
        delagate?.addWordViewControllerDidCancel(self)
    }
    
    
    @IBAction func done() {
        print("pressed the done button")
        
        if let wordToEdit = wordToEdit {
            wordTextField.text = wordToEdit.name
            meaningTextField.text = wordToEdit.meaning
            
            delagate?.addWordViewController(self, didFinishEditing: wordToEdit)
        } else {
            let word = Word()
            
            word.name = wordTextField.text!
            word.meaning = meaningTextField.text!
            
            delagate?.addWordViewController(self, didFinishAdding: word)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


}
