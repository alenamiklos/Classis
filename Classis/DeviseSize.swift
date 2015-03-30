//
//  DeviseSize.swift
//  Classis
//
//  Created by Ivee Mendes Marins on 3/30/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit

struct DeviseSize {
    
    //Obter CGRect
    static func bounds()->CGRect{
        return UIScreen.mainScreen().bounds;
    }
    
    //Obter o tamanho horizontal da tela
    static func screenWidth()->Int{
        return Int( UIScreen.mainScreen().bounds.size.width);
    }
    
    //Obter o tamanho vertical da tela
    static func screenHeight()->Int{
        return Int(UIScreen.mainScreen().bounds.size.height);
    }
}