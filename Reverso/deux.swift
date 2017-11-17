//************************************************************
//  ViewController.swift
//  Reverso
//  Created by BensNedalus on 13/11/2017.
//  Copyright © 2017 BensNedalus. All rights reserved.
//************************************************************
import UIKit
//********************
class deux: UIViewController {
    
    @IBOutlet weak var en: UITextField!
    @IBOutlet weak var fr: UITextField!
    
    var arrEnglish:[String]!
    var arrFrench:[String]!
    var showAlertButtonTapped = UIAlertController(title:"coucou",message:"coucou",preferredStyle:UIAlertControllerStyle.alert)
    //********************
    override func viewDidLoad() {
        super.viewDidLoad()
       managerUser()
        showAlertButtonTapped = UIAlertController(title:"coucou",message:"coucou",preferredStyle:UIAlertControllerStyle.alert)
    }
    //********************
    @IBAction func ADD(_ sender: UIButton) {
       
        arrEnglish.append(en.text!)
        arrFrench.append(fr.text!)
        UserDefaults.standard.set(arrEnglish, forKey: "english")
        UserDefaults.standard.set(arrFrench, forKey: "french")
    }
    //********************
    func managerUser() {
        if UserDefaults.standard.object(forKey: "french") != nil {
            arrEnglish = UserDefaults.standard.object(forKey: "english") as! [String]
            arrFrench = UserDefaults.standard.object(forKey: "french") as! [String]
        } else {
            arrEnglish = [String] ()
            arrFrench = [String] ()
        }
    }
    //********************
    
    @IBAction func buttonClick(_ sender: UIButton) {
        
        showAlertButtonTapped = UIAlertController(title: "Success!", message:
            "Words have been saved", preferredStyle: UIAlertControllerStyle.alert)
        showAlertButtonTapped.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        self.present(showAlertButtonTapped, animated: true, completion: nil)
    }

}






       

