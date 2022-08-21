//
//  ViewController.swift
//  Vocabulary
//
//  Created by Alejandro Pallares on 20/08/22.
//

import UIKit

class LanguagesViewController: UITableViewController {

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
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(action)
        
        self.present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
        
        cell.textLabel?.text = "Hola mundo"
        
        return cell
    }


}

