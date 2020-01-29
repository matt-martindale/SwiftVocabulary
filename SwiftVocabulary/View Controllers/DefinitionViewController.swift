//
//  DefinitionViewController.swift
//  SwiftVocabulary
//
//  Created by Matthew Martindale on 1/28/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

    var wordTitle: VocabularyWord?
    
    override func viewDidLoad() {
        super.viewDidLoad()

            updateTitle()
        
    }
    
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var definitionTextView: UITextView!
    
    func updateTitle() {
        if let unwrappedWordTitle = wordTitle {
            definitionLabel.text = unwrappedWordTitle.word
            definitionTextView.text = unwrappedWordTitle.definition
    }
 
    }
}
