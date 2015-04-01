//
//  DAO.swift
//  Classis
//
//  Created by Ivee Mendes Marins on 3/17/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation

class DAO {
    
    func listaEventos(area: String?, usuario: Usuario?) ->[Evento]
    {
        var listaFake = [Evento]()
        
        println("Entrando na lista de eventos...")
        

        //var jordan: Usuario = Usuario(id: "1",nome: "Jordan", curso: "Ciencia da Computacao", habilidades: ["C", "C++", "Swift", "Objective-C"], foto: nil, avaliacoes: nil)
        //var data: NSDate = NSDate()
        //
        //var evento1: Evento = Evento(titulo: "Aula de C (Fundamentos)", tipoEvento: "Aulão", descEvento: "Aula inicial de fundamentos C", dataHora: data, tipoRemuneracao: "Gratuita", preco: nil, local: "Sofá do BEPiD", imagem: "aulao", responsavel: jordan, participantes: nil, areaConhecimento: "Programação", media: nil)

        
        let dict : NSMutableArray! = NSMutableArray(contentsOfFile: NSHomeDirectory() + "/Documents/Eventos.plist")
        
        println(dict.count)
        
        for var i = 0; i < dict.count; i++
        {
            let object = dict[i] as NSDictionary
            println(object)
            
            var evento = Evento(titulo: object["titulo"] as String,
                tipoEvento: object["tipoEvento"] as String,
                descEvento: object["descEvento"] as String,
                dataHora: object["dataHora"] as NSDate,
                tipoRemuneracao: object["tipoRemuneracao"] as String,
                preco: object["preco"] as? String,
                local: object["localEvento"] as String,
                responsavel:"",
                participantes: nil,
                areaConhecimento: object["areaConhecimento"] as String,
                media: nil)
            println(evento)
            
            listaFake.append(evento)
        }
        
        println(listaFake)
        println(listaFake.count)
        println(listaFake[0].titulo)
        println("Saindo na lita de eventos...")
        
        return listaFake
    }
    
    func criarEvento(evento: Evento) -> Bool
    {
        
        
        println("Adicinando evento...")
        
        var pathAux = NSSearchPathForDirectoriesInDomains (.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = pathAux.stringByAppendingPathComponent("Eventos.plist")
        var fileManager = NSFileManager.defaultManager()
        
        var data : NSMutableArray! = NSMutableArray(contentsOfFile: path)
        
        var temp : Dictionary = [
            "titulo": evento.titulo,
            "tipoEvento": evento.tipoEvento,
            "descEvento": evento.descEvento,
            "dataHora": "",
            "tipoRemuneracao": evento.tipoRemuneracao,
            "preco": evento.preco,
            "localEvento": evento.local,
            "responsavel": "rhejt",
            "areaConhecimento": evento.areaConhecimento
            ]
        
        
        //data.addObject(evento)
        
        data.writeToFile(path, atomically: false)
        println(data)
        
        return true;
        
        
    }
    
    func listaUsuarios() -> [Usuario]
    {
       var listaUsuarios = [Usuario]()
        
        let dict : NSMutableArray! = NSMutableArray(contentsOfFile: NSHomeDirectory() + "/Documents/Usuarios.plist")
        
        println(dict.count)
        
        for var i = 0; i < dict.count; i++
        {
            let object = dict[i] as NSDictionary
            println(object)
            
            var usuarioAchado : Usuario = Usuario(
                id: object["id"] as String,
                nome: object["nome"] as String,
                curso: object["curso"] as String,
                habilidades: object["habilidades"] as [String],
                foto: nil,
                avaliacoes: nil
            )
            
            
            println(usuarioAchado)
            
            listaUsuarios.append(usuarioAchado)
        }

        return listaUsuarios
    }
    
    func buscaUsuario (idBuscado: String) -> Usuario
    {
        var lista = [Usuario]()

        lista = self.listaUsuarios()
        
        for var i = 0; i < lista.count; i++
        {
            let isEqual = (lista[i].id == idBuscado)
            
            if (isEqual)
            {
                return lista[i]
            }
        
        }
        
        
        return lista[-1]
    }
    
    
    
    func buscarEvento()
    {
        
    }
    
    
    func loginSuccessful() -> Bool {
        return true
    }
    
}

//        var query = PFQuery(className:"GameScore")
//        query.whereKey("objectId", equalTo:id)
//        query.findObjectsInBackgroundWithBlock {
//            (objects: [AnyObject]!, error: NSError!) -> Void in
//            if error == nil {
//
//                // The find succeeded.
//                println("Successfully retrieved \(objects.count) scores.")
//
//                // Do something with the found objects
//                if let objects = objects as? [PFObject] {
//                    for object in objects {
//                        usuarioAchado.id = object.objectId
//                        usuarioAchado.nome = object["nome"] as String
//                        usuarioAchado.habilidades = object["habilidades"] as [String]
//
//
//                    }
//                }
//            } else {
//                // Log details of the failure
//                println("Error: \(error) \(error.userInfo!)")
//            }
//        }