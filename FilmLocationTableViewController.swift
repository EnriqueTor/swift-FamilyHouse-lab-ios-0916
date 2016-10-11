//
//  FilmLocationTableViewController.swift
//  FamilyHouse
//
//  Created by Enrique Torrendell on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FilmLocationTableViewController: UITableViewController {

    var filmLocations: [FilmLocation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFakeFilmLocation()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func createFakeFilmLocation() {
        let warner = FilmLocation(name: "Warner", address: "Los Angeles, California", tvSeries: TVSeries.fullHouse)
        let hollywood = FilmLocation(name: "Hollywood", address: "Burbank California", tvSeries: TVSeries.familyMatters)
        filmLocations = [warner, hollywood]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmLocations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTv", for: indexPath) as? FilmLocationTableViewCell
        let filmIndex = filmLocations[indexPath.row]
        cell?.filmLocation = filmIndex
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characterSegue" {
            if let dest = segue.destination as? CharacterCollectionViewController,
                let index = tableView.indexPathForSelectedRow {
                dest.filmLocation = filmLocations[index.row]
            }
            
        }
        
    }
    

}
