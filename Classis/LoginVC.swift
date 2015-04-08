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

