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
    
    var arrFrench:[String]!
    var arrEnglish:[String]!
    //********************
    override func viewDidLoad() {
        super.viewDidLoad()
       managerUser()
    }
    //********************
    @IBAction func ADD(_ sender: UIButton) {
        arrFrench.append(fr.text!)
        arrEnglish.append(en.text!)
        UserDefaults.standard.set(arrFrench, forKey: "french")
        UserDefaults.standard.set(arrEnglish, forKey: "english")
    }
    //********************
    func managerUser() {
        if UserDefaults.standard.object(forKey: "french") != nil {
            arrFrench = UserDefaults.standard.object(forKey: "French") as! [String]
            arrEnglish = UserDefaults.standard.object(forKey: "English") as! [String]
        } else {
            arrFrench = [String] ()
            arrEnglish = [String] ()
        }
    }
}
