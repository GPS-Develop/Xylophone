import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        playSound(currentTitle: sender.currentTitle!)
        UIView.animate(withDuration: 0.3) { // makes transition smoother
            sender.alpha = 0.5 // sets opacity to half
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
            UIView.animate(withDuration: 0.3) {
                sender.alpha = 1.0 // resets opacity
            }
        }
    }
    
    func playSound(currentTitle: String) {
        let url = Bundle.main.url(forResource: currentTitle, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

