//
//  ViewController.swift
//  Identify The Flag
//
//  Created by Sruthi Guvvala on 1/31/16.
//  Copyright © 2016 Sruthi Guvvala Alisha Hegde. All rights reserved.
//
import GameplayKit
import UIKit
import Foundation
public var correctCountry : String!
class ViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate{
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Picker1: UIPickerView!
    @IBOutlet weak var Text1: UITextField!
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    var myViewDelegate : MyViewDelegate?
        private var str : String?
        
        func reloadData() {
            if myViewDelegate != nil {
                str = myViewDelegate!.viewString()
            }
            self.setNeedsDisplay()
        }
    override func viewDidLoad() {
        
        Text1.delegate = self ;
        super.viewDidLoad()
        
        countries += ["Brazil" , "India" , "China" , "USA", "Argentina" , "Germany" , "Canada" , "Uganda" , "Russia" , "Zimbabwe"]
        self.Picker1.delegate = self;
        Image1.layer.borderWidth = 1
        self.Text1.text = self.Text1.text
        Text1.becomeFirstResponder()
        askQuestions()
        print(correctCountry)
        //refreshUI()
        //var typedAnswer = userAnswer((self.Text1.text)!)
        // Do any additional setup after loading the view, typically from a nib.
       view .setNeedsDisplay()
    }
    
    func textFieldDidBeginEditing(Text1 : UITextField) {
        print("TextField did begin editing method called")
        Text1.becomeFirstResponder()
    }
    func textFieldDidEndEditing(Text1: UITextField) {
        print("TextField did end editing method called")
    }
    func textFieldShouldBeginEditing(Text1: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }
    func textFieldShouldClear(Text1: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(Text1: UITextField) -> Bool {
        print("TextField should end editing method called")
        
      checkAnswer((self.Text1.text)!)
        return true;
    }
    func textField(Text1: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }
    func textFieldShouldReturn(Text1: UITextField) -> Bool {
        print("TextField should return method called")
        Text1.resignFirstResponder();
        return true;
    }
    
     func checkAnswer(Answer : String)
     {
        var score = 0
        print(Answer)
        print(correctCountry)
        if(Answer.compare(correctCountry) == NSComparisonResult.OrderedSame){
            Text1.text = "Correct Answer"
            ++score
          //  textFieldShouldClear(<#T##Text1: UITextField##UITextField#>)
            askQuestions()
            //print("Correct Answer")
        }
        else{
            Text1.text = "Wrong Answer"
            --score
            askQuestions()
        //print("Wrong Answer")
        }
       // refreshUI()
       /* var title : String
        let ac = UIAlertController(title: title, message: "Your Score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestions))
        presentViewController(ac, animated: true, completion: nil)
       */
    
    }
    
    func numOfCompInPickerView(pickerView : UIPickerView!)->Int
    {
        return 1
    }
    
    func pickerView(pickerView : UIPickerView!, numberOfRowsInComponent component : Int )-> Int
    {
        return countries.count
    }

    func pickerView(pickerView : UIPickerView , titleForRow row : Int, forComponent component  : Int) -> String?
    {
        if(countries)
        {
        return countries[row]
        }
    }
    
    func pickerView(pickerView : UIPickerView,didSelectRow row : Int  , inComponent component : Int)
    {
    Text1.text = countries[row]
        pickerView.reloadAllComponents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func askQuestions() {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        Image1.image = UIImage(named: countries[1])
        correctCountry = countries[1]
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(1)
        //title = countries[correctAnswer].uppercaseString
        //print(self.Text1.text)

    }
}

