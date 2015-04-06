//
//  DAO.swift
//  Classis
//
//  Created by Ivee Mendes Marins on 3/17/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation

class DAOPList: DAO {
    
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
    
    func criarEvento(evento: Evento) -> Evento
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
        
        //retornar um evento
        
        return evento;
        
        
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
                username: object["username"] as String,
                senha: object["senha"] as String,
                curso: object["curso"] as String,
                habilidades: object["habilidades"] as [String],
                foto: nil,
                avaliacoes: nil
            )
            
            
            //println(usuarioAchado)
            
            listaUsuarios.append(usuarioAchado)
        }

        return listaUsuarios
    }
    
    func buscaUsuario (idBuscado: String) -> Usuario?
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
        
        
        return nil
    }
    
    func checkLogin(userLogin: String, userPass: String) -> Usuario?
    {
        var lista : [Usuario]
        lista = listaUsuarios()
        
        
        for var i = 0; i < lista.count; i++
        {
            
            let isEqual = (userLogin == lista[i].username && userPass == lista[i].senha)
            
            if (isEqual)
            {
                return lista[i]
            }
            
        }
        return nil
        
    }

    
//    func buscarEventosUsuarioDia(usuario: Usuario, dia: String) -> [Evento]? {
//        
//    }
//    func buscarEventosUsuarioMes(usuario: Usuario, mes: Int) -> [Evento]? {
//        
//    }
//    func checkLogin(userLogin: String, userPass: String) -> Usuario? {
//        
//    }
//    func criarUsuario(novoUsuario: Usuario) -> Usuario? {
//        
//    }
    
}

