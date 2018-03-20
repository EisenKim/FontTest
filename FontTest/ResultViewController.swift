//
//  ResultViewController.swift
//  FontTest
//
//  Created by Myeong chul Kim on 2018. 1. 30..
//  Copyright © 2018년 Myeong chul Kim. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    
    var fSize : CGFloat = 0.0
    let arrFontWeight = [UIFont.Weight.ultraLight,
                         UIFont.Weight.thin,
                         UIFont.Weight.light,
                         UIFont.Weight.regular,
                         UIFont.Weight.medium,
                         UIFont.Weight.semibold,
                         UIFont.Weight.bold,
                         UIFont.Weight.heavy,
                         UIFont.Weight.black]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let index : Int = GlobalData.sharedInstance.iStyleIndex
        self.fSize = GlobalData.sharedInstance.fFontSize
        
        self.lblResult.text = GlobalData.sharedInstance.strInputText
        self.lblResult.font = UIFont.systemFont(ofSize: fSize, weight: arrFontWeight[index])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
