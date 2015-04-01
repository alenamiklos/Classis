//
//  DAOProtocol.swift
//  Classis
//
//  Created by Lucas Lima on 4/1/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation

protocol DAO{
    func listaEventos(area: String?, usuario: Usuario?) ->[Evento]
    func criarEvento(evento: Evento) -> Evento
    func listaUsuarios() -> [Usuario]
    func buscaUsuario (idBuscado: String) -> Usuario?
//    func buscarEventosUsuarioDia(usuario: Usuario, dia: String) -> [Evento]?
//    func buscarEventosUsuarioMes(usuario: Usuario, mes: Int) -> [Evento]?
    func checkLogin(userLogin: String, userPass: String) -> Usuario?
//    func criarUsuario(novoUsuario: Usuario) -> Usuario?
}
