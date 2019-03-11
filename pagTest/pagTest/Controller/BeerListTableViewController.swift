//
//  BeerListTableViewController.swift
//  pagTest
//
//  Created by Frederico Bechara De Paola on 10/03/19.
//  Copyright © 2019 Frederico Bechara De Paola. All rights reserved.
//

import UIKit

class BeerListTableViewController: UITableViewController {

    var beers: [Beer] = [Beer]()
    private let beerCellIdentifier = "beerTableViewCell"
    private let detailsSegueIdentifier = "detailsSegue"
    private let errorMessage = "Something went wrong! :("
    private let caster = Caster(requester: BeerRequester())
    private var beerPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Beers"
        tableView.register(UINib(nibName: "BeerTableViewCell", bundle: nil), forCellReuseIdentifier: beerCellIdentifier)
        loadData()
    }
    
    func loadData() {
        caster.getBeers(page: beerPage, successCompletion: { [weak self] (beers) in
            self?.beers += beers
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }) { [weak self] (_) in
            self?.showErrorScreen()
        }
    }
    
    func showErrorScreen() {
        self.tableView.isHidden = true
        let label = UILabel(frame: self.view.frame)
        view.addSubview(label)
        label.center = view.center
        label.text = errorMessage
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: beerCellIdentifier, for: indexPath) as? BeerTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: beers[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: detailsSegueIdentifier, sender: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == beers.count - 10 {
            beerPage += 1
            loadData()
        }
    }

     // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailsSegueIdentifier {
            if let detailsVc = segue.destination as? BeerDetailsViewController, let index = sender as? Int {
                detailsVc.beer = self.beers[index]
            }
        }
    }
 

}
