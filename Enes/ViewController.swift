//
//  ViewController.swift
//  Enes
//
//  Created by ihlas on 21.01.2022.
//

import UIKit


class ViewController: UIViewController {
    var students = [Students]()
    @IBOutlet var studentTableView: UITableView!
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        students = DBManager.share.fetchStudent()
        studentTableView.reloadData()
     }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let aStudents = students[indexPath.row]
        cell.textLabel?.text = aStudents.name
        cell.detailTextLabel?.text  = aStudents.school
        return cell
    
}
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let context = DBManager.share.saveContext
            do{
                try DBManager.share.context.delete(students[indexPath.row])
                DBManager.share.saveContext()
                students.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }catch{
                print("delete error")
            }
        }
    }
}
