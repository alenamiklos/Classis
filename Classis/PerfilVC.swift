//
//  PerfilVC.swift
//  Classis
//
//  Created by Lucas Lima on 4/6/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit


class PerfilVC: UIViewController {
    
    @IBOutlet weak var cursoUsuario: UILabel!
    @IBOutlet weak var imagemAvaliacao: UIImageView!
    @IBOutlet weak var habilidadesTextView: UITextView!
    @IBOutlet weak var nomeUsuario: UILabel!
    @IBOutlet weak var eventosRealizadosUsuario: UIButton!
    @IBOutlet weak var imagemUsuario: UIImageView!

    var dao : DAO = DAOFactory.getDAOInstance()
    var estadoSistema : EstadoSistema = EstadoSistema.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      nomeUsuario.text=estadoSistema.usuarioLogado!.nome
    cursoUsuario.text=estadoSistema.usuarioLogado!.curso
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
