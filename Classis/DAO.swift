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
        var jordan: Usuario = Usuario(id: 1,nome: "Jordan", curso: "Ciencia da Computacao", habilidades: ["C", "C++", "Swift", "Objective-C"], foto: nil, avaliacoes: nil)
        
        println("Entrando na lista de eventos...")
        
        println(jordan)

        
        
        
//        var lucas:Usuario = Usuario(nome: "Lucas Lima", curso: "Ciencia da Computacao", habilidades: ["C", "C++", "Swift", "Objective-C"], foto: nil, avaliacoes: nil)
//        
//        var alena:Usuario = Usuario(nome: "Alena Miklos", curso: "Design de Mídia Digital", habilidades: ["Photoshop", "Illustrator", "3D Max", "Adobe Premiere"], foto: nil, avaliacoes: nil)
//        
//        var data: NSDate = NSDate()
//        
//        var evento1: Evento = Evento(titulo: "Aula de C (Fundamentos)", tipoEvento: "Aulão", descEvento: "Aula inicial de fundamentos C", dataHora: data, tipoRemuneracao: "Gratuita", preco: nil, local: "Sofá do BEPiD", imagem: "aulao", responsavel: jordan, participantes: nil, areaConhecimento: "Programação", media: nil)
//        
//        var evento2: Evento = Evento(titulo: "Aula Photoshop Básico", tipoEvento: "Aulão",descEvento: "Layers, ruler e blur", dataHora: data, tipoRemuneracao: "Gratuita", preco: nil, local: "LAB1 do BEPiD", imagem: "aulao", responsavel: alena, participantes: nil, areaConhecimento: "Design", media: nil)
//        
//        var evento3: Evento = Evento(titulo: "Aula de C (Fundamentos)", tipoEvento: "Aulão", descEvento: "Aula inicial de fundamentos C em horário alternativo", dataHora: data, tipoRemuneracao: "Gratuita", preco: nil, local: "Sofá do BEPiD", imagem: "aulao", responsavel: lucas, participantes: nil, areaConhecimento: "Programação", media: nil)
//        
//        var evento4: Evento = Evento(titulo: "Aula Photoshop Avançado", tipoEvento: "Aulão", descEvento: "Mitando com a Alena ˆ.ˆ", dataHora: data, tipoRemuneracao: "Pago", preco: "R$50,00", local: "LAB1 do BEPiD", imagem: "aulao", responsavel: alena, participantes: nil, areaConhecimento: "Design", media: nil)
//        
//        var evento5: Evento = Evento(titulo: "Aula de C (Avançado)", tipoEvento: "Aulão",descEvento: "Olá, jovem", dataHora: data, tipoRemuneracao: "Paga", preco: "R$30,00", local: "Sofá do BEPiD", imagem: "aulao", responsavel: jordan, participantes: nil, areaConhecimento: "Programação", media: nil)
//        
//        //listaFake.append(evento1)
//        listaFake += [evento1, evento2, evento3, evento4, evento5]
        
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
                                imagem: object["imagem"] as? String,
                                responsavel:jordan, participantes: nil,
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
        var pathAux = NSSearchPathForDirectoriesInDomains (.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = pathAux.stringByAppendingPathComponent("Eventos.plist")
        var fileManager = NSFileManager.defaultManager()
        
        var data : NSMutableArray! = NSMutableArray(contentsOfFile: path)
        
        var temp : [String: String] = ["titulo": evento.titulo,
                                       "tipoEvento": evento.tipoEvento]
        
        data.addObject(temp)
        data.writeToFile(path, atomically: false)
        println(data)
        
        return true;
   

    }
    
    func buscaUser(id: Int) -> Usuario
    {
        var achou: Usuario!
        var naoAchou: Usuario!
        var temp: Usuario!
        
        var pathAux = NSSearchPathForDirectoriesInDomains (.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = pathAux.stringByAppendingPathComponent("Users.plist")
        var fileManager = NSFileManager.defaultManager()
        
        var data : NSMutableArray! = NSMutableArray(contentsOfFile: path)
        
        for var i = 0; i < data.count; i++
        {
            let object = data[i] as NSDictionary
            
            temp.id = object["id"] as Int
            
            if (temp.id == id)
            {
                achou = temp
                return achou
            }
        }
        
        return naoAchou
        
        
    }

    
    func loginSuccessful() -> Bool {
        return true
    }
    
}