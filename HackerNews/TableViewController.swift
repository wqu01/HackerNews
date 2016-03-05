//
//  TableViewController.swift
//  HackerNews
//
//  Created by Wen Niao Qu on 3/5/16.
//  Copyright © 2016 Wen Niao Qu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
        
    var newsObject = [Int: NewsModel]()
    var newsStoryIds : [Int] = []
    /*
    var currentOffSet = 10 {
        didSet {
            initializeData(currentOffSet, newsArray: self.newsStoryIds)
        }
    }
*/
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.estimatedRowHeight = 140
        self.tableView.rowHeight = UITableViewAutomaticDimension
        getData()
    }
    
    func getData(){
        NewsData.getTopStories{[unowned self] newsIDs, error in
            //print("sindie get top stories")
            if let _ = newsIDs {
                //print ("newsID exists")
                self.newsStoryIds = newsIDs as! [Int]
                //newstoryIds now contains a list of ids
                //self.currentOffSet = 10
                //print(self.newsStoryIds)
                self.tableView.reloadData()
            }
            
        }
    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.newsStoryIds.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("newsCell", forIndexPath: indexPath) as! TableViewCell
        
        if let newsData = self.newsObject[indexPath.row] {
            // from caches
            cell.storyTitleLabel.text = newsData.title
        }
        else {
            NewsData.getStoryData(self.newsStoryIds[indexPath.row]){
                data, error in
                if error == nil {
                    self.newsObject[indexPath.row] = data
                    //self.tableView.reloadData()
                    cell.storyTitleLabel.text = data!.title
                }
                
            }
        }
        
        
       
        
        //let newsData = newsObject[indexPath.row]
        

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let webViewController = segue.destinationViewController as! ViewController
        // Get the cell that generated this segue.
        if let selectedStoryCell = sender as? TableViewCell {
            let indexPath = tableView.indexPathForCell(selectedStoryCell)!
            let newsData = newsObject[indexPath.row]
            webViewController.newsData = newsData!
            
        }
    }
    

}
