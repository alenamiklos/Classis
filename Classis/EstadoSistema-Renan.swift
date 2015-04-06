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
    
    struct Single { static var Instance: EstadoSistema! }
    
    class var sharedInstance: EstadoSistema
    {
        if (Single.Instance == nil) {
            Single.Instance = EstadoSistema()
        }
        return Single.Instance
    }
    
    private init ()
    {
        
    }
}
