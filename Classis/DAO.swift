//
//  DAOProtocol.swift
//  Classis
//
//  Created by Lucas Lima on 4/1/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation

protocol DAO{
    
    //Eventos
    func criarEvento(evento: Evento) -> Evento
    func listaEventos() ->[Evento]
    
    //Usuario
    func criarUsuario(novoUsuario: Usuario) -> Usuario?
    func listaUsuarios() -> [Usuario]
    func buscaUsuario(idBuscado: String) -> Usuario?
    
    //Usuario -> Evento
    func buscarEventosUsuario(usuario: Usuario) -> [Evento]?
    func buscarEventosUsuarioDia(usuario: Usuario, data: String) -> [Evento]?
    
    //Sistema
    func checkLogin(userLogin: String, userPass: String) -> Usuario?
    func stringRandom (tam : Int) -> String

    }

