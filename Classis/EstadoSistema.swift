//
//  EstadoSistema.swift
//  Classis
//
//  Created by Lucas Lima on 4/1/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation

class EstadoSistema {
    
    var usuarioLogado : Usuario?
    
    class var sharedInstance : EstadoSistema{
        get {
            struct _EstadoSistema
            {
                static let instance = EstadoSistema()
            }
            return _EstadoSistema.instance
        }
    }
    
    private init ()
    {
        
    }
    
    
}
