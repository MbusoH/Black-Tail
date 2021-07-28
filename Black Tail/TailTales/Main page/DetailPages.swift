//
//  DetailPages.swift
//  Black Tail
//
//  Created by Mbuso on 2021/07/22.
//

import UIKit

class DetailPages: UIViewController {
    
    var dataRecieved: Drinks?
    var cockTailToReturn =  [Drinks1]()

    @IBOutlet weak var strDrink: UILabel!
    @IBOutlet weak var strDrinkThumb: UIImageView!
    @IBOutlet weak var strCategory: UILabel!
    @IBOutlet weak var strInstructions: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let dataRecieved = self.dataRecieved{
            self.strDrink.text = "\(dataRecieved.strDrink)"
            
            DispatchQueue.global().async {
                let url = URL(string: "\(dataRecieved.strDrinkThumb)")
                if let dataOnline = try? Data(contentsOf: url!){
                    DispatchQueue.main.async {
                        self.strDrinkThumb.image = UIImage(data: dataOnline)
                    }
                }
            }
            
            
            let url1 = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(dataRecieved.idDrink)")!
            let urlSession1 = URLSession.shared
            let request1 = URLRequest(url: url1)
            
            let task1 = urlSession1.dataTask(with: request1) { data1, response1, error2 in
                if let error1 = error2 {
                    print("Error: \(error1.localizedDescription)")
                    return
                }
                //Unwarpping the data and confriming if there is data and not nil
                guard let unwrappedData1 = data1 else {
                    print("No data")
                    return
                }
                //A JsconDecoder which occonverts the data from the jason  file with help from a struc "Character"!!!
                let jsonDecoder1 = JSONDecoder()
                do {
                    guard let quotes = try? jsonDecoder1.decode(TopDrinks1.self, from: unwrappedData1).drinks
                    else {
                        print("Could not decode qoutes")
                        return
                    }
                    print("pass1")
                    DispatchQueue.main.async {
                        //give values to the dataToReturn dictionary
                        self.cockTailToReturn  = quotes
                        self.strInstructions.text = "\(self.cockTailToReturn[0].strInstructions)"
                        self.strCategory.text = "\(self.cockTailToReturn[0].strCategory)"
                        self.view.reloadInputViews()
                        print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++its here")
                    }
                }
                return
            }
    
            view.reloadInputViews()
            
            print("@@@@@@@@@@@@@@@\(dataRecieved.idDrink)")
            task1.resume()
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
