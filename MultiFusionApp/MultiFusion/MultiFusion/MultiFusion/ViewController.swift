//
//  ViewController.swift
//  MultiFusion
//
//  Created by Manish Bhanushali on 06/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tview: UIView!
    
    @IBOutlet weak var bview: UIView!
    
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    
    @IBOutlet weak var btn3: UIButton!
    
    
    @IBOutlet weak var btn4: UIButton!
    
    
    @IBOutlet weak var btn5: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view1.layer.cornerRadius = 20
        view1.layer.borderWidth = 3
        view1.layer.borderColor = UIColor.purple.cgColor
        
        
        view2.layer.cornerRadius = 20
        view2.layer.borderWidth = 3
        view2.layer.borderColor = UIColor.purple.cgColor
        
        view3.layer.cornerRadius = 20
        view3.layer.borderWidth = 3
        view3.layer.borderColor = UIColor.purple.cgColor
        
        tview.layer.cornerRadius = 20
        tview.layer.borderWidth = 3
        tview.layer.borderColor = UIColor.purple.cgColor
        
        bview.layer.cornerRadius = 20
        bview.layer.borderWidth = 3
        bview.layer.borderColor = UIColor.purple.cgColor
        
        btn5.layer.cornerRadius = 20
        btn5.layer.borderWidth = 3
        btn5.layer.borderColor = UIColor.purple.cgColor
        
        btn4.layer.cornerRadius = 20
        btn4.layer.borderWidth = 3
        btn4.layer.borderColor = UIColor.purple.cgColor
        
        btn3.layer.cornerRadius = 20
        btn3.layer.borderWidth = 3
        btn3.layer.borderColor = UIColor.purple.cgColor
        
        btn2.layer.cornerRadius = 20
        btn2.layer.borderWidth = 3
        btn2.layer.borderColor = UIColor.purple.cgColor
        
        btn1.layer.cornerRadius = 20
        btn1.layer.borderWidth = 3
        btn1.layer.borderColor = UIColor.purple.cgColor
        
        
        
        
    }
    
    
    @IBAction func btnforce(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Force")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    @IBAction func btnSpeed(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Speed")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    @IBAction func btnnumber(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Number")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    @IBAction func btnTime(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Time")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    

    @IBAction func btnangle(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Angle")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
}

