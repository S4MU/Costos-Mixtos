//
//  ViewController.swift
//  Costos Mixtos
//
//  Created by Samuel Gomez on 3/3/15.
//  Copyright (c) 2015 SamG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func displayAlert(title:String, error:String) {
        
        let alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    @IBOutlet var PrdA: UITextField!
    @IBOutlet var PrdB: UITextField!
    @IBOutlet var CA: UITextField!
    @IBOutlet var CB: UITextField!
    
    
    @IBOutlet var CVULabel: UILabel!
    @IBOutlet var CostoFijo: UILabel!
    @IBOutlet var CVA: UILabel!
    @IBOutlet var CVB: UILabel!

    
    @IBAction func Refresh(sender: AnyObject) {
        
        PrdA.text = ""
        PrdB.text = ""
        CA.text = ""
        CB.text = ""
        CVULabel.text = ""
        CostoFijo.text = ""
        CVA.text = ""
        CVB.text = ""
    }
    @IBAction func CostoFijo(sender: AnyObject) {
        
        if Int(PrdA.text!) == nil && Int(PrdB.text!) == nil && Int(CA.text!) == nil && Int(CB.text!) == nil {
            self.displayAlert("TextField Empty!", error: "Please fill in the empty fields!")
        }else{
            Resultado()
        }
        
    }
 
    
    func Resultado() {
        
        var ProdA = Int(PrdA.text!)
        var ProdB = Int(PrdB.text!)
        var CostoA = Int(CA.text!)
        var CostoB = Int(CB.text!)
        
        var diferenciaP = ProdA! - ProdB!
        var diferenciaC = CostoA! - CostoB!
        let CVU = Float(diferenciaC) / Float(diferenciaP)
        var CostoVA = Float(CVU) * Float(ProdA!)
        var CostoVB = Float(CVU) * Float(ProdB!)
        var CostoF = Float(CostoA!) - Float(CostoVA)
        var Comprobacion = Float(CostoB!) - Float(CostoVB)
        
        CVULabel.text = "\(CVU)"
        CostoFijo.text = "\(CostoF)"
        CVA.text = "\(CostoVA)"
        CVB.text = "\(CostoVB)"
        print(diferenciaP)
        print(diferenciaC)
        print(Double(CVU))
        print(Double(CostoVA))
        print(Double(CostoVB))
        print(Double(CostoF))
        print(Double(Comprobacion))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

