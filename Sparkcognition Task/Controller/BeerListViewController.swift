//
//  BeerListViewController.swift
//  Sparkcognition Task
//
//  Created by $umit on 22/08/22.
//

import UIKit

class BeerListViewController: UIViewController {

    @IBOutlet weak var beerTableView: UITableView!
    var beerDataList = [BeerListModel?]()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.getBeerData()
    }
    
    func getBeerData(){
        CustomActivityIndicator.shared.showActivityIndicator(view: self.view)
        BeerViewModel.shared.getBeerlist{(beerData,err) in
            if err == nil{
                self.beerDataList = beerData ?? []
                print("DEBUG: Booking Data to show:\(self.beerDataList)")
                self.beerTableView.register(UINib(nibName: "BeerTVCell", bundle: nil), forCellReuseIdentifier: "BeerTVCell")
                self.beerTableView.dataSource = self
                self.beerTableView.delegate = self
                self.beerTableView.reloadData()
            }
            CustomActivityIndicator.shared.hideActivityIndicator(view: self.view)
        }
    }
   
}
extension BeerListViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerDataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerTVCell", for: indexPath) as! BeerTVCell
        cell.populateData(data: beerDataList[indexPath.row])
        cell.outerView.layer.cornerRadius = 12.0
        cell.outerView.layer.borderColor = UIColor.lightGray.cgColor
        cell.outerView.layer.borderWidth = 0.8
        cell.selectionStyle = .none
        return cell
    }
}
