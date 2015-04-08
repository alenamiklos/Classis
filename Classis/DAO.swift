//
//  DAOProtocol.swift
//  Classis
//
//  Created by Lucas Lima on 4/1/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation

protocol DAO{
    
    //Funções eventos
    func listaEventos() ->[Evento]
    func criarEvento(evento: Evento) -> Evento
    
    //funcoes de usuario
    func criarUsuario(novoUsuario: Usuario) -> Usuario?
    func listaUsuarios() -> [Usuario]
    func buscaUsuario (idBuscado: String) -> Usuario?
    
    //funcoes Usuario -> evento
    func buscarEventosUsuario(usuario: Usuario) -> [Evento]?
    //func buscarEventosUsuarioDia(usuario: Usuario, dia: String) -> [Evento]?
    //func buscarEventosUsuarioMes(usuario: Usuario, mes: Int) -> [Evento]?
    
    //Funcoes do sistema
    func checkLogin(userLogin: String, userPass: String) -> Usuario?
    }
