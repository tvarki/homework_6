//
//  ViewController.swift
//  Homework_6
//
//  Created by Дмитрий Яковлев on 07.11.2019.
//  Copyright © 2019 Дмитрий Яковлев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tvLastName = TestView()
    var tvName = TestView()
    var tvPatronymic = TestView()
    var tvSerial = TestView()
    
    var isValid: Bool {
        return checkErrors(item: tvLastName) && checkErrors(item: tvName) && checkErrors(item: tvPatronymic) && checkErrors(item: tvSerial)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvLastName = TestView(frame: CGRect(x: 25,y: 70,width: 400,height: 68),action: testLastName)
        tvLastName.setPlaceHolder(ph: "Введите Фамилию")
        view.addSubview(tvLastName)
        
        tvName = TestView(frame: CGRect(x: 25,y: 145,width: 400,height: 68),action: testFirstName)
        tvName.setPlaceHolder(ph: "Введите Имя")
        view.addSubview(tvName)
        
        tvPatronymic = TestView(frame: CGRect(x: 25,y: 220,width: 400,height: 68),action: testPatronymic)
        tvPatronymic.setPlaceHolder(ph: "Введите Отчество")
        view.addSubview(tvPatronymic)
        
        tvSerial = TestView(frame: CGRect(x: 25,y: 295,width: 400,height: 68),action: testSerial)
        tvSerial.setPlaceHolder(ph: "Введите серию и номер паспорта")
        tvSerial.setInputType(inputType: UIKeyboardType.numberPad)
        tvSerial.setMaskTextField(msk: "XXXX XXXXXX")
        view.addSubview(tvSerial)
        
        
         
         let readyButton  = UIButton(frame: CGRect(x: 0,y: 370,width: 400,height: 68))
         readyButton.setTitle("Проверить", for: .normal )
         readyButton.setTitleColor(UIColor.blue, for: .normal)

         view.addSubview(readyButton)
         readyButton.addTarget(self, action: #selector(checkClicked), for: .touchDown)

         
        
    }
    
    @objc private func checkClicked(){
          if isValid{
              let tmp = "Фамилия: \(tvLastName.getValue()) \nИмя: \(tvName.getValue()) \nОтчество: \(tvPatronymic.getValue()) \nНомер Серия: \(tvSerial.getValue()) \n "
              print(tmp)
              makeAlert(title: "Данные прошли", text: tmp)
          }
       }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func checkErrors(item: TestView)->Bool{
        guard item.getErrors() == "" else{
            makeAlert(title: "Внимание", text: item.getErrors())
            return false;
        }
        return true;
    }
    
    func makeAlert(title: String , text: String){
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    //Ограничения только для примера зачем песня пелась
    
    func testLastName(txtInput : String)->String {
        guard txtInput.count != 0 else{ return "Поле Фамилия не заполнено"}
        guard txtInput.count > 3 else{ return "Длинна Фамилии должна быть больше 3 символов"}
        guard txtInput.count < 9 else{ return "Длинна Фамилии должна быть меньше 9 символов"}
        guard !txtInput.contains(" ") else {return "Фамилия не должна состоять из нескольких слов"}
        return ""
    }
    
    func testFirstName(txtInput : String)->String {
        guard txtInput.count != 0 else{ return "Поле Имя не заполнено"}
        guard txtInput.count > 3 else{ return "Длинна Имени должна быть больше 3 символов"}
        guard txtInput.count < 9 else{ return "Длинна Имени должна быть меньше 9 символов"}
        guard !txtInput.contains(" ") else {return "Имя не должно состоять из нескольких слов"}
        return ""
    }
    
    func testPatronymic(txtInput : String)->String {
        guard txtInput.count != 0 else{ return "Поле Отчество не заполнено"}
        guard txtInput.count > 3 else{ return "Длинна Отчества должна быть больше 3 символов"}
        guard txtInput.count < 9 else{ return "Длинна Отчества должна быть меньше 9 символов"}
        guard !txtInput.contains(" ") else {return "Отчество не должно состоять из нескольких слов"}
        return ""
    }
    
    func testSerial(txtInput : String)->String {
        guard txtInput.count != 0 else{ return "Поле Номер Серия не заполнено"}
        guard txtInput.count >= 11 else{ return "Серия и Номер введены неполностью"}
        return ""
    }
    
    
    
}

