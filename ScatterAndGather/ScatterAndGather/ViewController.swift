//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Nathanael Youngren on 1/30/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
    }
    
    
    @IBAction func toggle(_ sender: UIBarButtonItem) {
        
        if shouldScramble {
            scatter()
            shouldScramble = false
        } else {
            gather()
            shouldScramble = true
        }
    }
    
    func createViews() {
        
        lLabel.text = "L"
        lLabel.font = UIFont(name: "Avenir-Light", size: 30)
        lLabel.sizeToFit()
        lLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lLabel)
        
        aLabel.text = "a"
        aLabel.font = UIFont(name: "Avenir-Light", size: 30)
        aLabel.sizeToFit()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aLabel)
        
        mLabel.text = "m"
        mLabel.font = UIFont(name: "Avenir-Light", size: 30)
        mLabel.sizeToFit()
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mLabel)
        
        bLabel.text = "b"
        bLabel.font = UIFont(name: "Avenir-Light", size: 30)
        bLabel.sizeToFit()
        bLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bLabel)
        
        dLabel.text = "d"
        dLabel.font = UIFont(name: "Avenir-Light", size: 30)
        dLabel.sizeToFit()
        dLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dLabel)
        
        a2Label.text = "a"
        a2Label.font = UIFont(name: "Avenir-Light", size: 30)
        a2Label.sizeToFit()
        a2Label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(a2Label)

        let image = UIImage(named: "Lambda_Logo_Full")
        logo = UIImageView(image: image)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.setContentHuggingPriority(.init(1000), for: .horizontal)
        view.addSubview(logo)
        
        let textStackView = UIStackView()
        view.addSubview(textStackView)
        textStackView.axis = .horizontal
        textStackView.distribution = .equalSpacing
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        textStackView.addArrangedSubview(lLabel)
        textStackView.addArrangedSubview(aLabel)
        textStackView.addArrangedSubview(mLabel)
        textStackView.addArrangedSubview(bLabel)
        textStackView.addArrangedSubview(dLabel)
        textStackView.addArrangedSubview(a2Label)
        
        let outerStackView = UIStackView()
        view.addSubview(outerStackView)
        outerStackView.axis = .vertical
        outerStackView.distribution = .equalSpacing
        outerStackView.spacing = 8
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        outerStackView.addArrangedSubview(textStackView)
        outerStackView.addArrangedSubview(logo)
        
        NSLayoutConstraint.activate([
            outerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            outerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            outerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            ])
    }
    
    func scatter() {
        
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.logo.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.logo.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.00, animations: {
                self.lLabel.center = CGPoint(x: CGFloat.random(in: 50...300), y: CGFloat.random(in: 50...300))
                self.lLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...8))
                self.lLabel.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255, green: CGFloat.random(in: 1...255)/255, blue: CGFloat.random(in: 1...255)/255, alpha: CGFloat.random(in: 1...255)/255)
                
                
                self.aLabel.center = CGPoint(x: CGFloat.random(in: 50...300), y: CGFloat.random(in: 50...300))
                self.aLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...8))
                self.aLabel.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255, green: CGFloat.random(in: 1...255)/255, blue: CGFloat.random(in: 1...255)/255, alpha: CGFloat.random(in: 1...255)/255)
                
                self.mLabel.center = CGPoint(x: CGFloat.random(in: 50...300), y: CGFloat.random(in: 50...300))
                self.mLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...8))
                self.mLabel.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255, green: CGFloat.random(in: 1...255)/255, blue: CGFloat.random(in: 1...255)/255, alpha: CGFloat.random(in: 1...255)/255)
                
                self.bLabel.center = CGPoint(x: CGFloat.random(in: 50...300), y: CGFloat.random(in: 50...300))
                self.bLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...8))
                self.bLabel.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255, green: CGFloat.random(in: 1...255)/255, blue: CGFloat.random(in: 1...255)/255, alpha: CGFloat.random(in: 1...255)/255)
                
                self.dLabel.center = CGPoint(x: CGFloat.random(in: 50...300), y: CGFloat.random(in: 50...300))
                self.dLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...8))
                self.dLabel.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255, green: CGFloat.random(in: 1...255)/255, blue: CGFloat.random(in: 1...255)/255, alpha: CGFloat.random(in: 1...255)/255)
                
                self.a2Label.center = CGPoint(x: CGFloat.random(in: 50...300), y: CGFloat.random(in: 50...300))
                self.a2Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/CGFloat.random(in: 1...8))
                self.a2Label.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255, green: CGFloat.random(in: 1...255)/255, blue: CGFloat.random(in: 1...255)/255, alpha: CGFloat.random(in: 1...255)/255)
            })
            
        }, completion: nil)
        
        
    }
    
    func gather() {
        
    }
    
    // Properties:
    
    let lLabel = UILabel()
    let aLabel = UILabel()
    let mLabel = UILabel()
    let bLabel = UILabel()
    let dLabel = UILabel()
    let a2Label = UILabel()
    var logo = UIView()
    
    var shouldScramble = true

}
