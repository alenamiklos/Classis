//
//  EventCreationVCViewController.swift
//  Classis
//
//  Created by Alena Miklos on 12/03/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit

class EventCreationVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var nomeEvento: UITextField!
    @IBOutlet weak var localEvento: UITextField!
    @IBOutlet weak var tipoEvento: UIPickerView!
    @IBOutlet weak var dataHoraEvento: UIDatePicker!
    @IBOutlet weak var remuneracao: UISegmentedControl!
    @IBOutlet weak var precoEvento: UITextField!
    @IBOutlet weak var descricaoEvento: UITextField!
    @IBOutlet weak var areaConhecimentoEvento: UITextField!
    
    var dao: DAO = DAOFactory.getDAOInstance()
    var estadosistema : EstadoSistema = EstadoSistema.sharedInstance
    
    
    var tipoEventosArray:NSArray = []
    var tipoEventoEscolhido:NSString = ""
    var tipoRemuneracaoEscolhido:NSString = ""
    var strDate : NSDate = NSDate()
    var strData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        scroller.scrollEnabled = true
        scroller.contentSize = CGSizeMake(370, 1000)
        
        dataHoraEvento.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        tipoEventosArray = ["Aulas","Worshop","Serviços"]
        
  
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func confirmarEventoButton(sender: UIButton) {
        
        var data: NSDate = NSDate()
    
        var evento = Evento(titulo: nomeEvento.text,
            tipoEvento: tipoEventoEscolhido,
            descEvento: descricaoEvento.text,
            dataHora: strData,
            tipoRemuneracao: tipoRemuneracaoEscolhido,
            preco: precoEvento.text,
            local: localEvento.text,
<<<<<<< HEAD
            responsavel: estadosistema.usuarioLogado!.id,
            participantes:nil,
            areaConhecimento: areaConhecimentoEvento.text,
=======
            responsavel:"", //singleton usuario.id
            participantes:"",
            areaConhecimento: "Programação", //criar campo
>>>>>>> origin/master
            media: nil)
        
        dao.criarEvento(evento)

    }
    
    
    //Segmented Control
    @IBAction func tipoRemuneracao(sender: AnyObject)
    {
        if  remuneracao.selectedSegmentIndex == 0
        {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.precoEvento.alpha = 1
                
                self.tipoRemuneracaoEscolhido = "Pago"
            })
            
            self.precoEvento.enabled = true
        }
        if  remuneracao.selectedSegmentIndex == 1
        {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.precoEvento.alpha = 0.2
                
            })
            self.tipoRemuneracaoEscolhido = "Gratuito"
            self.precoEvento.enabled = false
        }
    }
    
    //PickerView
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipoEventosArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(tipoEventosArray[row])"
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if tipoEvento == 0
        {
            tipoEventoEscolhido = tipoEventosArray[0] as NSString
        }
        if tipoEvento == 1
        {
            tipoEventoEscolhido = tipoEventosArray[1] as NSString
        }
        if tipoEvento == 2
        {
            tipoEventoEscolhido = tipoEventosArray[2] as NSString
        }
    }
    
    func datePickerChanged ( datePicker : UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        println("\(datePicker.date)")
        
        var strDate = dateFormatter.stringFromDate(datePicker.date)
        strData = dateFormatter.stringFromDate(datePicker.date)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

    
}
