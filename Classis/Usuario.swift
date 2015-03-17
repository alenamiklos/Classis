//
//  Usuario.swift
//  Classis
//
//  Created by Ivee Mendes Marins on 3/17/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation
import UIKit

class Usuario
{
    var nome: String
    var curso: String
    var habilidades: [String] // lista de String
    var foto: UIImage?
    var media: Float?
    var avaliacoes: [AvaliacaoUsuario]?
    //var avaliacoes: Array<AvaliacaoUsuario>
//   var nome: String? tem ou não

    
    init(nome: String, curso: String, habilidades: [String], foto: UIImage?, avaliacoes: [AvaliacaoUsuario]? ){
            self.nome = nome
            self.curso = curso
            self.habilidades = habilidades
            self.foto = foto
            self.avaliacoes = avaliacoes
            self.media = 0
    }
}