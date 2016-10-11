//
//  CharacterCollectionViewController.swift
//  FamilyHouse
//
//  Created by Enrique Torrendell on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class CharacterCollectionViewController: UICollectionViewController {
    
    
    var characters: [Character]!
    var filmLocation: FilmLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCharacter()
        collectionView?.allowsMultipleSelection = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func selectCharacter(_ sender: AnyObject) {
        print(collectionView?.indexPathsForSelectedItems)
        for itemIndex in (collectionView?.indexPathsForSelectedItems)! {
            if characters[itemIndex.item].canReportToSet(on: filmLocation) {
                print("\(characters[itemIndex.row].name) can enter.")
            } else {
                print("\(characters[itemIndex.row].name) need to step aside.")
            }
        }
    }
    
    func createCharacter() {
        
        let carl = Character(name: "Carl Winslow", realLifeName: "Reginald VelJohnson", tvSeries: .familyMatters, currentLocation: FilmLocation(name: "Hollywood", address: "Burbank California", tvSeries: .familyMatters), image: #imageLiteral(resourceName: "carl"))
        
        let danny = Character(name: "Danny Tanner", realLifeName: "Bob Saget", tvSeries: .fullHouse, currentLocation: FilmLocation(name: "Warner", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "danny"))
        
        let eddie = Character(name: "Eddie Winslow", realLifeName: "Darius McCrary", tvSeries: .familyMatters, currentLocation: FilmLocation(name: "Hollywood", address: "Burbank California", tvSeries: .familyMatters), image: #imageLiteral(resourceName: "eddie"))
        
        let jesse = Character(name: "Jesse Katsopolis", realLifeName: "John Stamos", tvSeries: .fullHouse, currentLocation: FilmLocation(name: "Warner", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "jesse"))
        
        let joey = Character(name: "Joey Gladstone", realLifeName: "Dave Coulier", tvSeries: .fullHouse, currentLocation: FilmLocation(name: "Warner Bros Studios", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "joey"))
        
        let kimmy = Character(name: "Kimmy Gibbler", realLifeName: "Andrea Barber", tvSeries: .fullHouse, currentLocation: FilmLocation(name: "Warner", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "kimmy"))
        
        let laura = Character(name: "Laura Winslow", realLifeName: "Kallier Shanygne", tvSeries: .familyMatters, currentLocation: FilmLocation(name: "Hollywood", address: "Burbank California", tvSeries: .familyMatters), image: #imageLiteral(resourceName: "laura"))
        
        let michelle = Character(name: "Michelle Tanner", realLifeName: "Mary-Kate Olsen", tvSeries: .fullHouse, currentLocation: FilmLocation(name: "Warner", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "michelle"))
        
        let rebecca = Character(name: "Rebecca Katsopolis", realLifeName: "Lori Loughlin", tvSeries: .fullHouse, currentLocation: FilmLocation(name: "Warner", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "rebecca"))
        
        let stephanie = Character(name: "Stephanie Tanner", realLifeName: "Jodie Sweetin", tvSeries: .fullHouse, currentLocation: FilmLocation(name: "Warner    ", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "stephanie"))
        
        let steve = Character(name: "Steve Urkel", realLifeName: "Jaleel White", tvSeries: .familyMatters, currentLocation: FilmLocation(name: "Hollywood", address: "Burbank California", tvSeries: .familyMatters), image: #imageLiteral(resourceName: "steve"))
        
        let waldo = Character(name: "Waldo Geraldo Faldo", realLifeName: "Shawn Harrison", tvSeries: .familyMatters, currentLocation: FilmLocation(name: "Hollywood", address: "Burbank California", tvSeries: .familyMatters), image: #imageLiteral(resourceName: "Waldo"))
        
        characters = [carl, danny, eddie, jesse, joey, kimmy, laura, michelle, rebecca, stephanie, steve, waldo]
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CharacterCollectionViewCell
        let character = characters[indexPath.item]
        cell.character = character
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CharacterCollectionViewCell
        cell.characterImageView.alpha = 0.5
    }
}
