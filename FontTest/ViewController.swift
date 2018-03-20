//
//  ViewController.swift
//  FontTest
//
//  Created by Myeong chul Kim on 2018. 1. 30..
//  Copyright © 2018년 Myeong chul Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var txtInputText: UITextField!
    @IBOutlet weak var txtInputSize: UITextField!
    @IBOutlet weak var txtInputStyle: UITextField!
    
    @IBOutlet weak var btnShowResult: UIButton!
    
    var btnToolbarDone : UIBarButtonItem?
    var pickerFontStyle : UIPickerView? = nil
    
    let arrFontStyle = ["UltraLight", "Thin", "Light", "Regular", "Medium", "SemiBold", "Bold", "Heavy", "Black"]
    
    lazy var inputToolbar: UIToolbar = {
        var toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        
        var doneButton = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(self.inputToolbarDonePressed))
        
        
        var flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        var fixedSpaceButton = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        
        toolbar.setItems([flexibleSpaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        return toolbar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btnShowResult.layer.borderColor = UIColor.lightGray.cgColor
        btnShowResult.layer.borderWidth = 1.0
        btnShowResult.addTarget(self, action: #selector(self.setFontValues), for: .touchUpInside)
        
        // Text
        self.txtInputText.delegate = self
        self.txtInputText.autocorrectionType = .no
        self.txtInputText.autocapitalizationType = .none
        self.txtInputText.inputAccessoryView = self.inputToolbar
        
        // Size
        self.txtInputSize.delegate = self
        self.txtInputSize.keyboardType = .numberPad
        self.txtInputSize.inputAccessoryView = self.inputToolbar
        
        // Style
        self.pickerFontStyle = UIPickerView(frame: CGRect(x:0, y:200, width: self.view.frame.width, height:300))
        self.pickerFontStyle?.backgroundColor = UIColor.white
        self.pickerFontStyle?.showsSelectionIndicator = true
        self.pickerFontStyle?.translatesAutoresizingMaskIntoConstraints = false
        
        self.txtInputStyle.delegate = self
        self.pickerFontStyle?.delegate = self
        self.pickerFontStyle?.dataSource = self
        
        let toolBar1 = UIToolbar()
        toolBar1.barStyle = UIBarStyle.default
        toolBar1.isTranslucent = true
        toolBar1.tintColor = UIColor(hex: "ff8a00")
        toolBar1.sizeToFit()
        
        self.btnToolbarDone = UIBarButtonItem(title: "선택", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.doneContractPicker))
        let spaceButton1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton1 = UIBarButtonItem(title: "취소", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelContractPicker))
        
        toolBar1.setItems([cancelButton1, spaceButton1, self.btnToolbarDone!], animated: false)
        toolBar1.isUserInteractionEnabled = true
        
        txtInputStyle.inputAccessoryView = toolBar1
        txtInputStyle.inputView = pickerFontStyle
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrFontStyle.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrFontStyle[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.black
        pickerLabel.numberOfLines = 0
        
        pickerLabel.text = self.arrFontStyle[row]
        pickerLabel.textAlignment = NSTextAlignment.center
        pickerLabel.sizeToFit()
        
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 48.0
    }
    
    func textFieldDidBeginEditing(_ textFieldUser: UITextField) {
        if textFieldUser == txtInputText {
        
        } else if textFieldUser == txtInputSize {
        
        } else if textFieldUser == txtInputStyle {
            txtInputStyle.becomeFirstResponder()
        }
        
        
        textFieldUser.layer.zPosition = 10 // .bringSubview(toFront: textFieldUser)
        textFieldUser.layer.borderColor = UIColor(hex:"#454648").cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func openContractPicker() {
        txtInputStyle.becomeFirstResponder()
    }
    
    @objc func doneContractPicker() {
        let index:Int = (pickerFontStyle!.selectedRow(inComponent: 0))
        GlobalData.sharedInstance.iStyleIndex = index
        self.txtInputStyle.text = arrFontStyle[index]
        
        self.view.endEditing(true)
    }
    
    @objc func cancelContractPicker() {
        self.view.endEditing(true)
    }

    @objc func inputToolbarDonePressed() {
        view.endEditing(true)
    }
    
    @objc func setFontValues() {
        print("Set!!!")
        GlobalData.sharedInstance.fFontSize = CGFloat(Int(self.txtInputSize.text ?? "0")!)
        GlobalData.sharedInstance.strInputText = self.txtInputText.text
    }
}

