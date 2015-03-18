//
//  TimelineVC.swift
//  Classis
//
//  Created by Alena Miklos on 12/03/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit



class TimelineVC: UITableViewController {
    
    @IBOutlet var timeLine: UITableView!
    var listaEventos: [Evento]! = []
    var dao: DAO = DAO()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DAO: ")
        println(self.dao)
        //self.listaEventos = []
        self.listaEventos? = self.dao.listaEventos(nil, usuario: nil)
        print("Eventos: ")
        println(self.listaEventos?.count)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> TimeLineTableViewCell
    {
        
 /*       @IBOutlet weak var ImageEvento: UIImageView!
        @IBOutlet weak var NomeEvento: UILabel!
        @IBOutlet weak var DescricaoEvento: UILabel!
        @IBOutlet weak var TipoEvento: UILabel!
        @IBOutlet weak var DataEvento: UILabel!
        @IBOutlet weak var HoraEvento: UILabel!
        @IBOutlet weak var LocalEvento: UILabel!
        @IBOutlet weak var PrecoEvento: UILabel! */
        
        var cell = timeLine.dequeueReusableCellWithIdentifier("celulaTimeline") as TimeLineTableViewCell
        let eventoAtual = self.listaEventos![indexPath.row]
        
        cell.NomeEvento.text? = eventoAtual.titulo
        cell.DescricaoEvento?.text = "Falta incluir a descrição do evento na classe 'Evento'"
        cell.TipoEvento.text? = eventoAtual.tipoEvento
        cell.LocalEvento.text = eventoAtual.local
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var i = 0
        if (self.listaEventos != nil) {
            if (self.listaEventos?.count > 0) {
                i = self.listaEventos!.count
                
                
            }
        }
        println(i)
        return i
    }

   
}
