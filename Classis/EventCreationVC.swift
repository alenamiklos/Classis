//
//  EventCreationVCViewController.swift
//  Classis
//
//  Created by Alena Miklos on 12/03/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit

class EventCreationVC: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var nomeEvento: UITextField!
    @IBOutlet weak var localEvento: UITextField!
    @IBOutlet weak var tipoEvento: UIPickerView!
    @IBOutlet weak var dataHoraEvento: UIDatePicker!
    @IBOutlet weak var remuneracao: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        scroller.scrollEnabled = true
        scroller.contentSize = CGSizeMake(370, 1000)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
