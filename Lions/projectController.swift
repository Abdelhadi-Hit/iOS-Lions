//
//  projectController.swift
//  Lions
//
//  Created by ABDELHADI on 13/6/2023.
//

import Foundation
import UIKit


class projectController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
           
           
            @IBOutlet weak var button1: UIButton!
            @IBOutlet weak var button2: UIButton!
            @IBOutlet weak var button3: UIButton!
            @IBOutlet weak var button4: UIButton!
            @IBOutlet weak var button5: UIButton!
           
    
    @IBOutlet weak var startedMisssions: UITableView!
            
   
    @IBOutlet weak var tableView1: UITableView!
    var arrFruits = [Fruit]()
    var missions = [Mission]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let buttons = [button1, button2, button3, button4, button5]
        let cornerRadius: CGFloat = 30
        
        
        for button in buttons {
            button?.layer.cornerRadius = cornerRadius
            button?.clipsToBounds = true
        }
        
       
        loadMissionData()
        tableView1.dataSource=self
        tableView1.delegate=self
        startedMisssions.dataSource=self
        startedMisssions.delegate=self
        
        arrFruits.append(Fruit.init(price: 12.6, photo: UIImage(named: "Ellipse 3")!))
        arrFruits.append(Fruit.init(price: 6, photo: UIImage(named: "Ellipse 3")!))
        arrFruits.append(Fruit.init(price: 6, photo: UIImage(named: "Ellipse 3")!))
    }
    
    
   
    
    //load open missions
    
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
        if tableView == tableView {
                    // Return the number of rows for tableView1
            return missions.count
                } else if tableView == startedMisssions {
                    // Return the number of rows for tableView2
                    return missions.count
                }

                return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell") as! ProjectTableViewCell
       // let fruit = arrFruits[indexPath.row]
        
       // let mission = missions[indexPath.row]
       // cell.setupCell(photofor: fruit.photo, priceofItem: fruit.price)
        
       // cell.setup(titlefor: mission.title,photofor: UIImage(named: mission.image) ?? UIImage(named: "Ellipse 3")!)
        
        
       // return cell
        
        if tableView == tableView1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell") as! ProjectTableViewCell
           let fruit = arrFruits[indexPath.row]
            
           let mission = missions[indexPath.row]
            cell.setupCell(photofor: fruit.photo, priceofItem: fruit.price)
            
            cell.setup(titlefor: mission.title,photofor: UIImage(named: mission.image) ?? UIImage(named: "Ellipse 3")!)
            
            return cell
            
        }else if tableView == startedMisssions{
            let cell = tableView.dequeueReusableCell(withIdentifier: "startedCell") as! StartedMissionViewCell
           let fruit = arrFruits[indexPath.row]
            let mission = missions[indexPath.row]
            
            
            cell.setupStartedMission(titleforStartedM: mission.title, photoforStartedM: UIImage(named: mission.image) ?? UIImage(named: "Ellipse 3")!, startDate: mission.startTime, bashTime:String( mission.batchTime))
            
            return cell
           
            
           
            
            
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == startedMisssions{
            performSegue(withIdentifier: "showDetails", sender: self)
            
        }
        
       
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? ResumeMissionController{
           
            destination.mission = missions[startedMisssions.indexPathForSelectedRow!.row]
        }
    }
    
    
    
    
    
    
    
}




//Models

struct Fruit{
    let price: Double
    let photo: UIImage
}
struct Item: Decodable {
    let title: String
    let image: String
    let startTime: String
    let batchTime: Int
    let progress: Float
}

struct Mission: Decodable {
    let title: String
    let image: String
    let startTime: String
    let batchTime: Int
    let progress: Double
}




