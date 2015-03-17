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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.timeLine.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> TimeLineTableViewCell
    {
        var cell = timeLine.dequeueReusableCellWithIdentifier("celulaTimeline") as! TimeLineTableViewCell
        cell.NomeEvento?.text = "Testando a celula"
        cell.DescricaoEvento?.text = "Evento para a zueira"
        
            
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

   
}
