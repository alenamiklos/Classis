//
//  EventCreationVCViewController.swift
//  Classis
//
//  Created by Alena Miklos on 12/03/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit

class EventCreationVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var nomeEvento: UITextField!
    @IBOutlet weak var localEvento: UITextField!
    @IBOutlet weak var tipoEvento: UIPickerView!
    @IBOutlet weak var dataHoraEvento: UIDatePicker!
    @IBOutlet weak var remuneracao: UISegmentedControl!
    @IBOutlet weak var precoEvento: UITextField!
    @IBOutlet weak var descricaoEvento: UITextField!
    
    var tipoEventosArray:NSArray = []
    var tipoEventoEscolhido:NSString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        scroller.scrollEnabled = true
        scroller.contentSize = CGSizeMake(370, 1000)
        
        
        
        tipoEventosArray = ["Aulas","Worshop","Serviços"]
        
  
        // Do any additional setup after loading the view.
    }
    
   // titulo: String, tipoEvento: String, dataHora: NSDate, tipoRemuneracao: String, preco: Float?, local: String, responsavel: Usuario, participantes: Usuario?, areaConhecimento: String, media: Float?)
    @IBAction func confirmarEventoButton(sender: UIButton) {
        //crisEventos(titulo: nomeEvento.text, tipoEvento: "Aula", dataHora: NSDate, tipoRemuneracao: String, preco: Float?, local: String, responsavel: Usuario, participantes: Usuario?, areaConhecimento: String, media: Float?)
        
//        var evento = Evento(titulo: nomeEvento.text,
//            tipoEvento: tipoEvento, //picker
//            descEvento: descEvento.text,
//            dataHora: dataHoraEvento,
//            tipoRemuneracao: tipoRemuneracao, //picker
//            preco: precoEvento.text,
//            local: localEvento.text,
//            imagem: nil,
//            responsavel:jordan,
//            areaConhecimento: areaConhecimento.text, //criar
//            media: nil)

        
    }
    
    
    
    
    
    //Segmented Control
    @IBAction func tipoRemuneracao(sender: AnyObject)
    {
        if  remuneracao.selectedSegmentIndex == 0
        {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.precoEvento.alpha = 1
            })
            
            self.precoEvento.enabled = true
        }
        if  remuneracao.selectedSegmentIndex == 1
        {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.precoEvento.alpha = 0.2
            })
            
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

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
