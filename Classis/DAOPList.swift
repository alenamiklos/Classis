//
//  DAO.swift
//  Classis
//
//  Created by Ivee Mendes Marins on 3/17/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation

class DAOPList: DAO {
    
    
    //Eventos
    func criarEvento(evento: Evento) -> Evento {
        
        
        println("Adicinando evento...")
        
        var pathAux = NSSearchPathForDirectoriesInDomains (.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = pathAux.stringByAppendingPathComponent("Eventos.plist")
        var fileManager = NSFileManager.defaultManager()
        
        var data : NSMutableArray! = NSMutableArray(contentsOfFile: path)
        
        var temp = [String: String]()
        
        temp["titulo"] = evento.titulo
        temp["tipoEvento"] = evento.tipoEvento
        temp["descEvent"] = evento.descEvento
        temp["dataHora"] = evento.dataHora
        temp["tipoRemuneração"] = evento.tipoRemuneracao
        temp["preco"] = evento.preco?
        temp["localEvento"] = evento.local
        temp["responsavel"] = evento.responsavel
        temp["participantes"] = evento.participantes
        temp["areaConhecimento"] = evento.areaConhecimento
        temp["media"] = evento.media?.description
        
        data.addObject(temp)
        data.writeToFile(path, atomically: false)
        println(data)
        
        //retornar um evento
        
        return evento;
        
        
    }
    
    func listaEventos() ->[Evento] {
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
            
            
            
            
            var evento = Evento (
                titulo: object["titulo"] as String,
                tipoEvento: object["tipoEvento"] as String,
                descEvento: object["descEvento"] as String,
                dataHora: object["dataHora"] as String,
                tipoRemuneracao: object["tipoRemuneracao"] as String,
                preco: object["preco"] as? String,
                local: object["local"] as String,
                responsavel: object["responsavel"] as String,
                participantes: object["participantes"] as String,
                areaConhecimento: object["areaConhecimento"] as String,
                media: nil
            )

            println(evento)
            
            listaFake.append(evento)
        }
        
        println(listaFake)
        println(listaFake.count)
        println(listaFake[0].titulo)
        println("Saindo na lita de eventos...")
        
        return listaFake
    }
    
    
    //Usuario
    func criarUsuario(novoUsuario: Usuario) -> Usuario? {
        
        var pathAux = NSSearchPathForDirectoriesInDomains (.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = pathAux.stringByAppendingPathComponent("Usuarios.plist")
        var fileManager = NSFileManager.defaultManager()
        
        var data : NSMutableArray! = NSMutableArray(contentsOfFile: path)
        
        var randomId = stringRandom(8)
        
        let dataGeraRandom = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let componentes = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: dataGeraRandom)
        let horas = componentes.hour
        let minutos = String(componentes.minute)
        var segundos = String(componentes.second)
        
        
        
        novoUsuario.id = "\(randomId)" + "\(minutos)" + "\(segundos)"
        
        var temp = [String: String]()
        
        temp["username"] = novoUsuario.username
        temp["senha"] = novoUsuario.senha
        temp["id"] = novoUsuario.id
        temp["nome"] = novoUsuario.nome
        temp["curso"] = novoUsuario.curso
        temp["habilidades"] = novoUsuario.habilidades
        temp["foto"] = novoUsuario.foto
        temp["media"] = "0"
        
        
        data.addObject(temp)
        
        data.writeToFile(path, atomically: false)
        println(data)
        
        return novoUsuario;
        
    }
    
    func listaUsuarios() -> [Usuario] {
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
                habilidades: object["habilidades"] as String,
                foto: nil,
                avaliacoes: nil
            )
            
            
            //println(usuarioAchado)
            
            listaUsuarios.append(usuarioAchado)
        }
        
        return listaUsuarios
    }
    
    func buscaUsuario(idBuscado: String) -> Usuario? {
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
    
    
    //Usuario -> Evento
    func buscarEventosUsuario(usuario: Usuario) -> [Evento]? {
        
        var eventos = listaEventos()
        
        var lista = [Evento]()
        
        for var i = 0; i < eventos.count; i++
        {
            let isEqual = (eventos[i].responsavel == usuario.id)
            
            if (isEqual)
            {
                lista.append(eventos[i])
            }
            
        }
        
        if (lista.count != 0 ) {
            return lista
        }
        
        
        return nil
    }
    
    func buscarEventosUsuarioDia(usuario: Usuario, data: String) -> [Evento]? {
        let dataArray = data.componentsSeparatedByString(" ")
        //anoMesDia = dataArray[0]
        //hora = dataArray[1]
        
        var calendario = String(dataArray[0])
        
        let anoMesDia = calendario.componentsSeparatedByString("/")
        //ano = anoMesDia[0]
        //mes = anoMesDia[1]
        //dia = anoMesDia[2]
        
        var eventosUsuario = buscarEventosUsuario(usuario)
        
        var lista = [Evento]()
        
        
        for var i = 0; i < eventosUsuario?.count; i++
        {
            let isEqual = (eventosUsuario?[i].dataHora == data)
            
            if (isEqual) {
                lista.append(eventosUsuario![i])
            }
            
        }
        
        if (lista.count != 0 ) {
            return lista
        }
        
        
        return nil
        
        
        
        
    }
    
    
    //Sistema
    func checkLogin(userLogin: String, userPass: String) -> Usuario? {
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
    
    func stringRandom (tam : Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        var randomString : NSMutableString = NSMutableString(capacity: tam)
        
        for (var i=0; i < tam; i++){
            var length = UInt32 (letters.length)
            var rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString
    }
    
}

