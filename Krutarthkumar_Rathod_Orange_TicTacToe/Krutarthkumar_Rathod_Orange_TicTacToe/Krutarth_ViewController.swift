//
//  Krutarth_ViewController.swift
//  Krutarthkumar_Rathod_Orange_TicTacToe
//
//  Created by Krutarthkumar Rathod on 2019-10-09.
//  Copyright © 2019 Krutarthkumar Rathod. All rights reserved.
//

import UIKit

class Krutarth_ViewController: UIViewController {
    
   //MARK:- Class variables
    var theGameModel = Krutarth_GameModel()
    var gameFinished = false
    
    var replayingPastGame = false
    var pastGameData : GameData?
    
    //Mark: Outlets
    @IBOutlet weak var gameStateLabel: UILabel!
    
    
    

     override func viewDidLoad() {
           super.viewDidLoad()
           
           gameStateLabel.text = theGameModel.whoseTurn + "'s turn!"
           
           if(replayingPastGame){
               
               theGameModel.isPastGame = true
               
               navigationItem.title = "Past Game"
               //show past game
               let pastGameMoves = (pastGameData?.orderOfMoves)!
               var delay : Double = Double(0)
               
               for i in pastGameMoves{
                   delay = delay + 1.0
                   
                   DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                   
                       let button = self.view.viewWithTag(i)
                       self.squareTouched(button as! UIButton)
                    })
                }
               
           }else{
               
           }
           // Do any additional setup after loading the view.
       }
    
    //Mark: Actions
    
    @IBAction func squareTouched(_ sender: UIButton) {
        print(sender.tag,"Number Button has Touched")
        
        if(sender.currentTitle == "X" || sender.currentTitle == "O" || gameFinished){
                    //do nothing
                }else {
                sender.setTitle(theGameModel.whoseTurn, for: .normal);
                theGameModel.playMove(tag: sender.tag)
                    
                    //check if the game is finished
                    gameFinished = theGameModel.IsGameFinished()
                    
                    if(gameFinished){
                        
                        let whoWon = theGameModel.whoWon
                        
                        if(whoWon == ""){
                            gameStateLabel.text = "Its a Draw!!"
                        } else {
                            gameStateLabel.text = whoWon + " Won!!"
                        }
                    }
                        
                        else{
                            gameStateLabel.text = theGameModel.whoseTurn + "'s turn!"
                            }
                }
            }
            
            
            
            
            
            
            /*
            // MARK: - Navigation

            // In a storyboard-based application, you will often want to do a little preparation before navigation
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                // Get the new view controller using segue.destination.
                // Pass the selected object to the new view controller.
            }
            */

        }

