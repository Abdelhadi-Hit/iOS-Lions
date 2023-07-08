//
//  ProjectTableViewCell.swift
//  Lions
//
//  Created by ABDELHADI on 13/6/2023.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var price: UILabel!
    
    
    @IBOutlet weak var photo: UIImageView!
    
 
    
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
      
    }
    
    
    
    func setupCell(photofor: UIImage,priceofItem : Double){
        photo.image = photofor
        price.text="\(priceofItem)"
        
    }
    
    func setup(titlefor: String,photofor: UIImage){
        title.text = titlefor
        photo.image = photofor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
