//
//  Fetch Data.swift
//  Black Tail
//
//  Created by Mbuso on 2021/07/22.
//

import Foundation
import UIKit


/*

class FetchData: UIViewController  {
    var dataToReturnClass = [Drinks]()
    func decoding(completion: @escaping ([Drinks]) -> ()) {
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
                    self.dataToReturnClass = characterList
                    print("OOOOOOOOOOOOOO\(self.dataToReturnClass)")
                    completion(self.dataToReturnClass)
                }
            }
            return
        }
        task.resume()
        self.view.reloadInputViews()
        print("BBBBBBBBBBBBBB\(self.dataToReturnClass)")
        print("maybe here")
    }
}
 
 //"https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass")

*/

/* let storyboard = UIStoryboard(name: "myStoryboardName", bundle: nil)
 let vc = storyboard.instantiateViewController(withIdentifier: "myVCID")
 self.present(vc, animated: true)  */
