//
//  HealingViewController.swift
//  Project01
//
//  Created by 황지은 on 2020/05/02.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit
import AVFoundation

class HealingViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,AVAudioPlayerDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        HealingArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return HealingArray[row]
     }
    
    
    let HealingArray:Array<String> = ["blueming","Tomorrow Tonight","별 보러 가자","괜찮아도 괜찮아"]
    var started:Bool!
    var player: AVAudioPlayer!
 
    
    @IBOutlet var HealingIndicator: UIActivityIndicatorView!
    @IBOutlet var healingPickerView: UIPickerView!
    @IBOutlet var HealingHiddenView: UIView!
    @IBOutlet var albumImg: UIImageView!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var songNameLabel: UILabel!

    
    
    
    
    @IBAction func Healingbtn(_ sender: Any) {
        HealingIndicator.startAnimating()
        started = true
        
        let stringIndex:String = HealingArray[self.healingPickerView.selectedRow(inComponent: 0)]
               
        if started == true {
            if stringIndex == "blueming" {
                artistLabel.text = "아이유"
                songNameLabel.text = "blueming"
                albumImg.image = #imageLiteral(resourceName: "blueming.jpg")
                HealingHiddenView.isHidden = false
                guard let url = Bundle.main.url(forResource: "Blueming", withExtension: "mp3") else { return }

                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)

                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)


                    guard let player = player else { return }

                    player.play()

                } catch let error {
                    print(error.localizedDescription)
                }

            }
                
                
           else if stringIndex == "Tomorrow Tonight" {
                artistLabel.text = "Loote"
                songNameLabel.text = "Tomorrow Tonight"
                albumImg.image = #imageLiteral(resourceName: "CS4152823-02A-BIG.jpg")
                HealingHiddenView.isHidden = false
         
                guard let url = Bundle.main.url(forResource: "tomorrow tonight", withExtension: "mp3") else { return }

                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)

                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)


                    guard let player = player else { return }

                    player.play()

                } catch let error {
                    print(error.localizedDescription)
                }
            }
                
                
            else if stringIndex == "별 보러 가자" {
                artistLabel.text = "적재"
                songNameLabel.text = "별 보러 가자"
                albumImg.image = #imageLiteral(resourceName: "gotoseethestars.jpg")
                HealingHiddenView.isHidden = false
               guard let url = Bundle.main.url(forResource: "zukjae", withExtension: "mp3") else { return }

               do {
                   try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                   try AVAudioSession.sharedInstance().setActive(true)

                   player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)


                   guard let player = player else { return }

                   player.play()

               } catch let error {
                   print(error.localizedDescription)
               }
            }
                
                
            else if stringIndex == "괜찮아도 괜찮아" {
                artistLabel.text = "D.O"
                songNameLabel.text = "괜찮아도 괜찮아"
                albumImg.image = #imageLiteral(resourceName: "Do.jpg")
                HealingHiddenView.isHidden = false
                guard let url = Bundle.main.url(forResource: "Thatsokay", withExtension: "mp3") else { return }

                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)

                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)


                    guard let player = player else { return }

                    player.play()

                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
  }
    
    
    @IBAction func HealingStopBtn(_ sender: Any) {
        HealingIndicator.stopAnimating()
        started = false
        HealingHiddenView.isHidden = true
        player?.pause()
      
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        HealingHiddenView.isHidden = true

    }
    
 
    
}

