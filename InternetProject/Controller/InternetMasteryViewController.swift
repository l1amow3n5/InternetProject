//
//  InternetMasteryViewController.swift
//  InternetProject
//
//  Created by Owen, Liam on 12/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class InternetMasteryViewController: UITableViewController
{
    
    private weak var internetDetail : InternetDetailViewController? = nil
    private lazy var internetTopics : [String] = [String]()
    private lazy var addresses : [String] = [String]()
    
    private func setupDetailContents() -> Void
    {
        internetTopics = [
        "internet Definitions 😺",
        "Standard Search Engine 🤲",
        "AP CSP 😈",
        "Canyons District 🦑",
        "CTEC 🐘",
        "Social Media 🐪"
        ]
        
        addresses = [
            "https://www.google.com",
        "https://www.twitter.com",
        "https://www.youtube.com",
        "https://canyons.instructure.com",
        "https://ctec.canyonsdistrict.org/",
        "https://www.instagram.com/"
        ]
        
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            internetDetail = currentControllers[0] as? InternetDetailViewController
        }
    }

    public override func viewDidLoad() -> Void
    {
        super.viewDidLoad()

        setupDetailContents()
         self.clearsSelectionOnViewWillAppear = false

        if let split = splitViewController
        {
            let controllers = split.viewControllers
            internetDetail = (controllers[controllers.count-1] as! UINavigationController).topViewController as? InternetDetailViewController
        }
        
    }
    
    public override func viewWillAppear(_ animated: Bool) -> Void
    {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        
        super.viewWillAppear(animated)
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return addresses.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let rowText = internetTopics[indexPath.row]
        cell.textLabel!.text = rowText
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        internetDetail?.detailAddress = addresses[indexPath.row]
        internetDetail?.detailTitle = internetTopics[indexPath.row]
        if (internetDetail != nil)
        {
            splitViewController?.showDetailViewController(internetDetail!, sender: nil)
        }
    }

    
}
