//
//  ViewController.swift
//  Min-Max
//
//  Created by Alex Lopez on 2/10/17.
//  Copyright © 2017 Alex Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var play: UIButton!
    
    @IBOutlet weak var alert: UILabel!
    
    @IBOutlet weak var points: UILabel!
    
    @IBOutlet weak var tittle: UILabel!
    
    @IBOutlet weak var lable: UILabel!
    
    var result:[Int] = []
    var resultOrdenado:[Int] = []
    var buttons:[UIButton] = []
    var puntos = 0
    var timer = Timer()
    var timeLeft = 40
    var counter = 0
    var isRunning = false
    var cont = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [button1,button2,button3,button4,button5,button6]
        buttonsHiddenTrue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func rand(){
        resetArrays()
        cont = 0
        for button in buttons{
            result.append(Int(arc4random_uniform(201))-100)
            button.setTitle(String(result[cont]), for: .normal)
            cont = cont + 1
        }
        resultOrdenado = result.sorted();
    }
    
    @IBAction func play(_ sender: Any) {
        timeLeft = 40
        puntos = 0;
        play.isHidden = true
        tittle.isHidden = true
        buttonsHiddenFalse()
        alert.text = ""
        points.text = "Score: " + String(puntos)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        lable.text = "\(counter)"
    }
    
    
    @IBAction func JustButton(_ sender: UIButton) {
            if sender.currentTitle == String(resultOrdenado[0]){
                sender.isHidden = true
                resultOrdenado.remove(at: 0)
                count()
                puntos = puntos + 1
                points.text = "Score: " + String(puntos)
            }else{
               gameOver()
            }
    }
    
    func count(){
        if resultOrdenado.isEmpty {
            buttonsHiddenFalse()
        }
    }
    
    func gameOver(){
        alert.text = "Game Over"
        buttonsHiddenTrue()
        play.isHidden = false
        timer.invalidate()
    }
    
    @objc func updateTimer(){
        timeLeft -= 1
        lable.text = "\(timeLeft)s"
        if timeLeft == 0 {
            timer.invalidate()
            lable.text = "..."
            gameOver()
        }
    }
    
    func resetArrays(){
        result.removeAll()
        resultOrdenado.removeAll()
    }
    
    func buttonsHiddenFalse(){
        rand()
        for button in buttons{
        button.isHidden = false
        }
    }
    
    func buttonsHiddenTrue(){
        for button in buttons{
            button.isHidden = true
        }
    }
}

