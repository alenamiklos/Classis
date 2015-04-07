//
//  CalendarVC.swift
//  Classis
//
//  Created by Ivee Mendes Marins on 3/30/15.
//  Copyright (c) 2015 Alena Miklos. All rights reserved.
//

import UIKit

import QuartzCore

class CalendarVC: UIViewController {

    // Variáveis ​​membro do conjunto ( para armazenamento array)
    var count: Int!
    var mArray: NSMutableArray!
    
    // Variáveis ​​membro do conjunto ( para o calendário )
    var now: NSDate!
    var year: Int!
    var month: Int!
    var day: Int!
    var maxDay: Int!
    var dayOfWeek: Int!
    
    // Variáveis ​​membro de ajuste ( para passar as obtidas com a função de calendário )
    var comps: NSDateComponents!
    
    // Conjunto de variáveis ​​de membro ( cor do calendário de fundo)
    var calendarBackGroundColor: UIColor!
    
    // Especifica a propriedade
    @IBOutlet var calendarBar: UILabel!
    @IBOutlet var prevMonthButton: UIButton!
    @IBOutlet var nextMonthButton: UIButton!
    @IBOutlet var newEventButton: UIButton!
    
    // Posicionando variável de membro do calendário
    var calendarLabelIntervalX: Int!
    var calendarLabelX: Int!
    var calendarLabelY: Int!
    var calendarLabelWidth: Int!
    var calendarLabelHeight: Int!
    var calendarLableFontSize: Int!
    
    var buttonRadius: Float!
    
    var calendarIntervalX: Int!
    var calendarX: Int!
    var calendarIntervalY: Int!
    var calendarY: Int!
    var calendarSize: Int!
    var calendarFontSize: Int!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // resolver cor
        self.navigationController?.navigationBar.barTintColor = UIColor(rgba: "#234a80")
        
        // Obter o dispositivo atualmente em execução ( largura e altura da tela)
        let screenWidth  = DeviseSize.screenWidth()
        let screenHeight = DeviseSize.screenHeight()
        
        //iPhone4s
        if(screenWidth == 320 && screenHeight == 480){
            
            calendarLabelIntervalX = 5;
            calendarLabelX         = 45;
            calendarLabelY         = 93;
            calendarLabelWidth     = 40;
            calendarLabelHeight    = 25;
            calendarLableFontSize  = 14;
            
            buttonRadius           = 20.0
            
            calendarIntervalX      = 5;
            calendarX              = 45;
            calendarIntervalY      = 120;
            calendarY              = 45;
            calendarSize           = 40;
            calendarFontSize       = 17;
            
            self.prevMonthButton.frame = CGRectMake(15, 438, CGFloat(calendarSize), CGFloat(calendarSize));
            self.nextMonthButton.frame = CGRectMake(314, 438, CGFloat(calendarSize), CGFloat(calendarSize));
            
            //iPhone5 e 5s
        }else if (screenWidth == 320 && screenHeight == 568){
            
            calendarLabelIntervalX = 5;
            calendarLabelX         = 45;
            calendarLabelY         = 93;
            calendarLabelWidth     = 40;
            calendarLabelHeight    = 25;
            calendarLableFontSize  = 14;
            
            buttonRadius           = 20.0;
            
            calendarIntervalX      = 5;
            calendarX              = 45;
            calendarIntervalY      = 120;
            calendarY              = 45;
            calendarSize           = 40;
            calendarFontSize       = 17;
            
            //iPhone6
        }else if (screenWidth == 375 && screenHeight == 667){
            
            calendarLabelIntervalX = 15;
            calendarLabelX         = 50;
            calendarLabelY         = 95;
            calendarLabelWidth     = 45;
            calendarLabelHeight    = 25;
            calendarLableFontSize  = 16;
            
            buttonRadius           = 22.5;
            
            calendarIntervalX      = 15;
            calendarX              = 50;
            calendarIntervalY      = 125;
            calendarY              = 50;
            calendarSize           = 45;
            calendarFontSize       = 19;
            
            self.prevMonthButton.frame = CGRectMake(15, 438, CGFloat(calendarSize), CGFloat(calendarSize));
            self.nextMonthButton.frame = CGRectMake(314, 438, CGFloat(calendarSize), CGFloat(calendarSize));
            
            //iPhone6 plus
        }else if (screenWidth == 414 && screenHeight == 736){
            
            calendarLabelIntervalX = 15;
            calendarLabelX         = 55;
            calendarLabelY         = 95;
            calendarLabelWidth     = 55;
            calendarLabelHeight    = 25;
            calendarLableFontSize  = 18;
            
            buttonRadius = 25
            
            calendarIntervalX      = 18;
            calendarX              = 55;
            calendarIntervalY      = 125;
            calendarY              = 55;
            calendarSize           = 50;
            calendarFontSize       = 21;
            
            self.prevMonthButton.frame = CGRectMake(18, 468, CGFloat(calendarSize), CGFloat(calendarSize));
            self.nextMonthButton.frame = CGRectMake(348, 468, CGFloat(calendarSize), CGFloat(calendarSize));
        }
        
        // Botão com cantos arredondados
        prevMonthButton.layer.cornerRadius = CGFloat(buttonRadius)
        nextMonthButton.layer.cornerRadius = CGFloat(buttonRadius)
        newEventButton.layer.cornerRadius = CGFloat(buttonRadius*0.75)
        
        // Obtendo a data atual
        now = NSDate()
        
        //inUnit : nas unidades especificadas (mês) em , rangeOfUnit : unidades indicadas no (dia ) Faixa de que pode ser tomada
        var calendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        //Maior unidade mês, menor unidade ano
        var range: NSRange = calendar.rangeOfUnit(NSCalendarUnit.CalendarUnitDay, inUnit:NSCalendarUnit.CalendarUnitMonth, forDate:now)
        
        //Receba as informações de data atual para armazenar na primeira variável de membro
        comps = calendar.components(NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitDay|NSCalendarUnit.CalendarUnitWeekday,fromDate:now)
        
        //Obter a data e data final e dia da semana (não obrigatório elenco do NSInteger para int )
        //otimizar o código a baixo
        var orgYear: NSInteger      = comps.year
        var orgMonth: NSInteger     = comps.month
        var orgDay: NSInteger       = comps.day
        var orgDayOfWeek: NSInteger = comps.weekday
        var max: NSInteger          = range.length
        
        year      = orgYear
        month     = orgMonth
        day       = orgDay
        dayOfWeek = orgDayOfWeek
        maxDay    = max
        
        //Para criar uma matriz vazia (para armazenamento de dados de calendário)
        mArray = NSMutableArray()
        
        //Dia da definição inicial rótulo semana
        var weekDaysName:[String] = ["Dom","Seg","Ter","Qua","Qui","Sex","Sab"]
        
        //Dinamicamente colocar o dia da semana etiqueta
        setupCalendarLabel(weekDaysName)
        
        //Configurando a exibição inicial do calendário
        setupCurrentCalendar()
    }
    
    //Função de posicionamento dinâmico do dia da semana etiqueta
    func setupCalendarLabel(weekDays: NSArray) {
        
        var calendarDaysCount = 7
        
        for i in 0...6{
            
            //Criando uma etiqueta
            var calendarBaseLabel: UILabel = UILabel()
            
            // Converte o valor de X coordena a definição do tipo de CGFloat
            calendarBaseLabel.frame = CGRectMake(
                CGFloat(calendarLabelIntervalX + calendarLabelX * (i % calendarDaysCount)),
                CGFloat(calendarLabelY),
                CGFloat(calendarLabelWidth),
                CGFloat(calendarLabelHeight)
            )
            
            //Setando as cores cabeçalho do calendário
            if(i == 0 || i==6){
                calendarBaseLabel.textColor = UIColor(
                    red: CGFloat(0.137), green: CGFloat(0.290), blue: CGFloat(0.501), alpha: CGFloat(1.0)
                )
            }else{
                calendarBaseLabel.textColor = UIColor(
                    red: CGFloat(0.529), green: CGFloat(0.403), blue: CGFloat(0.513), alpha: CGFloat(1.0)
                )
                
            }
            
            //A colocação do rótulo de dia
            calendarBaseLabel.text = String(weekDays[i] as NSString)
            calendarBaseLabel.textAlignment = NSTextAlignment.Center
            calendarBaseLabel.font = UIFont(name: "System", size: CGFloat(calendarLableFontSize))
            self.view.addSubview(calendarBaseLabel)
        }
    }
    
    // Gerando funçao Calendário
    func generateCalendar(){
        
        //Definição do número de etiqueta e contagem total
        var tagNumber = 1
        var total     = 42
        
        for i in 0...41{
            
            // Posicionando as células
            var positionX   = calendarIntervalX + calendarX * (i % 7)
            var positionY   = calendarIntervalY + calendarY * (i / 7)
            var buttonSizeX = calendarSize;
            var buttonSizeY = calendarSize;
            
            // Fazendo botão
            var button: UIButton = UIButton()
            button.frame = CGRectMake(
                CGFloat(positionX),
                CGFloat(positionY),
                CGFloat(buttonSizeX),
                CGFloat(buttonSizeY)
            );
            
            //Definindo o botão inicial
            if(i < dayOfWeek - 1){
                
                //Botões antes do primeiro dia do mês começar
                button.setTitle("", forState: .Normal)
                button.enabled = false
                button.alpha = 0.2
                
            }else if(i == dayOfWeek - 1 || i < dayOfWeek + maxDay - 1){
                
                //Parte do início da data para definir a etiqueta do botão ( data )
                button.setTitle(String(tagNumber), forState: .Normal)
                button.tag = tagNumber
                tagNumber++
                //Chamada da função que busca evento
                
            }else if(i == dayOfWeek + maxDay - 1 || i < total){
                
                //Botões depois do ultimo dia do mês
                button.setTitle("", forState: .Normal)
                button.enabled = false
                button.alpha = 0.0
            }
            
            //Definir o esquema de cores do botão
            if(i % 7 == 0 || i % 7 == 6){
                calendarBackGroundColor = UIColor(
                    red: CGFloat(0.372), green: CGFloat(0.360), blue: CGFloat(0.509), alpha: CGFloat(1.0)
                )
            }else{
                calendarBackGroundColor = UIColor(
                    red: CGFloat(0.529), green: CGFloat(0.403), blue: CGFloat(0.513), alpha: CGFloat(1.0)
                )
            }
            
            //Setando o botão
            button.backgroundColor = calendarBackGroundColor
            button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            button.titleLabel!.font = UIFont(name: "System", size: CGFloat(calendarFontSize))
            button.layer.cornerRadius = CGFloat(buttonRadius)
            
            //Defina a ação do botão
            button.addTarget(self, action: "buttonTapped:", forControlEvents: .TouchUpInside)
            
            //Colocando o calendário na tela
            self.view.addSubview(button)
            mArray.addObject(button)
        }
        
    }
    
    //título do calendário
    func setupCalendarTitleLabel() {
        calendarBar.text = String("\(day)/\(month)/\(year)")
    }
    
    //Função corrente para recuperar os dados correspondentes para os anos de ( no momento da exibição inicial )
    func setupCurrentCalendarData() {
        
        /*************
        * ( Ponto importante)
        * Uma vez que determinar a posição que começa o calendário usando o dia do mês diaDaSemana corrente ( o valor do dia ) ,
        * Eu quero criar um dado de ano aaaa mm mês um dia.
        * Mais tarde da função setupPrevCalendarData , setupNextCalendarData é semelhante.
        *************/
        var currentCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        var currentComps: NSDateComponents = NSDateComponents()
        
        currentComps.year  = year
        currentComps.month = month
        currentComps.day   = 1
        
        var currentDate: NSDate = currentCalendar.dateFromComponents(currentComps)!
        recreateCalendarParameter(currentCalendar, currentDate: currentDate)
    }
    
    // Função para obter os dados correspondentes aos anos antes
    func setupPrevCalendarData() {
        
        //Para o mês atual
        if(month == 0){
            year = year - 1;
            month = 12;
        }else{
            month = month - 1;
        }
        
        //setupCurrentCalendarData()
        var prevCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        var prevComps: NSDateComponents = NSDateComponents()
        
        prevComps.year  = year
        prevComps.month = month
        prevComps.day   = 1
        
        var prevDate: NSDate = prevCalendar.dateFromComponents(prevComps)!
        recreateCalendarParameter(prevCalendar, currentDate: prevDate)
    }
    
    //次の年月に該当するデータを取得する関数
    func setupNextCalendarData() {
        
        //現在の月に対して+1をする
        if(month == 12){
            year = year + 1;
            month = 1;
        }else{
            month = month + 1;
        }
        
        //setupCurrentCalendarData()と同様の処理を行う
        var nextCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        var nextComps: NSDateComponents = NSDateComponents()
        
        nextComps.year  = year
        nextComps.month = month
        nextComps.day   = 1
        
        var nextDate: NSDate = nextCalendar.dateFromComponents(nextComps)!
        recreateCalendarParameter(nextCalendar, currentDate: nextDate)
    }
    
    //Função para recriar os parâmetros do calendário
    func recreateCalendarParameter(currentCalendar: NSCalendar, currentDate: NSDate) {
        
        //Recebo a data das informações sobre a base do que foi passado no argumento
        var currentRange: NSRange = currentCalendar.rangeOfUnit(NSCalendarUnit.CalendarUnitDay, inUnit:NSCalendarUnit.CalendarUnitMonth, forDate:currentDate)
        
        comps = currentCalendar.components(NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitDay|NSCalendarUnit.CalendarUnitWeekday,fromDate:currentDate)
        
        //Obter a data e data final e dia da semana (não obrigatório elenco do NSInteger para int )
        var currentYear: NSInteger      = comps.year
        var currentMonth: NSInteger     = comps.month
        var currentDay: NSInteger       = comps.day
        var currentDayOfWeek: NSInteger = comps.weekday
        var currentMax: NSInteger       = currentRange.length
        
        year      = currentYear
        month     = currentMonth
        day       = currentDay
        dayOfWeek = currentDayOfWeek
        maxDay    = currentMax
    }
    
    // Função para excluir o objeto botão exibido
    func removeCalendarButtonObject() {
        
        //Eu quero remover o objeto de botão de vista
        for i in 0..<mArray.count {
            mArray[i].removeFromSuperview()
        }
        
        //Além disso, exclua botão objecto que foi armazenado na matriz
        mArray.removeAllObjects()
    }
    
    //Função para configurar o calendário atual
    func setupCurrentCalendar() {
        
        setupCurrentCalendarData()
        generateCalendar()
        setupCalendarTitleLabel()
        
        println("Calendário foi exibido!")
    }
    
    // Ação quando você pressiona o botão do mês anterior
    @IBAction func getPrevMonthData(sender: UIButton) {
        
        removeCalendarButtonObject()
        setupPrevCalendarData()
        generateCalendar()
        setupCalendarTitleLabel()
        
        println("Botão no mês anterior foi pressionado!")
    }
    
    // Ação quando você pressiona o botão do mês seguinte
    @IBAction func getNextMonthData(sender: UIButton) {
        
        removeCalendarButtonObject()
        setupNextCalendarData()
        generateCalendar()
        setupCalendarTitleLabel()
        
        println("Botão do próximo mês foi pressionado!")
    }
    
    // Ação dos botões do calendário
    func buttonTapped(button: UIButton){
        // acão quando pressionamos o botão
        
        //fazer a condição para quando não há eventos
        var alertController = UIAlertController(title: "Não há eventos", message: "Desejar criar?", preferredStyle: .Alert)
        
        // Create the actions
        var okAction = UIAlertAction(title: "Sim", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            
            var vc = self.storyboard?.instantiateViewControllerWithIdentifier("eventCreate") as EventCreationVC
           // vc.dataHoraE
            self.presentViewController(vc, animated: true, completion: nil)
            NSLog("OK Pressed")
        }
        var cancelAction = UIAlertAction(title: "Não", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.presentViewController(alertController, animated: true, completion: nil)
        println("\(year)/\(month)/\(button.tag)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
