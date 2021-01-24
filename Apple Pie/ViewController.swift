//
//  ViewController.swift
//  Apple Pie
//
//  Created by Thai Minh on 21/01/2021.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var treeImageView: UIImageView!
  @IBOutlet var correctWordLabel: UILabel!
  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var letterButtons: [UIButton]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func letterButtonPressed(_ sender: UIButton) {
    sender.isEnabled = false
  }
}

