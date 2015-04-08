//
//  ViewController.swift
//  Classis
//
//  Created by Alena Miklos on 12/03/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit


class LoginVC: UIViewController {

    @IBOutlet weak var campoUsuario: UITextField!

    @IBOutlet weak var campoSenha: UITextField!
    
    var dao : DAO = DAOFactory.getDAOInstance()
    var estadoSistema : EstadoSistema = EstadoSistema.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "xib")?.drawInRect(self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginWithUsername(sender: AnyObject) {
        
        var usuario : Usuario?
        
        usuario = dao.checkLogin(campoUsuario.text, userPass: campoSenha.text)
        
        if (usuario == nil)
        {
            println("Usuário nulo");
            estadoSistema.usuarioLogado = nil
            //TODO: enviar mensagem de erro ao usuário
            var alertController = UIAlertController(title: "Usuário não encontrado!", message: "Desejar criar?", preferredStyle: .Alert)
            
            var okAction = UIAlertAction(title: "Sim", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                
                var vc = self.storyboard?.instantiateViewControllerWithIdentifier("primeiroLogin") as CadastroVC
                self.presentViewController(vc, animated: true, completion: nil)
                NSLog("Sim Pressed")
            }
            var cancelAction = UIAlertAction(title: "Não", style: UIAlertActionStyle.Cancel) {
                UIAlertAction in
                NSLog("Não Pressed")
            }
            
            // Add the actions
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            // Present the controller
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
        }
        else
        {
            println("Usuário logado");
            estadoSistema.usuarioLogado = usuario
            self.performSegueWithIdentifier("logado", sender: self)
        }
        
        
    }
    
    @IBAction func registrar(sender: AnyObject) {
        
        self.performSegueWithIdentifier("primeiroLogin", sender: self)
    
        
    }
}

