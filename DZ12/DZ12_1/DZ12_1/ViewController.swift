//
//  ViewController.swift
//  DZ12_1
//
//  Created by Дмитрий Зубарев on 11.04.2021.
//

import UIKit

class ViewController: UIViewController {
    private var circle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        circle = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        circle.text = "🎃"
        circle.font = .systemFont(ofSize: 85)
        view.addSubview(circle)
        animationCircle()
}
    private func animationCircle() {
        UIView.animate(withDuration: 2, delay: 0, options: []) {
            self.circle.frame = CGRect(x: Int(UIScreen.main.bounds.width) - 100, y: 100, width: 100, height: 100)
            } completion: {(_) in
                UIView.animate(withDuration: 2) {
                    self.circle.frame = CGRect(x: Int(UIScreen.main.bounds.width) - 100,
                                               y: Int(UIScreen.main.bounds.height) - 100,
                                               width: 100,
                                               height: 100)
                } completion: {(_) in
                    UIView.animate(withDuration: 2) {
                        self.circle.frame = CGRect(x: 0,
                                                   y: Int(UIScreen.main.bounds.height) - 100,
                                                   width: 100,
                                                   height: 100)
                    } completion: {(_) in
                       UIView.animate(withDuration: 2, delay: 0, options: []) {
                          self.circle.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
                       } completion: {(_) in
                          self.circle.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
                          self.animationCircle()
                       }
                   }
               }
          }
       }

}
