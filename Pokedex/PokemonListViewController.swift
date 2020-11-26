//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Chris Eadie on 26/11/2020.
//

import UIKit

class PokemonListViewController: UITableViewController {
    
    let pokemonAPI = PokemonAPI()
    var pokemonList: [Result]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pokemonList = [Result(name: "Catching 'em all...", url: "")]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let url = pokemonAPI.url else {
            fatalError("URL not parsable")
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                fatalError("No Pokemon data received")
            }
            
            let decoder = JSONDecoder()
            do {
                let pokemonAPIResponse = try decoder.decode(PokemonAPIResponse.self, from: data)
                print(pokemonAPIResponse.results)
                DispatchQueue.main.async {
                    self.pokemonList = pokemonAPIResponse.results
                    print(self.pokemonList!)
                    self.tableView.reloadData()
                    print("table view data reloaded")
                }
            } catch {
                fatalError("Pokemon data could not be parsed")
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            print("getting pokemon")
            task.resume()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell")!
        if let pokemonList = pokemonList {
            cell.textLabel?.text = pokemonList[indexPath.row].name.capitalized
        }
        
        return cell
    }

}

