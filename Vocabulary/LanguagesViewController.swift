//
//  ViewController.swift
//  Vocabulary
//
//  Created by Alejandro Pallares on 20/08/22.
//

import UIKit

class LanguagesViewController: UITableViewController {
    
    var dataModel: DataModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    //MARK: Tableview data source
    
    @IBAction func AddLanguage(_ sender: Any) {
        
        let alert = UIAlertController(title: "Write a language", message: nil, preferredStyle: .alert)

        
        alert.addTextField { textField in
            
            textField.placeholder = "Language name"
            
            
        }
        let action = UIAlertAction(title: "Add", style: .default) { _ in
          
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            
            let language = Language()
            
            language.name = field.text!
            
            self.addLanguage(language: language)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(action)
        
        self.present(alert, animated: true)
    }
    
    //This function Creates a new language object and add into a table view
    func addLanguage(language: Language) {
        
        let newIndexRow = dataModel.list.count
        
        dataModel.list.append(language)
        
        let indexPath = IndexPath(row: newIndexRow, section: 0)
        
        let indexPaths = [indexPath]
        
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        tableView.reloadData()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LanguagesToWords" {
            let controller = segue.destination as! WordsViewController
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                
                controller.language = dataModel.list[indexPath.row]
            }
                
                
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
        
        
       let language = dataModel.list[indexPath.row]
        
        cell.textLabel!.text = language.name
        
        return cell
    }

    
    
    
    

}

