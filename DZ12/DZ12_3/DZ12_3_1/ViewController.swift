//
//  ViewController.swift
//  DZ12_3_1
//
//  Created by Дмитрий Зубарев on 24.04.2021.
//

import UIKit

class ViewController: UIViewController {
    var count = 1
    var imageViewForAnimation: UIImageView!
    var secondImageViewForAnimation: UIImageView!
    var thirdImageViewForAnimation: UIImageView!
    var massiveImages: [UIImage] = []
    var secondCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewForAnimation = UIImageView(frame: CGRect(x: 0,
                                                          y: 0,
                                                          width: UIScreen.main.bounds.width,
                                                          height: UIScreen.main.bounds.height))
        massiveImages = [UIImage(named: "Снимок экрана 2021-04-24 в 12.20")!,
                         UIImage(named: "Снимок экрана 2021-04-24 в 12.21")!]
        imageViewForAnimation.image = massiveImages[count]
        view.addSubview(imageViewForAnimation)
        secondImageViewForAnimation = UIImageView(frame: CGRect(x: -UIScreen.main.bounds.width,
                                                                y: 0,
                                                                width: UIScreen.main.bounds.width,
                                                                height: UIScreen.main.bounds.height))
        secondImageViewForAnimation.image = massiveImages[secondCount]
        view.addSubview(secondImageViewForAnimation)
        thirdImageViewForAnimation = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width,
                                                               y: 0,
                                                               width: UIScreen.main.bounds.width,
                                                               height: UIScreen.main.bounds.height))
        thirdImageViewForAnimation.image = massiveImages[secondCount]
        view.addSubview(thirdImageViewForAnimation)
        let gestureRight = UISwipeGestureRecognizer(target: self, action: #selector(animationImage))
        gestureRight.direction = .right
        view.addGestureRecognizer(gestureRight)
        let gestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(animationImage))
        gestureLeft.direction = .left
        view.addGestureRecognizer(gestureLeft)
    }
    @objc func animationImage(gesture: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.25) {
            if gesture.direction == .right {
                self.swipeRight()
            } else {
                self.swipeLeft()
            }
        } completion: { (_) in
            self.secondCount = self.count
            if self.count == 0 {
                self.count = 1
            } else {
                self.count = 0
            }
            self.imageViewForAnimation.image = self.massiveImages[self.count]
            self.secondImageViewForAnimation.image = self.massiveImages[self.secondCount]
            self.thirdImageViewForAnimation.image = self.massiveImages[self.secondCount]
            if gesture.direction == .right {
            self.imageViewForAnimation.frame = CGRect(x: 0,
                                                      y: 0,
                                                      width: UIScreen.main.bounds.width,
                                                      height: UIScreen.main.bounds.height)
            self.secondImageViewForAnimation.frame = CGRect(x: -UIScreen.main.bounds.width,
                                                            y: 0,
                                                            width: UIScreen.main.bounds.width,
                                                            height: UIScreen.main.bounds.height)
            } else {
             self.imageViewForAnimation.frame = CGRect(x: 0,
                                                       y: 0,
                                                       width: UIScreen.main.bounds.width,
                                                       height: UIScreen.main.bounds.height)
             self.thirdImageViewForAnimation.frame = CGRect(x: UIScreen.main.bounds.width,
                                                          y: 0,
                                                          width: UIScreen.main.bounds.width,
                                                          height: UIScreen.main.bounds.height)
            }
            }
    }
    func swipeRight() {
        self.imageViewForAnimation.frame = CGRect(x: UIScreen.main.bounds.width,
                                                  y: 0,
                                                  width: UIScreen.main.bounds.width,
                                                  height: UIScreen.main.bounds.height)
        self.secondImageViewForAnimation.frame = CGRect(x: 0,
                                                        y: 0,
                                                        width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.height)
    }
    func swipeLeft() {
        self.imageViewForAnimation.frame = CGRect(x: -UIScreen.main.bounds.width,
                                                  y: 0,
                                                  width: UIScreen.main.bounds.width,
                                                  height: UIScreen.main.bounds.height)
        self.thirdImageViewForAnimation.frame = CGRect(x: 0,
                                                  y: 0,
                                                  width: UIScreen.main.bounds.width,
                                                  height: UIScreen.main.bounds.height)
    }
}
