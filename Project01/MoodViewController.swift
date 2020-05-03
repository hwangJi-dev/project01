//
//  MoodViewController.swift
//  Project01
//
//  Created by 황지은 on 2020/05/02.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit
import AVFoundation

class MoodViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        MoodArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return MoodArray[row]
       }
      

    let MoodArray:Array<String> = ["2 Soon","Modern Loneliness","그의 바다","주저하는 모든 연인들에게"]
     
    var started:Bool!
    var player: AVAudioPlayer?
    
    @IBOutlet var moodPickerView: UIPickerView!
    @IBOutlet var moodIndicator: UIActivityIndicatorView!
    @IBOutlet var moodAlbumImg: UIImageView!
    @IBOutlet var moodArtist: UILabel!
    @IBOutlet var moodSongTitle: UILabel!
    @IBOutlet var moodView: UIView!
    
    
    
    
    @IBAction func moodFinishBtn(_ sender: UIButton) {
        moodIndicator.stopAnimating()
        started = false
        moodView.isHidden = true
        player?.pause()
    }
    
    
    
    
    @IBAction func moodStartBtn(_ sender: UIButton) {
       moodIndicator.startAnimating()
        started = true
                      
                     let stringIndex:String = MoodArray[self.moodPickerView.selectedRow(inComponent: 0)]
                             
                      if started == true {
                          if stringIndex == "2 Soon" {
                               moodArtist.text = "Keshi"
                               moodSongTitle.text = "2 Soon"
                               moodAlbumImg.image = #imageLiteral(resourceName: "2soon.jpeg")
                               moodView.isHidden = false
                           guard let url = Bundle.main.url(forResource: "2 soon", withExtension: "mp3") else { return }

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
                         else if stringIndex == "Modern Loneliness" {
                              moodArtist.text = "Lauv"
                              moodSongTitle.text = "Modern Loneliness"
                              moodAlbumImg.image = #imageLiteral(resourceName: "modernlonelinessImg.jpeg")
                              moodView.isHidden = false
                           guard let url = Bundle.main.url(forResource: "Modern Loneliness", withExtension: "mp3") else { return }

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
                           
                          else if stringIndex == "그의 바다" {
                              moodArtist.text = "백예린"
                              moodSongTitle.text = "그의 바다"
                              moodAlbumImg.image = #imageLiteral(resourceName: "32cadfb830ac60fbef867ba7e9931d9f.600x600x1.jpg")
                              moodView.isHidden = false
                           guard let url = Bundle.main.url(forResource: "yourocean", withExtension: "mp3") else { return }

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
                           
                          else if stringIndex == "주저하는 모든 연인들에게" {
                              moodArtist.text = "잔나비"
                              moodSongTitle.text = "주저하는 모든 연인들에게"
                              moodAlbumImg.image = #imageLiteral(resourceName: "tothecouples.jpg")
                              moodView.isHidden = false
                           guard let url = Bundle.main.url(forResource: "zannabi", withExtension: "mp3") else { return }

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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodView.isHidden = true
        started = false

    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
