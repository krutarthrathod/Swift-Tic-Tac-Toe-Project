//
//  Krutarth_GameModel.swift
//  Krutarthkumar_Rathod_Orange_TicTacToe
//
//  Created by Krutarthkumar Rathod on 2019-10-09.
//  Copyright © 2019 Krutarthkumar Rathod. All rights reserved.
//

import Foundation

class Krutarth_GameModel{
    var whoseTurn = "X"
        var numberOfMovesPlayed = 0
        var lastPlayed = ""
        var whoWon = ""
        var isPastGame = false
        
        var squareContents = Array(repeating: "", count: 10)
        
        var orderOfMoves = [Int]()
        
        let winningcombinations = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]]
        
        func playMove(tag: Int){
            orderOfMoves.append(tag)
            
            squareContents[tag] = whoseTurn
            lastPlayed = whoseTurn
            
            if(whoseTurn == "X"){
                whoseTurn = "O"
            } else {
                whoseTurn = "X"
            }
            
            numberOfMovesPlayed+=1
        }
        
        func IsGameFinished()-> Bool{
            if(numberOfMovesPlayed < 5){
                return false
            }
             
            for winningCombo in winningcombinations {
                let index1 = winningCombo[0]
                let index2 = winningCombo[1]
                let index3 = winningCombo[2]
                
                if(squareContents[index1] == lastPlayed && squareContents[index2] == lastPlayed && squareContents[index3] == lastPlayed){
                    whoWon = lastPlayed
                    saveGame()
                    return true
                }
            }
            
             if(numberOfMovesPlayed == 9){
                saveGame()
                return true
            }
            
            return false
            
        }
        
        func saveGame(){
            
            if(isPastGame){
                return
            }
            
            var numberOfGamesPlayed = UserDefaults.standard.integer(forKey:Constants.NUM_GAMES)
            
            numberOfGamesPlayed+=1
            
            UserDefaults.standard.set(numberOfGamesPlayed, forKey: Constants.NUM_GAMES)
            UserDefaults.standard.set(whoWon, forKey: Constants.WHO_WON + String(numberOfGamesPlayed))
            
            let date = Date()
            
            UserDefaults.standard.set(date, forKey: Constants.DATE_TIME + String(numberOfGamesPlayed))
            
            UserDefaults.standard.set(orderOfMoves, forKey: Constants.ORDER_OF_MOVES + String(numberOfGamesPlayed))
            
            print("game saved!!!")
            
        }
    }

