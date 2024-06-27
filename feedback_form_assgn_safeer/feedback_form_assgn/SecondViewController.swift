//
//  SecondViewController.swift
//  feedback_form_assgn
//
//  Created by Safeer Ahmed on 27/06/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var lblreview: UILabel!
    @IBOutlet var lblmail: UILabel!
    @IBOutlet var lblnumber: UILabel!
    @IBOutlet var lblname: UILabel!
    var strname:String! = nil
    var strnumber:String! = nil
    var strmail:String! = nil
    var strreview:String! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        lblname.text=strname
        lblnumber.text=strnumber
        lblmail.text=strmail
        lblreview.text=strreview
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
