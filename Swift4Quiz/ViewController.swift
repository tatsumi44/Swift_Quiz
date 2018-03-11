//
//  ViewController.swift
//  Swift4Quiz
//
//  Created by tatsumi kentaro on 2018/02/05.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import Instructions
class ViewController: UIViewController,CoachMarksControllerDataSource,CoachMarksControllerDelegate  {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var startButton: UIButton!
    let coachMarksController = CoachMarksController()
    let coachMarksController1 = CoachMarksController()
    let pointOfInterest = UIView()
    let pointOfInterest1 = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coachMarksController.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.coachMarksController.start(on: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.coachMarksController.stop(immediately: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: CoachMark) -> (bodyView: CoachMarkBodyView, arrowView: CoachMarkArrowView?) {
        
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(withArrow: true, arrowOrientation: coachMark.arrowOrientation)
        
        coachViews.bodyView.hintLabel.text = "これは説明文だよ！！！！！！！！"
        coachViews.bodyView.nextLabel.text = "Ok!"
        let coachViews1 = coachMarksController.helper.makeDefaultCoachViews(withArrow: true, arrowOrientation: coachMark.arrowOrientation)
        coachViews1.bodyView.hintLabel.text = "個々のボタンを押してゲームを始めよう。君の冒険を待っているよ"
        coachViews1.bodyView.nextLabel.text = "Ok!"
        let coachArray = [coachViews,coachViews1]
        return (bodyView: coachArray[index].bodyView, arrowView: coachArray[index].arrowView)
        
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkAt index: Int) -> CoachMark {
        pointOfInterest.frame = CGRect(x: textView.frame.origin.x, y: textView.frame.origin.y, width: textView.frame.width, height: textView.frame.height)
        pointOfInterest1.frame = CGRect(x: startButton.frame.origin.x, y: startButton.frame.origin.y, width: startButton.frame.width, height: startButton.frame.height)
        
        let posArray = [pointOfInterest,pointOfInterest1]
        return coachMarksController.helper.makeCoachMark(for:posArray[index])
    }
    
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 2
    }
    
    
}

