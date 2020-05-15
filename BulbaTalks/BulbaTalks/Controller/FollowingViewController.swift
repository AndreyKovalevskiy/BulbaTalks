//
//  FollowingViewController.swift
//  BulbaTalks
//
//  Created by Андрей Погосский on 5/15/20.
//  Copyright © 2020 CocoaHeadsBY. All rights reserved.
//

import UIKit

class FollowingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let nib = UINib(nibName: "FollowingTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FollowingTableViewCell")
    }
}

extension FollowingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FollowingTableViewCell",
                                                       for: indexPath) as? FollowingTableViewCell else {
            return UITableViewCell()
        }

        return cell
        }
}
