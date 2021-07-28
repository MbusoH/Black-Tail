//
//  TableViewController.swift
//  TailTales
//
//  Created by Mbuso on 2021/07/17.
//

import UIKit
import Foundation

//Creating the api url link/ address/ calling charactors and charactor details
let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass")!
//Creating a URL session
let urlSession = URLSession.shared
//url request from the url
let request = URLRequest(url: url)



class TableViewController: UITableViewController {
    
    
    var dataToReturn = [Drinks]()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //activityIndicator.startAnimating()
        view.backgroundColor = .gray

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //let nib = UINib(nibName: "TableViewCell", bundle: nil)
        //tableView.register(nib, forCellReuseIdentifier: "MyCell")
        
    
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            //Unwarpping the data and confriming if there is data and not nil
            guard let unwrappedData = data else {
                print("No data")
                return
            }
            //A JsconDecoder which occonverts the data from the jason  file with help from a struc "Character"!!!
            let jsonDecoder = JSONDecoder()
            do {
                guard let characterList = try? jsonDecoder.decode(TopDrinks.self, from: unwrappedData).drinks
                else {
                    print("Could not decode")
                    return
                }
                print("pass1")
                DispatchQueue.main.async {
                    //give values to the dataToReturn dictionary
                    self.dataToReturn = characterList
                    self.tableView.reloadData() //Reload very IMPORTANT!!!!!!
                    print("\(self.dataToReturn[1].idDrink)")
                    //self.activityIndicator.stopAnimating()
                    //self.activityIndicator.alpha = 0
                }
                
            }
            return
        }
     
        task.resume()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("pass3")
        print("--------\(dataToReturn.count)")
        return  dataToReturn.count 
        
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell
    
       
        
    
        // Configure the cell...
    let currentDrink = dataToReturn[indexPath.row]
        //print("this number confrim charactor id: \(dataToReturn[indexPath.row].id)")
        //print("mark pass 1: \(dataToReturn[(dataToReturn[indexPath.row].id) - 1].id)")

        //UImage(named: "")// getting the url for image in global thread then  displaying in main thread
        DispatchQueue.global().async {
            //let urlString = url.absoluteString // convert url to string
            let url = URL(string: "\(currentDrink.strDrinkThumb)") //convert string to url
            if let dataOnline = try? Data(contentsOf: url!){
                DispatchQueue.main.async {
                    cell.strDrinkThumb.image = UIImage(data: dataOnline)
                }
            }
        }
    cell.strDrink.text = "\(currentDrink.strDrink)"
    cell.strCategory.text = "\(currentDrink.idDrink)"
    
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pass1", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //These were the segue function transferes data. This is linked to the performSegue function. I think!!
        print("----------------> performing segue")
        if let DetailPages = segue.destination as? DetailPages {
            DetailPages.dataRecieved = dataToReturn[(tableView.indexPathForSelectedRow?.row)!]
        }
        print("pass5")
    } 

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
