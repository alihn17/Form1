//
//  MainTableViewController.swift
//  Form
//
//  Created by Ali on 7/26/18.
//  Copyright © 2018 Ali. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Declaring Properties
    var people = [Person]()
    var plist = Plist()
    var data: Person?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        for i in 0..<(plist.root as! [NSArray]).count{
            let p = Person()
            people += [p]
            people[i].setValue(arr: (plist.root as! [NSArray])[i])
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableCell")!
        cell.textLabel?.text = people[indexPath.row].getForTableCell()
        return cell
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "Edit") { (action, index) in
            print("edited")
            self.plist.deleteRow(at: indexPath.row)
            let passData = self.people[indexPath.row]
            self.performSegue(withIdentifier: "GoToFormView", sender: passData)
            
        }
        editAction.backgroundColor = UIColor.blue
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, index) in
            print("deleted")
            self.plist.deleteRow(at: indexPath.row)
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTableViewController") as? MainTableViewController
            {
                self.present(vc, animated: false, completion: nil)
            }
        }
        return [deleteAction,editAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if case segue.identifier = "GoToFormView"{
            if let destination = segue.destination as? FormViewController{
                destination.person = (sender as? Person)!
            }
        }
        
    }
    

}
