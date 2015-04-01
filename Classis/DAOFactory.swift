//
//  DAOFactory.swift
//  Classis
//
//  Created by Lucas Lima on 4/1/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import Foundation

class DAOFactory {
    class func getDAOInstance () -> DAO {
        return DAOPList ()
    }
}