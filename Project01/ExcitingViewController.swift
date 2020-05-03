//
//  ExcitingViewController.swift
//  Project01
//
//  Created by 황지은 on 2020/05/02.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit
import AVFoundation

class ExcitingViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,AVAudioPlayerDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        ExcitingArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return ExcitingArray[row]
     }
    

    @IBOutlet var excitingPickerView: UIPickerView!
    @IBOutlet var excitingAlbumImg: UIImageView!
    @IBOutlet var excitingSinger: UILabel!
    @IBOutlet var excitingSongTitle: UILabel!
    @IBOutlet var excitingIndicator: UIActivityIndicatorView!
    @IBOutlet var excitingView: UIView!

    
    let ExcitingArray:Array<String> = ["불장난","에너제틱","Viva la vida","Dance Monkey"]
    
    var started:Bool!
    var player: AVAudioPlayer!
    var timer:Timer!

    
    @IBAction func excitingPlayBtn(_ sender: Any) {
        excitingIndicator.startAnimating()
               started = true
               
               let stringIndex:String = ExcitingArray[self.excitingPickerView.selectedRow(inComponent: 0)]
                      
               if started == true {
                   if stringIndex == "불장난" {
                        excitingSinger.text = "블랙핑크"
                        excitingSongTitle.text = "불장난"
                        excitingAlbumImg.image = #imageLiteral(resourceName: "PLAYINGWITHFIRE.jpg")
                        excitingView.isHidden = false
                   guard let url = Bundle.main.url(forResource: "fire", withExtension: "mp3") else { return }

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
                  else if stringIndex == "에너제틱" {
                       excitingSinger.text = "워너원"
                       excitingSongTitle.text = "에너제틱"
                       excitingAlbumImg.image = #imageLiteral(resourceName: "Energeticimg.JPG")
                       excitingView.isHidden = false
                     guard let url = Bundle.main.url(forResource: "Energetic", withExtension: "mp3") else { return }

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
                    
                   else if stringIndex == "Viva la vida" {
                       excitingSinger.text = "Coldplay"
                       excitingSongTitle.text = "Viva la vida"
                       excitingAlbumImg.image = #imageLiteral(resourceName: "187B1D38506B1D5C08.jpeg")
                       excitingView.isHidden = false
                   guard let url = Bundle.main.url(forResource: "Vivalavida", withExtension: "mp3") else { return }

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
                    
                   else if stringIndex == "Dance Monkey" {
                       excitingSinger.text = "Tones And I"
                       excitingSongTitle.text = "Dance Monkey"
                       excitingAlbumImg.image = #imageLiteral(resourceName: "108904.jpg")
                       excitingView.isHidden = false
                  guard let url = Bundle.main.url(forResource: "dance monkey", withExtension: "mp3") else { return }

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
    
    
    @IBAction func excitingStopBtn(_ sender: Any) {
        excitingIndicator.stopAnimating()
        started = false
        excitingView.isHidden = true
        player?.pause()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        excitingView.isHidden = true
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    
}
