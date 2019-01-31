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
    
    func labelMaker(letters: [String]) {
        for letter in letters {
            let newLabel = UILabel()
            newLabel.text = "\(letter)"
            newLabel.font = UIFont(name: "Avenir-Light", size: 30)
            newLabel.sizeToFit()
            newLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(newLabel)
            labels.append(newLabel)
        }
    }
    
    func createViews() {
        
        labelMaker(letters: ["L", "a", "m", "b", "d", "a"])

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
        
        textStackView.addSubViewsToStack(views: self.labels)
        
        let outerStackView = UIStackView()
        view.addSubview(outerStackView)
        outerStackView.axis = .vertical
        outerStackView.distribution = .fill
        outerStackView.spacing = 8
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        outerStackView.addArrangedSubview(textStackView)
        outerStackView.addArrangedSubview(logo)
        
        NSLayoutConstraint.activate([
            outerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            outerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            outerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logo.heightAnchor.constraint(equalTo: logo.widthAnchor, multiplier: 1.0/3.0)
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
                
                
                for label in self.labels {
                    var t = CGAffineTransform.identity
                    t = t.translatedBy(x: CGFloat.random(in: -100...100), y: CGFloat.random(in: 50...400))
                    t = t.rotated(by: CGFloat.pi/CGFloat.random(in: 1...3))
                    
                    label.transform = t
                    
                    label.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255, green: CGFloat.random(in: 1...255)/255, blue: CGFloat.random(in: 1...255)/255, alpha: CGFloat.random(in: 0...1))
                }

            })
            
        }, completion: nil)
    
    }
    
    func gather() {
        
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                self.logo.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.logo.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.00, animations: {
                
                for label in self.labels {
                    label.transform = .identity
                    label.backgroundColor = UIColor(red: CGFloat.random(in: 1...255)/255, green: CGFloat.random(in: 1...255)/255, blue: CGFloat.random(in: 1...255)/255, alpha: 0)
                }
                
            })
            
        }, completion: nil)
    }
    
    // Properties:
    
    let lLabel = UILabel()
    let aLabel = UILabel()
    let mLabel = UILabel()
    let bLabel = UILabel()
    let dLabel = UILabel()
    let a2Label = UILabel()
    var logo = UIView()
    
    var labels: [UIView] = []
    
    var shouldScramble = true

}

extension UIStackView {
    func addSubViewsToStack(views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
