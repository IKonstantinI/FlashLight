import UIKit

final class ViewController: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var actionButton: UIButton!
    
    private let lightOn = 1.0
    private let lightOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.layer.cornerRadius = redView.frame.height / 2
        yellowView.layer.cornerRadius = yellowView.frame.height / 2
        greenView.layer.cornerRadius = greenView.frame.height / 2
        redView.alpha = lightOff
        yellowView.alpha = lightOff
        greenView.alpha = lightOff
        actionButton.setTitle(NSLocalizedString("START", comment: ""), for: .normal)
        actionButton.backgroundColor = .systemBlue
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.layer.cornerRadius = 8
    }
    
    @IBAction func actionButtonDidTapped(_ sender: UIButton) {
        sender.setTitle("NEXT", for: .normal)
        
        UIView.animate(withDuration: 0.9) {
            if self.redView.alpha == self.lightOn {
                self.redView.alpha = self.lightOff
                self.yellowView.alpha = self.lightOn
            } else if self.yellowView.alpha == self.lightOn {
                self.yellowView.alpha = self.lightOff
                self.greenView.alpha = self.lightOn
            } else if self.greenView.alpha == self.lightOn {
                self.greenView.alpha = self.lightOff
                self.redView.alpha = self.lightOn
            } else {
                self.redView.alpha = self.lightOn
            }
        }
    }
}

