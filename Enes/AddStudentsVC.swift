//
//  AddStudentsVC.swift
//  Enes
//
//  Created by ihlas on 21.01.2022.
//

import UIKit

class AddStudentsVC: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var textStd: UITextField!
    @IBOutlet var txtSchool: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onClicked(_ sender: Any) {
        
        if let name = txtName.text, let std = textStd.text, let school = txtSchool.text{
            
            let newStudent = Students(context: DBManager.share.context)
            
            newStudent.name = name
            newStudent.school = school
            newStudent.std = std
            //DBManager.share.saveContext
          
        }
            
    }
    
}
