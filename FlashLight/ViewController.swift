import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var actionButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightOn = 1.0
    private let lightOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.alpha = lightOff
        yellowView.alpha = lightOff
        greenView.alpha = lightOff
        
        actionButton.setTitle("START", for: .normal)
        actionButton.backgroundColor = .systemBlue
        actionButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        actionButton.setTitleColor(.white,for: .normal)
        actionButton.layer.cornerRadius = 8
    }
    
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.height / 2
        yellowView.layer.cornerRadius = yellowView.frame.height / 2
        greenView.layer.cornerRadius = greenView.frame.height / 2
    }
    
    @IBAction func actionButtonDidTapped() {
        if actionButton.currentTitle == "START" {
            actionButton.setTitle("NEXT",for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenView.alpha = lightOff
            redView.alpha = lightOn
            currentLight = .yellow
        case .yellow:
            redView.alpha = lightOff
            yellowView.alpha = lightOn
            currentLight = .green
        case .green:
            greenView.alpha = lightOn
            yellowView.alpha = lightOff
            currentLight = .red
        }
    }
    
}
// MARK: - CurrentLight
extension ViewController {
    private enum CurrentLight {
        case red, yellow, green
    }
}
