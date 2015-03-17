//
//  TimeLineTableViewCell.swift
//  Classis
//
//  Created by Ivee Mendes Marins on 3/17/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {

    @IBOutlet weak var ImageEvento: UIView!
    @IBOutlet weak var NomeEvento: UILabel!
    @IBOutlet weak var DescricaoEvento: UILabel!
    @IBOutlet weak var TipoEvento: UILabel!
    @IBOutlet weak var DataEvento: UILabel!
    @IBOutlet weak var HoraEvento: UILabel!
    @IBOutlet weak var LocalEvento: UILabel!
    @IBOutlet weak var PrecoEvento: UILabel!
    @IBOutlet weak var ButtonEvent: UIButton!
    
    @IBAction func EventoButton(sender: UIButton)
    {
        
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
