//
//  FormViewController.swift
//  Form
//
//  Created by Ali on 7/25/18.
//  Copyright © 2018 Ali. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Declaring Properties
    var person = Person()
    var plist = Plist()
    var gender = "Male"
    var lastChild = "1"
    var tall = "1.7"
    
    
    // MARK: Declaring UIObjects
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var familyTextField: UITextField!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    @IBOutlet weak var lastChildSwitchControl: UISwitch!
    @IBOutlet weak var tallSlider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var cancleButton: UIButton!
    
    @IBAction func genderChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            // Male
            gender = "Male"
        }else{
            // Female
            gender = "Female"
        }
    }
    @IBAction func switchChanged(_ sender: UISwitch) {
        if sender.isOn{
            lastChild = "0"
        }else{
            lastChild = "1"
        }
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        let currentValue = sender.value
        tall = String(currentValue)
        sliderLabel.text = tall
    }
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        
        if let name = nameTextField.text, name != "",let family = familyTextField.text, family != ""{
            let dataTOStore = [name, family,gender,lastChild,tall]
            plist.addToRoot(arr: dataTOStore)
        }
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTableViewController") as? MainTableViewController
        {
            present(vc, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.delegate = self
        self.familyTextField.delegate = self
        
        // Do any additional setup after loading the view.
        if person.name != ""{
            nameTextField.text = person.name
            familyTextField.text = person.family
            if person.gender == false{
                // Male
                genderSegmentControl.selectedSegmentIndex = 0
                gender = "Male"
            }else{
                // Female
                genderSegmentControl.selectedSegmentIndex = 1
                gender = "Female"
            }
            if person.lastChild{
                lastChildSwitchControl.isOn = true
                lastChild = "0"
            }else{
                lastChildSwitchControl.isOn = false
                lastChild = "1"
            }
            tallSlider.value = person.tall
            sliderLabel.text = String(person.tall)
            tall = String(person.tall)
            
            cancleButton.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
