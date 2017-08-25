//
//  ViewController.swift
//  Flashcards
//
//  Created by Sarah Dervartanian on 8/24/17.
//  Copyright © 2017 Sarah Dervartanian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answerPickerView: UIPickerView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        answerPickerView.dataSource = self;
        answerPickerView.delegate = self;
        
        setupCard()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupCard(){
        questionTextView.text = CardCollection.instance.currentCard.question
        
        questionLabel.text = "Question \(CardCollection.instance.currentIndex + 1)/\(CardCollection.instance.cards.count)"
        
    }

    // Pickerview Data Source
    // returns the number of 'columns' to display.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CardCollection.instance.currentCard.options.count
    }
    
    // Pickerview delegates
    // returns text of option at a given row.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CardCollection.instance.currentCard.options[row];
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
        var alert: UIAlertController
        
        if CardCollection.instance.checkAnswer(answerPickerView.selectedRow(inComponent: 0)){
            
            alert = UIAlertController(title: "Correct", message: "You are correct!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Yay!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            alert = UIAlertController(title: "Wrong", message: "You are wrong!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Boo!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
}

