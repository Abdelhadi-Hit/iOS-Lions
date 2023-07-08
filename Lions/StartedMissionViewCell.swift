//
//  StartedMissionViewCell.swift
//  Lions
//
//  Created by ABDELHADI on 15/6/2023.
//

import UIKit

class StartedMissionViewCell: UITableViewCell {
    
    @IBOutlet weak var missionImage: UIImageView!
    @IBOutlet weak var missionTitle: UILabel!
    @IBOutlet weak var missionStartedDate: UILabel!
    @IBOutlet weak var missionBashTime:UILabel!
    
    @IBOutlet weak var progress: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let pr_cornerRadius: CGFloat=20
        
        progress.layer.cornerRadius = pr_cornerRadius
        progress.clipsToBounds = true
        
    }
    
    func setupStartedMission(titleforStartedM: String,photoforStartedM: UIImage,startDate:String ,bashTime: String){
        missionTitle.text = titleforStartedM
        missionImage.image = photoforStartedM
        missionStartedDate.text = startDate
        missionBashTime.text = bashTime
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    


}
