//
//  BeerTVCell.swift
//  Sparkcognition Task
//
//  Created by $umit on 22/08/22.
//

import UIKit


class BeerTVCell: UITableViewCell {
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var berName: UILabel!
    @IBOutlet weak var abv: UILabel!
    @IBOutlet weak var ounces: UILabel!
    @IBOutlet weak var Style: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func populateData(data: BeerListModel?){
        berName.text = (data?.name ?? "").uppercased()
        abv.text = data?.abv ?? ""
        ounces.text = data?.ounces ?? ""
        Style.text = data?.style ?? ""
    }
}
