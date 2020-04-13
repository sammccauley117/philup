//
//  ViewController.swift
//  PhilUp
//
//  Created by Sam McCauley on 3/17/20.
//  Copyright © 2020 Sam McCauley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var money: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func moneyButton(_ sender: Any) {
        if(self.money.text == "$0.00") {
            let amount = Double.random(in: 1.0 ..< 20.0)
            self.money.text = String(format: "$%.2f", amount)
        }
    }
    
    var charities: [Charity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charities = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createArray() -> [Charity] {
        var tempCharities: [Charity] = []
        
        let charity1 = Charity(image: UIImage(named: "lexington_rescue_mission")!, title: "Lexington Rescue Mission", description: "Helps members of Lexington struggling with poverty rebuild their lives through faith and valuable lessons.")
        let charity2 = Charity(image: UIImage(named: "the_nest")!, title: "The Nest", description: "Provides a safe place for educating, counseling, and support to children and families in crisis.")
        let charity3 = Charity(image: UIImage(named: "habitat_for_humanity")!, title: "Habitat For Humanity", description: "Seeking to put God's love in action through building homes, communities, and hope.")
        let charity4 = Charity(image: UIImage(named: "hope_center")!, title: "Hope Center", description: "Caring for the homeless and at-risk persons with life services that are comprehensive and address underlying causes. ")
        let charity5 = Charity(image: UIImage(named: "united_way")!, title: "United Way of the Bluegrass", description: "Fighting for the basic needs, education and financial stability of every person in Central Kentucky.")
        
        let charity6 = Charity(image: UIImage(named: "girls")!, title: "Girls on the Run", description: "Uses a fun, researched-based curriculum that creatively integrates running to inspire every girl to reach her limitless potential.")
        let charity7 = Charity(image: UIImage(named: "angel")!, title: "Angel Tree Ministry", description: "Angel tree is a prison fellowship program that gives parents behind bars a way to restore and strengthen relationships with their children through a God's love, especially at Christmas.")
        let charity8 = Charity(image: UIImage(named: "bird")!, title: "3 Little Birds 4 Life", description: "A wish granting services for people over 18 battling the hard endeavors of cancer.")
        let charity9 = Charity(image: UIImage(named: "make-a-wish")!, title: "Make-A-Wish", description: "Creates life-changing wishes for kids with a critical illness: from flying in a hot air balloon to meeting Iron Man.")
        
        tempCharities.append(charity1)
        tempCharities.append(charity2)
        tempCharities.append(charity3)
        tempCharities.append(charity4)
        tempCharities.append(charity5)
        tempCharities.append(charity6)
        tempCharities.append(charity7)
        tempCharities.append(charity8)
        tempCharities.append(charity9)
        
        return tempCharities
    }
    
    func donate() {
        self.money.text = "$0.00"
        
        let alert = UIAlertController(title: "", message: "Thank you for your donation!", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)

        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
          alert.dismiss(animated: true, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Donate", message: "Would you like to donate your money to this charity?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.donate()
        })
        
        self.present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charities.count
    }
    
    // Maybe not
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let charity = charities[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharityCell") as! CharityCell
        
        cell.setCharity(charity: charity)
        
        return cell
    }
}
