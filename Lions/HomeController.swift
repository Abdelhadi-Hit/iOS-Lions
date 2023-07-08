//
//  HomeController.swift
//  Lions
//
//  Created by ABDELHADI on 12/6/2023.
//

import Foundation
import UIKit

class HomeController: UIViewController, UITableViewDataSource ,UITableViewDelegate{
   
    
    
            @IBOutlet weak var button1: UIButton!
            @IBOutlet weak var button2: UIButton!
            @IBOutlet weak var button3: UIButton!
            @IBOutlet weak var button4: UIButton!
            @IBOutlet weak var button5: UIButton!
            
   
  
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    //var missions: [Mission] = []
    var  missions = [Mission]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        
        let buttons = [button1, button2, button3, button4, button5]
        let cornerRadius: CGFloat = 34
        
        for button in buttons {
            button?.layer.cornerRadius = cornerRadius
            button?.clipsToBounds = true
        }
        loadMissionData()
        
        tableView.dataSource = self
        tableView.delegate = self
       
    }
    
    func loadMissionData() {
            guard let url = Bundle.main.url(forResource: "missions", withExtension: "json") else {
                return
            }
            
            do {
                let jsonData = try Data(contentsOf: url)
                missions = try JSONDecoder().decode([Mission].self, from: jsonData)
                
                print(missions)
            } catch {
                print("Error decoding JSON: \(error)")
                
            }
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return missions.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "missionCell") as! missionViewCell
            let mission = missions[indexPath.row]
            print(mission.title)
            cell.setupCell(titlefor: mission.title)
            
            return cell
        }
    
    
    
   
  
}

/*struct Mission: Decodable {
    let title: String
    let image: String
    let startTime: String
    let batchTime: Int
    let progress: Double
}*/

