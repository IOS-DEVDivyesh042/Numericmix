//
//  ViewController.swift
//  OmniVersa
//
//  Created by Manish Bhanushali on 16/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var btn1: UIButton!
    
    
    @IBOutlet weak var btn2: UIButton!
    
    
    @IBOutlet weak var btn3: UIButton!
    
    
    @IBOutlet weak var btn4: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1.layer.cornerRadius = 20
        btn1.layer.borderColor = UIColor.black.cgColor
        btn1.layer.borderWidth = 2
        
        btn4.layer.cornerRadius = 20
        btn4.layer.borderColor = UIColor.black.cgColor
        btn4.layer.borderWidth = 2
        
        btn3.layer.cornerRadius = 20
        btn3.layer.borderColor = UIColor.black.cgColor
        btn3.layer.borderWidth = 2
        
        btn2.layer.cornerRadius = 20
        btn2.layer.borderColor = UIColor.black.cgColor
        btn2.layer.borderWidth = 2
        
    }
    
    @IBAction func btnroman(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Romannumeral")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    @IBAction func btndecim(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "decimaltonumeral")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    @IBAction func btnmorse(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Morse")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    @IBAction func btntxtmorse(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Textmorse")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    


}

