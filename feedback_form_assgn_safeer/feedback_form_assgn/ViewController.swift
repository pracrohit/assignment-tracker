//
//  ViewController.swift
//  feedback_form_assgn
//
//  Created by Safeer Ahmed on 26/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var txtname: UITextField!
    
    @IBOutlet var txtphoneno: UITextField!
    
    
    @IBOutlet var txtmail: UITextField!
    
    @IBOutlet var txtreview: UITextField!
    @IBAction func submitbuttton(_ sender: UIButton) {
        let sec:SecondViewController = self.storyboard?.instantiateViewController(identifier: "sec") as! SecondViewController
        sec.strname = txtname.text
        sec.strnumber=txtphoneno.text
        sec.strmail=txtmail.text
        sec.strreview=txtreview.text
        self.navigationController?.pushViewController(sec, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

