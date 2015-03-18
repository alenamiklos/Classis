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
    var imagem: String?
    var responsavel: Usuario
    var participantes: Usuario?
    var areaConhecimento: String
    var media: Float?
    
    init(titulo: String, tipoEvento: String, descEvento: String, dataHora: NSDate, tipoRemuneracao: String, preco: String?, local: String, imagem: String, responsavel: Usuario, participantes: Usuario?, areaConhecimento: String, media: Float?)
    {
        self.titulo = titulo
        self.tipoEvento = tipoEvento
        self.descEvento = descEvento
        self.dataHora = dataHora
        self.tipoRemuneracao = tipoRemuneracao
        self.preco = preco
        self.local = local
        self.imagem = imagem
        self.responsavel = responsavel
        self.participantes = participantes
        self.areaConhecimento = areaConhecimento
        self.media = media
    }
    
}