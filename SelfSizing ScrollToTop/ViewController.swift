//
//  ViewController.swift
//  SelfSizing ScrollToTop
//
//  Created by Jonny on 2/2/19.
//  Copyright © 2019 Junyu Kuang <lightscreen.app@gmail.com>. All rights reserved.
//

import UIKit

class ViewController : UITableViewController {

    @IBAction func scrollToTop(_ sender: Any) {
        tableView.reloadData()
        
        print("search results updated, now scroll to top, so user can check the latest content from top to bottom")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.tableView.setContentOffset(.zero, animated: false) // no matter true or false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.setContentOffset(.zero, animated: false)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tableView.setContentOffset(.zero, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = Array(repeating: "Search Result\n", count: (1...5).randomElement()!).reduce("", +)
        return cell
    }
}

