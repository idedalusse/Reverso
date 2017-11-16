//*******************************************************
//  ViewController.swift
//  Reverso
//  Created by BensNedalus on 13/11/2017.
//  Copyright © 2017 BensNedalus. All rights reserved.
//
//*******************************************************
import UIKit
//*******************
 class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var arrFrench:[String]!
    var arrEnglish:[String]!
    var dict : [String: String]!
    var keys : [String]!
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
        // Do any additional setup after loading the view, typically from a nib.
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
