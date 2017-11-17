//*******************************************************
//  ViewController.swift
//  Reverso
//  Created by BensNedalus on 13/11/2017.
//  Copyright © 2017 BensNedalus. All rights reserved.
//*******************************************************
import UIKit
//*******************
 class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    //*******************
    @IBOutlet weak var français: UIButton!
    @IBOutlet weak var anglais: UIButton!
    @IBOutlet weak var tabview: UITableView!
    //*******************
    var buttons:[UIButton]!
    var arrFrench:[String]!
    var arrEnglish:[String]!
    var dict : [String: String]!
    var keys : [String]!
    var dictOfAnglais:[String: String]!
    //*******************
    @IBOutlet weak var result: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFrench.count
    }
    //*******************
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = [String](dict.keys)[indexPath.row]
        return cell
    }
    //*******************
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        result.text = [String](dict.values)[indexPath.row]
    }
    //*******************
    override func viewDidLoad() {
        super.viewDidLoad()
        managerUser()
        dict = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
        buttons = [français, anglais]
        // pour vider la memoire
       // UserDefaults.standard.removeObject(forKey: "french")
      //  UserDefaults.standard.removeObject(forKey: "english")
    // dict = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
// Do any additional setup after loading the view, typically from a nib.
    }
//*******************
    @IBAction func actionForButtons(_ sender: UIButton) {
        if sender.alpha == 1.0 {
            return
        }
        for button in buttons {
            if button.alpha == 1.0 {
                button.alpha = 0.5
            } else {
                button.alpha = 1.0
                displayAnglaisOrFrançais(anglaisOrFrançais: sender.currentTitle!)
            }
        }
    }
    //*******************
 func displayAnglaisOrFrançais(anglaisOrFrançais: String) {
        if anglaisOrFrançais == "NOMS" {
            dictOfAnglais = Dictionary(uniqueKeysWithValues: zip(arrEnglish, arrFrench))
        } else {
            dictOfAnglais = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
        }
        tabview.reloadData()
    }
    //*******************
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//*******************
    func managerUser() {
        if UserDefaults.standard.object(forKey: "french") != nil {
            arrFrench = UserDefaults.standard.object(forKey: "french") as! [String]
            arrEnglish = UserDefaults.standard.object(forKey: "english") as! [String]
        } else {
            arrFrench = [String] ()
            arrEnglish = [String] ()
        }
    }
}
//********************************************************
