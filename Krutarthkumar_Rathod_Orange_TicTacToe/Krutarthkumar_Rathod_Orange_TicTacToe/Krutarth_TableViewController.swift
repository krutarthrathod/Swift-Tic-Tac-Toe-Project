//
//  Krutarth_TableViewController.swift
//  Krutarthkumar_Rathod_Orange_TicTacToe
//
//  Created by Krutarthkumar Rathod on 2019-09-25.
//  Copyright © 2019 Krutarthkumar Rathod. All rights reserved.
//

import UIKit

class Krutarth_TableViewController: UITableViewController {
    
    var gameDataArray = [GameData]()

        override func viewDidLoad() {
            super.viewDidLoad()
            loadData()

            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false

            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem
        }
        
        override func viewWillAppear(_ animated: Bool){
            super.viewWillAppear(animated)
            
            loadData()
            tableView.reloadData()
            
        }

        // MARK: - Table view data source
        
        
        func loadData(){
            gameDataArray = [GameData]()
            let numberOfGamesPlayed = UserDefaults.standard.integer(forKey: Constants.NUM_GAMES)
            
            for i in (0..<numberOfGamesPlayed).reversed(){
                let whoWon = UserDefaults.standard.string(forKey: Constants.WHO_WON + String(i+1))
                let dateTime = UserDefaults.standard.object(forKey: Constants.DATE_TIME + String(i+1)) as! Date
                let orderOfMoves = UserDefaults.standard.array(forKey: Constants.ORDER_OF_MOVES + String(i+1)) as! [Int]
                let gameData = GameData(whoWon: whoWon!, dateTime: dateTime, orderOfMoves: orderOfMoves)
                
                gameDataArray.append(gameData)
            }
        }

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
           
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            let numberOfGamesPlayed = UserDefaults.standard.integer(forKey:Constants.NUM_GAMES)
            return numberOfGamesPlayed
        }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Krutarth_TableCell", for: indexPath) as! Krutarth_TableViewCell

            // Configure the cell...
            
            //cell number "i"
            
            let i = indexPath.row
            let gameData = gameDataArray[i]
            
           if(gameData.whoWon == ""){
                cell.whoWonLabel.text = "Draw!"
            }else{
                cell.whoWonLabel.text = gameData.whoWon + "Won!!"
            }
            
            //format date and time
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            
            let formattedDateTime = dateFormatter.string(from: gameData.dateTime)
            
            
            cell.dateTimeLabel.text = formattedDateTime
            
            //set the image
            
            if(gameData.whoWon == "X"){
                cell.winLossImage.image = UIImage(named:"orange_win")
            } else{
                cell.winLossImage.image = UIImage(named:"orange_loss")
            }
            cell.gameData = gameData
            return cell
        }


        /*
        // Override to support conditional editing of the table view.
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            // Return false if you do not want the specified item to be editable.
            return true
        }
        */

        /*
        // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
        */

        /*
        // Override to support rearranging the table view.
        override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        }
        */

        /*
        // Override to support conditional rearranging of the table view.
        override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            // Return false if you do not want the item to be re-orderable.
            return true
        }
        */

        
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            
            let identifier = segue.identifier
            
            if(identifier == "newGame"){
                return
            }
            
            let whichCell = sender as! Krutarth_TableViewCell
            let destinationView = segue.destination as! Krutarth_ViewController
            
            destinationView.replayingPastGame = true
            destinationView.pastGameData = whichCell.gameData
        }
        

    }

    struct GameData{
        var whoWon : String
        var dateTime : Date
        var orderOfMoves : [Int]
    }
