//
//  ResultsViewController.swift
//  PedraPapelTesoura
//
//  Created by Renan Baialuna on 23/12/20.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result: gameData!
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = result.result.rawValue
        resultImage.image = UIImage(named: result.imageName.rawValue)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func playAgain() {
        dismiss(animated: true, completion: nil)
    }

}
