//
//  ViewController.swift
//  Classis
//
//  Created by Alena Miklos on 12/03/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit
import Parse


class LoginVC: UIViewController {

    @IBOutlet weak var cursoUsuario: UILabel!
    @IBOutlet weak var imagemAvaliacao: UIImageView!
    @IBOutlet weak var habilidadesTextView: UITextView!
    @IBOutlet weak var nomeUsuario: UILabel!
    @IBOutlet weak var eventosRealizadosUsuario: UIButton!
    @IBOutlet weak var imagemUsuario: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "xib")?.drawInRect(self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        var object = PFObject(className: "TestClass")
        object.addObject("Banana", forKey: "favoriteFood")
        object.addObject("Chocolate", forKey: "favoriteIceCream")
        object.saveInBackground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginWithUsername(sender: AnyObject) {
        
        self.performSegueWithIdentifier("logado", sender: self)
    }
    
    @IBAction func loginWithFacebook(sender: AnyObject) {
        
        self.performSegueWithIdentifier("logado", sender: self)
        
    }

}

