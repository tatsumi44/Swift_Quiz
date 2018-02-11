//
//  QuizViewController.swift
//  Swift4Quiz
//
//  Created by tatsumi kentaro on 2018/02/05.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet var textView:UITextView!
    @IBOutlet var button1:UIButton!
    @IBOutlet var button2:UIButton!
    @IBOutlet var button3:UIButton!
    
    var quizArray = [Any]()
    
    
    //正解数
    var currentAnswer:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [Any]()
        
        tmpArray.append(["問題文1","正解","選択肢2","選択肢3",1])
        tmpArray.append(["問題文2","選択肢1","正解","選択肢3",2])
        tmpArray.append(["問題文3","選択肢1","選択肢2","正解",3])
        tmpArray.append(["問題文4","正解","選択肢2","選択肢3",1])
        tmpArray.append(["問題文5","選択肢1","正解","選択肢3",2])
        tmpArray.append(["問題文6","選択肢1","選択肢2","正解",3])
        tmpArray.append(["問題文7","正解","選択肢2","選択肢3",1])
        
        //配列をランダムに設定
        while (tmpArray.count>0){
            let Index = Int(arc4random()) % tmpArray.count
            quizArray.append(tmpArray[Index])
            tmpArray.remove(at: Index)
            
        }
        choiceQuiz()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func choiceQuiz() {
        let tmpArray = quizArray[0] as! [Any]
        textView.text = tmpArray[0] as! String
        
        button1.setTitle(tmpArray[1] as? String, for: .normal)
        button2.setTitle(tmpArray[2] as? String, for: .normal)
        button3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag{
            currentAnswer += 1
//            let alert:UIAlertController = UIAlertController(title: "正解", message: "いいかんじ", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(alert, animated: true, completion: nil)
            
        }
        quizArray.remove(at: 0)
        
        if quizArray.count == 0{
            print("正解数\(currentAnswer)問題数\(quizArray.count)")
            performSegueToresult()
            
            
        }else{
            choiceQuiz()
            print("正解数\(currentAnswer)問題数\(quizArray.count)")
            
        }
    }
    
    func performSegueToresult() {
        performSegue(withIdentifier: "toResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult"{
            let resultViewContoroller = segue.destination as! ResultViewController
            resultViewContoroller.num = self.currentAnswer
            
        }
    }
    

}
