//
//  AppDelegate.swift
//  Classis
//
//  Created by Alena Miklos on 12/03/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        var pathAux = NSSearchPathForDirectoriesInDomains (.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = pathAux.stringByAppendingPathComponent("Eventos.plist")
        var path2 = pathAux.stringByAppendingPathComponent("Usuarios.plist")
        var fileManager = NSFileManager.defaultManager()
        
        if (!(fileManager.fileExistsAtPath(path)))
        {
            var bundle : NSString! = NSBundle.mainBundle().pathForResource("Eventos", ofType: "plist")
            fileManager.copyItemAtPath(bundle as String, toPath: path, error:nil)
        }
        
        if (!(fileManager.fileExistsAtPath(path2)))
        {
            var bundle : NSString! = NSBundle.mainBundle().pathForResource("Usuarios", ofType: "plist")
            fileManager.copyItemAtPath(bundle as String, toPath: path2, error:nil)
        }
        
        
        
        
        
        return true
    }
    

}
