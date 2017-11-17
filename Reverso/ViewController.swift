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
    //*******************
    @IBOutlet weak var result: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return arrFrench.count
    }
    //*******************
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        let sortedDict = dict.sorted(by: {$0.key < $1.key})
        cell.textLabel?.text = sortedDict[indexPath.row].key
        return cell
    }
    //*******************
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        result.text = [String](dict.values)[indexPath.row]
    }
    //*******************
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            arrFrench.remove(at: indexPath.row)
            arrEnglish.remove(at: indexPath.row)
            
            UserDefaults.standard.set(arrFrench as AnyObject, forKey: "french")
            UserDefaults.standard.set(arrEnglish as AnyObject, forKey: "english")
            
            if français.alpha == 1.0 {
                dict = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
            } else {
                dict = Dictionary(uniqueKeysWithValues: zip(arrEnglish, arrFrench))
            }
            
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managerUser()
        dict = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
        buttons = [français, anglais]
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
        tabview.reloadData()
    }
    //*******************
 func displayAnglaisOrFrançais(anglaisOrFrançais: String) {
        if anglaisOrFrançais == "Français" {
            dict = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
        } else {
            dict = Dictionary(uniqueKeysWithValues: zip(arrEnglish, arrFrench))
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
