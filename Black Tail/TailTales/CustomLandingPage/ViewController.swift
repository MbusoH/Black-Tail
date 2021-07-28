//
//  ViewController.swift
//  TailTales
//
//  Created by Mbuso on 2021/07/17.
//

import UIKit
import Foundation



class ViewController: UIViewController {
    
    var dataToPass = [Drinks]()

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var tailTales: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(logo)
        view.addSubview(tailTales)
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //logo.center = view.center
        //tailTales.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.animate()
        })
    }
    
    private func animate(){
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 1.5
            let diffx = size - self.view.frame.size.width
            let diffy = self.view.frame.size.height - size
            
            self.logo.frame = CGRect(
                x: -(diffx/2),
                y: diffy/2,
                width: size,
                height: size
            )
        })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.logo.alpha = 0
        })
        UIView.animate(withDuration: 1.5, animations: {
            self.tailTales.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.async {
                    /*let viewController = TableViewController()
                    viewController.modalTransitionStyle = .crossDissolve
                    viewController.modalPresentationStyle = .fullScreen
                    self.present(viewController, animated: true)*/
                    
                    /*
                    let run1 = FetchData()
                    run1.decoding(completion: { (response) in
                         DispatchQueue.main.async {
                            self.dataToPass = response
                            print("IIIIIIIIII\(response)")
                        }
                        print("try here")
                    }) */
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "TabBar")
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
        })
        
    }
    
}

/* let storyboard = UIStoryboard(name: "myStoryboardName", bundle: nil)
 let vc = storyboard.instantiateViewController(withIdentifier: "myVCID")
 self.present(vc, animated: true)  */

