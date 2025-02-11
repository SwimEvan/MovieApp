//
//  ViewController.swift
//  MovieApp
//
//  Created by EVAN MEYER on 1/15/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var numOfMovies = 0
    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var tfOutlet: UITextField!
    
    var movieName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
    func getMovie(){
        let session = URLSession.shared
        let movieURL =  URL(string:"http://www.omdbapi.com/?t=\(movieName)&apikey=eacfa78e")!
        let dataTask = session.dataTask(with: movieURL) { data, response, error in
            if let e = error {
                print("Error \(e)")
            }
            else {
                if let d = data {
                    
                    if let jsonObj = try? JSONSerialization.jsonObject(with: d, options: .fragmentsAllowed) as? NSDictionary {
                        print(jsonObj)
                        
                       
                        
                        
                        
                    } else {
                        print("could not parse json")
                    }
                    
                    
                    
                } else {
                    print("no data")
                }
                
                
                
                
            }
            
        }
        dataTask.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
    }
    
    func showErrorAlert(message: String) {
           let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default))
           present(alert, animated: true)
       }

    @IBAction func submitAction(_ sender: UIButton) {
        movieName = tfOutlet.text!
        getMovie()
    }
}

