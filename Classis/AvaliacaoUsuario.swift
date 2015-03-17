//
//  AvaliacaoEvento.swift
//  Classis
//
//  Created by Ivee Mendes Marins on 3/17/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation

class AvaliacaoUsuario {
    var avaliador: Usuario
    var avaliado: Usuario
    var nota: Int
    var comentario: String?
    
    init(avaliador: Usuario, avaliado: Usuario, nota: Int, comentario: String? )
    {
        self.avaliador = avaliador
        self.avaliado = avaliado
        self.nota = nota
        self.comentario = comentario
    }
    
}