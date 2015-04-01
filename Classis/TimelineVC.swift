//
//  TimelineVC.swift
//  Classis
//
//  Created by Alena Miklos on 12/03/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit



class TimelineVC: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet var timeLine: UITableView!
    var listaEventos = [Evento]()
    var dao: DAO = DAOFactory.getDAOInstance()
    
    var filteredEventos = [Evento]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DAO: ")
        println(self.dao)
        //self.listaEventos = []
        
        listaEventos = self.dao.listaEventos(nil, usuario: nil)
        print("Eventos: ")
        println(listaEventos.count)
    }
    
    override func viewDidAppear(animated: Bool) {
        println("Reloading data")
        timeLine.reloadData()
        
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All"){
        self.filteredEventos = self.listaEventos.filter ({ (evento: Evento) -> Bool in
            let tituloMatch = (scope == "All") || (evento.descEvento == scope)
            let stringMatch = evento.titulo.rangeOfString(searchText)
            return tituloMatch && (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 127;
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
        let eventoAtual = self.listaEventos[indexPath.row]
        
        cell.NomeEvento.text? = eventoAtual.titulo
        cell.DescricaoEvento?.text = eventoAtual.descEvento
        cell.TipoEvento.text? = eventoAtual.tipoEvento
        cell.LocalEvento.text = eventoAtual.local
        cell.PrecoEvento.text = eventoAtual.preco?
        //cell.imageView?.image = eventoAtual.imagem?
        
        return cell
    }
    
    //Search Bar
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var i = 0
        if (listaEventos.count != 0) {
            if (self.listaEventos.count > 0) {
                i = self.listaEventos.count
                
                
            }
        }
        println(i)
        return i
    }
    
    

   
}
