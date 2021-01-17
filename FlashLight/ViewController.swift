//
//  ViewController.swift
//  FlashLight
//
//  Created by 김예진 on 2021/01/17.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // 스위치 버튼
    @IBOutlet weak var switchBtn: UIButton!
    // 손전등 이미지뷰
    @IBOutlet weak var flashLightIv: UIImageView!
    
    // 스위치 액션에 따른 소리 출력
    var switchSound:AVAudioPlayer?
    
    var isOn = false
    
    let path = Bundle.main.path(forResource: "switch.wav", ofType: nil)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 미리 사운드 메모리를 로드
        prepareToSwitchSound()
    }
    
    // switch를 키거나 끌 때 사용하는 소리 함수
    func prepareToSwitchSound() {
        let url = URL(fileURLWithPath: path)
        
        // 올바른 로직이 수행되었을 때,
        do {
            switchSound = try AVAudioPlayer(contentsOf: url)
            // 경로를 누를 때마다 가져옴으로써 메모리 낭비를 보여줌
//            switchSound?.play()
            // prepareToPlay - 플레이 하기 전 미리 메모리 로드를 시켜줌
            switchSound?.prepareToPlay()
        }
        // 제대로 된 로직이 수행이 되지 못 했을 때,
        catch {
            
        }
    }

    // 손전등 버튼을 눌렀을 경우,
    @IBAction func ClickSwitchAction(_ sender: Any) {
        // 버튼이 on 일 때에는 true를 off일 때에는 false로 값 변경
        isOn = !isOn
        
        switchBtn.setImage(isOn ? UIImage(named: "onSwitch.png"): UIImage(named: "offSwitch.png"), for: .normal)
        flashLightIv.image = isOn ? UIImage(named: "onBG.png") : UIImage(named: "offBG.png")
        
        switchSound?.play()
    }
    

}

