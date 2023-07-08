//
//  missionViewCell.swift
//  Lions
//
//  Created by ABDELHADI on 13/6/2023.
//

import UIKit

class missionViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(titlefor:String){
        title.text = titlefor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
