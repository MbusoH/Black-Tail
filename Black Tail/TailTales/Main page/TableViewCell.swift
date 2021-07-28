//
//  TableViewCell.swift
//  TailTales
//
//  Created by Mbuso on 2021/07/17.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var strDrinkThumb: UIImageView!
    @IBOutlet weak var strDrink: UILabel!
    @IBOutlet weak var strCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        strDrinkThumb.layer.borderWidth = 2.5
        strDrinkThumb.layer.masksToBounds = false
        strDrinkThumb.layer.borderColor = UIColor.black.cgColor
        //strDrinkThumb.layer.cornerCurve = (strDrinkThumb?.frame.size.width ?? 0.0) / 1.5
        strDrinkThumb.clipsToBounds = true
    }

}
