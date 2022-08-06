//
//  ViewController.swift
//  ColourChange
//
//  Created by roman Khilchenko on 04.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var colorWindow: UIView!
    
    @IBOutlet var redStaticLabel: UILabel!
    @IBOutlet var greenStaticLabel: UILabel!
    @IBOutlet var blueStaticLabel: UILabel!
    
    @IBOutlet var redRangeLabel: UILabel!
    @IBOutlet var greenRangeLabel: UILabel!
    @IBOutlet var blueRangeLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWindowView()
        setupStaticLabels()
        setupRangeLabels()
        setupSliders()
    }
    
    @IBAction func redSliderAction() {
        colorWindow.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 0.7)
        redRangeLabel.text = String(Float(round(redSlider.value * 100) / 100))
        greenRangeLabel.text = String(Float(round(greenSlider.value * 100) / 100))
        blueRangeLabel.text = String(Float(round(blueSlider.value * 100) / 100))
    }
    
    @IBAction func greenSliderAction() {
        redSliderAction()
        
    }
    
    @IBAction func blueSliderAction() {
        redSliderAction()
        
    }
    
    private func setupWindowView() {
        colorWindow.layer.cornerRadius = 20
        colorWindow.backgroundColor = .cyan
        
    }
    
    private func setupStaticLabels()  {
        let staticLabels = [redStaticLabel, greenStaticLabel, blueStaticLabel]
        let nameLabels = ["Red:", "Green:", "Blue:"]
        for (index, staticLabel) in staticLabels.enumerated() {
            if let staticLabel = staticLabel {
                staticLabel.text = nameLabels[index]
                staticLabel.textColor = .white
                
            }
        }
    }
    
    private func setupRangeLabels() {
        let rangeLabels = [redRangeLabel, greenRangeLabel, blueRangeLabel]
        for rangeLabel in rangeLabels {
            if let rangeLabel = rangeLabel {
                rangeLabel.text = String(redSlider.value)
                rangeLabel.textColor = .white
            }
            
        }
    }
    
    private func setupSliders() {
        let sliders = [redSlider, greenSlider, blueSlider]
        let colours: [UIColor] = [.red, .green, .blue]
        for (index, slider) in sliders.enumerated() {
            if let slider = slider {
                slider.minimumTrackTintColor = colours[index]
                slider.value = 0
                slider.minimumValue = 0
                slider.maximumValue = 1
            }
        }
    }
}

