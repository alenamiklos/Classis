//
//  CadastroVC.swift
//  Classis
//
//  Created by Alena Miklos on 31/03/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit

class CadastroVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nomeUsuario: UITextField!
    @IBOutlet weak var emailUsuario: UITextField!
    @IBOutlet weak var cursoUsuario: UITextField!
    @IBOutlet weak var senhaUsuario: UITextField!
    @IBOutlet weak var habilidadesUsuario: UITextView!
    @IBOutlet weak var usuario: UITextField!
    
    var dao : DAO = DAOFactory.getDAOInstance()
    var estadoSistema : EstadoSistema = EstadoSistema.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(photoImageView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openPhotoLibrary(sender: AnyObject) {
        var photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        
        self.presentViewController(photoPicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }

    @IBAction func chooseFromCamera(sender: AnyObject) {
        var photoPicker = UIImagePickerController()
        
        photoPicker.delegate = self
        photoPicker.sourceType = .Camera
        
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    @IBAction func cadastroUsuario(sender: AnyObject) {
    
        
        var novoUsuario = Usuario(id: "",
            nome: nomeUsuario.text,
            username: usuario.text,
            senha: senhaUsuario.text,
            curso: cursoUsuario.text,
            habilidades: habilidadesUsuario.text,
            foto: nil,
            avaliacoes: [])
        
        novoUsuario = dao.criarUsuario(novoUsuario)!
        
        if (novoUsuario.id != "")
        {
             estadoSistema.usuarioLogado = novoUsuario
            self.performSegueWithIdentifier("cadastroConcluido", sender: self)
        }
        else
        {
            
        }
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
