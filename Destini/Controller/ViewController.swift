//
//  ViewController.swift
//  Destini
//
//  Created by Michael Jay Abalos on 04/10/2017.
//  Copyright © 2017 Michael Jay Abalos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topButton: RoundedButton!
    @IBOutlet weak var bottomButton: RoundedButton!
    @IBOutlet weak var textView: UITextView!
    
    var storyFlow = 0
    var storyArray:[Story] = [Story.init(storyText: story1.story, answerAText: story1.answerA, answerBText: story1.answerB), // story 1
                              Story.init(storyText: story2.story, answerAText: story2.answerA, answerBText: story2.answerB), // story 2
                              Story.init(storyText: story3.story, answerAText: story3.answerA, answerBText: story3.answerB), // story 3
                              Story.init(storyText: story4.story, answerAText: story4.answerA, answerBText: story4.answerB), // story 4
                              Story.init(storyText: story5.story, answerAText: story5.answerA, answerBText: story5.answerB), // story 5
                              Story.init(storyText: story6.story, answerAText: story6.answerA, answerBText: story6.answerB)] // story 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadStory(storyNum: storyArray[storyFlow])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(sender: UIButton){
        
        if sender.tag == 1{
            //answer A
            updateA()
            
        }else{
            //answer B
            updateB()
        }
        
    }
    
    func updateA() {
        
        if storyFlow == 0{
            storyFlow = 2
            loadStory(storyNum: storyArray[storyFlow])
        }
        
        else if storyFlow == 2{
            storyFlow = 5
            loadStory(storyNum: storyArray[storyFlow])
        }
        
        else if storyFlow == 1{
            storyFlow = 2
            loadStory(storyNum: storyArray[storyFlow])
        }
        
    }
    func updateB() {
        
        if storyFlow == 0{
            storyFlow = 1
            loadStory(storyNum: storyArray[storyFlow])
        }
        
        else if storyFlow == 1{
            storyFlow = 3
            loadStory(storyNum: storyArray[storyFlow])
        }
        
        else if storyFlow == 2{
            storyFlow = 4
            loadStory(storyNum: storyArray[storyFlow])
        }
        
    }
    
    func loadStory(storyNum:Story) {
        
        print("load story \(storyFlow)")
        print("answer A = \(storyNum.answerA)")
        
        textView.text = storyNum.story
        
        if storyNum.answerA != "" {
            
            topButton.answerLabel(answer: storyNum.answerA)
            bottomButton.answerLabel(answer: storyNum.answerB)
        }else{
            topButton.isHidden = true
            bottomButton.isHidden = true
            
            let alertView = UIAlertController.init(title: "End", message: "Restart Destiny?", preferredStyle: .actionSheet)
            let alertAction = UIAlertAction.init(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.restart()
            })
            alertView.addAction(alertAction)
            present(alertView, animated: true, completion: nil)
        }
        
        
    }
    
    func restart(){
        storyFlow = 0
        loadStory(storyNum: storyArray[storyFlow])
        topButton.isHidden = false
        bottomButton.isHidden = false
    }
}

