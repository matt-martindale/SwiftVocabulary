//
//  WordsTableViewController.swift
//  SwiftVocabulary
//
//  Created by Matthew Martindale on 1/28/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {
    
    var vocabWords: [VocabularyWord] = [
        VocabularyWord(word: "Variable", definition: "In computer programming, a variable or scalar is a storage address (identified by a memory address) paired with an associated symbolic name, which contains some known or unknown quantity of information referred to as a value."),
        VocabularyWord(word: "Constant", definition: "A constant is a value that cannot be altered by the program during normal execution, i.e., the value is constant."),
        VocabularyWord(word: "Function", definition: "A named section of a program that performs a specific task. In this sense, a function is a type of procedure or routine.")
    ]
    
//        let alertController: UIAlertController = UIAlertController(title: "Add word", message: nil, preferredStyle: UIAlertController.Style.alert)
    
    
    //create alertController to display alert and text input fields
    @IBAction func button(_ sender: UIButton) {
        //create alert controller
        let alertController = UIAlertController(title: "Add word", message: nil, preferredStyle: .alert)
        //create text field to add word
        alertController.addTextField { (addWordTextField) in
            addWordTextField.placeholder = "Add word"
            addWordTextField.keyboardType = .URL
        }
        //create text field to add definition
        alertController.addTextField { (addDefinitionTextField) in
            addDefinitionTextField.placeholder = "Add definition"
            addDefinitionTextField.keyboardType = .URL
        }
        
        //add text into vocabwords array
        let saveAction = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            
            //check to make sure text fields aren't empty
            guard let word = alertController.textFields![0].text,
                let definition = alertController.textFields![1].text,
                !word.isEmpty,
                !definition.isEmpty else { return }
            
            //create new instance of VocabularyWord struct and pass in new text fields
            let vocabWord = VocabularyWord(word: word, definition: definition)
            self.vocabWords.append(vocabWord)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //present alert
        [saveAction, cancelAction].forEach { alertController.addAction($0) }
        
        present(alertController, animated: true)
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocabWords.count
    }

    
    //IndexPath(0, 0)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)

        let word = vocabWords[indexPath.row]
        cell.textLabel?.text = word.word

        return cell
    }
 

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDefinitionSegue" {
            if let definitionDetailVC = segue.destination as? DefinitionViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let word = vocabWords[indexPath.row]
                definitionDetailVC.word = word
            }
        }
    }
 

}
