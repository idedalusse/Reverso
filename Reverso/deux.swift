//************************************************************
//  ViewController.swift
//  Reverso
//  Created by BensNedalus on 13/11/2017.
//  Copyright © 2017 BensNedalus. All rights reserved.
//************************************************************
import UIKit
//********************
class deux: UIViewController {
    //********************
    @IBOutlet weak var en: UITextField!
    @IBOutlet weak var fr: UITextField!
    //********************
    var arrEnglish:[String]!
    var arrFrench:[String]!
    //********************
    override func viewDidLoad() {
        super.viewDidLoad()
       managerUser()
    }
    //********************
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // fonction pour alert pour savoir si le mot existe deja
    @IBAction func ShowAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Congratulations!", message: "successful registration", preferredStyle: .alert)
        self.present(alertController, animated: true, completion:nil)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            print("You've pressed OK button");
        }
        alertController.addAction(OKAction)
        en.text = ""
        fr.text = ""
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
}
 //********************





       

