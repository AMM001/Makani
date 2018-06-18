//
//
//import UIKit
//
//protocol popview {
//
//    func setGender(gender:Int)
//}
//
//
//class PopUpViewController: UIViewController , AKRadioButtonsControllerDelegate {
//    var radiobuttonscontroller: AKRadioButtonsController!
//    @IBOutlet var radiobuttons:[AKRadioButton]!
//
//
//      var delegate:popview?
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//
//        self.showAnimate()
//
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
//
//      //  self.showAnimate()
//        self.radiobuttonscontroller = AKRadioButtonsController(radioButtons: self.radiobuttons)
//        self.radiobuttonscontroller.delegate = self
//        // Do any additional setup after loading the view.
//
//    }
//
//
//    func selectedButton(sender: AKRadioButton){
//        var numgender:Int?
//        let gender = sender.title(for: .normal)!
//        if( gender == "Male" ){
//            numgender = 0
//
//        }else {
//
//            numgender = 1
//        }
//
//        print(numgender!)
//        delegate?.setGender(gender: numgender!)
//         self.removeAnimate()
//
//    }
//
//
//    @IBAction func closePopUp(_ sender: AnyObject) {
//        self.removeAnimate()
//    }
//
//    func showAnimate()
//    {
//        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//        self.view.alpha = 0.0;
//        UIView.animate(withDuration: 0.25, animations: {
//            self.view.alpha = 1.0
//            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        });
//    }
//
//    func removeAnimate()
//    {
//        UIView.animate(withDuration: 0.25, animations: {
//            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//            self.view.alpha = 0.0;
//            }, completion:{(finished : Bool)  in
//                if (finished)
//                {
//                    self.view.removeFromSuperview()
//                }
//        });
//    }
//
//
//
//}

