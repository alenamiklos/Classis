//
//  DAO.swift
//  Classis
//
//  Created by Ivee Mendes Marins on 3/17/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation

class DAO {
    
    func listaEventos(area: String?, usuario: Usuario?) ->[Evento]{
        println("Entrando na lita de eventos...")
        
        var listaFake: [Evento] = []
        
        var jordan: Usuario = Usuario(nome: "Jordan", curso: "Ciencia da Computacao", habilidades: ["C", "C++", "Swift", "Objective-C"], foto: nil, avaliacoes: nil)
        
        var lucas:Usuario = Usuario(nome: "Lucas Lima", curso: "Ciencia da Computacao", habilidades: ["C", "C++", "Swift", "Objective-C"], foto: nil, avaliacoes: nil)
        
        var alena:Usuario = Usuario(nome: "Alena Miklos", curso: "Design de Mídia Digital", habilidades: ["Photoshop", "Illustrator", "3D Max", "Adobe Premiere"], foto: nil, avaliacoes: nil)
        
        var data: NSDate = NSDate()
        
        var evento1: Evento = Evento(titulo: "Aula de C (Fundamentos)", tipoEvento: "Aulão", descEvento: "Aula inicial de fundamentos C", dataHora: data, tipoRemuneracao: "Gratuita", preco: nil, local: "Sofá do BEPiD", imagem: "aulao", responsavel: jordan, participantes: nil, areaConhecimento: "Programação", media: nil)
        
        var evento2: Evento = Evento(titulo: "Aula Photoshop Básico", tipoEvento: "Aulão",descEvento: "Layers, ruler e blur", dataHora: data, tipoRemuneracao: "Gratuita", preco: nil, local: "LAB1 do BEPiD", imagem: "aulao", responsavel: alena, participantes: nil, areaConhecimento: "Design", media: nil)
        
        var evento3: Evento = Evento(titulo: "Aula de C (Fundamentos)", tipoEvento: "Aulão", descEvento: "Aula inicial de fundamentos C em horário alternativo", dataHora: data, tipoRemuneracao: "Gratuita", preco: nil, local: "Sofá do BEPiD", imagem: "aulao", responsavel: lucas, participantes: nil, areaConhecimento: "Programação", media: nil)
        
        var evento4: Evento = Evento(titulo: "Aula Photoshop Avançado", tipoEvento: "Aulão", descEvento: "Mitando com a Alena ˆ.ˆ", dataHora: data, tipoRemuneracao: "Pago", preco: "R$50,00", local: "LAB1 do BEPiD", imagem: "aulao", responsavel: alena, participantes: nil, areaConhecimento: "Design", media: nil)
        
        var evento5: Evento = Evento(titulo: "Aula de C (Avançado)", tipoEvento: "Aulão",descEvento: "Olá, jovem", dataHora: data, tipoRemuneracao: "Paga", preco: "R$30,00", local: "Sofá do BEPiD", imagem: "aulao", responsavel: jordan, participantes: nil, areaConhecimento: "Programação", media: nil)
        
        //listaFake.append(evento1)
        listaFake += [evento1, evento2, evento3, evento4, evento5]
        println(listaFake)
        println(listaFake.count)
        println(listaFake[0].titulo)
        println("Saindo na lita de eventos...")
        
        
        return listaFake
    }
    
    func loginSuccessful() -> Bool {
        return true
    }
    
}