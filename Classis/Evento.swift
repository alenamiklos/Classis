//
//  Evento.swift
//  Classis
//
//  Created by Ivee Mendes Marins on 3/17/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation

class Evento {
    var titulo: String
    var tipoEvento: String
    var descEvento: String
    var dataHora: NSDate
    var tipoRemuneracao: String
    var preco: String?
    var local: String
    var responsavel: String
    var participantes: Usuario?
    var areaConhecimento: String
    var media: Float?
    
//    Evento(titulo: object["titulo"] as String, tipoEvento: object["tipoEvento"] as String, descEvento: object["descEvento"] as String, dataHora: object["dataHora"] as NSDate, tipoRemuneracao: object["tipoRemuneracao"] as String, preco: object["preco"] as? String, local: object["localEvento"] as String, imagem: object["imagem"] as? String, responsavel:jordan, participantes: nil, areaConhecimento: object["areaConhecimento"] as String, media: nil)
    
    init(titulo: String, tipoEvento: String, descEvento: String, dataHora: NSDate, tipoRemuneracao: String, preco: String?, local: String, responsavel: String, participantes: Usuario?, areaConhecimento: String, media: Float?)
    {
        self.titulo = titulo
        self.tipoEvento = tipoEvento
        self.descEvento = descEvento
        self.dataHora = dataHora
        self.tipoRemuneracao = tipoRemuneracao
        self.preco = preco
        self.local = local
        self.responsavel = responsavel
        self.participantes = participantes
        self.areaConhecimento = areaConhecimento
        self.media = media
    }
    
}