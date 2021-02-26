

import UIKit
import WebKit

protocol CharactersProtocol {
    func addFavourite(name: String, webView: String)
}

class InfoVC: UIViewController {

    //var webview: WKWebView!
    var url = URL(string: "https://www.google.com")
    var myProtocol: CharactersProtocol?
    var name = ""
    var myView = UIView()
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height / 10 - 50, width: UIScreen.main.bounds.width, height: 150))
        myView.backgroundColor = .gray
        view.addSubview(myView)
        
        let myRequest = URLRequest(url: url!)
        webview.load(myRequest)
        
        
        let touch = UITapGestureRecognizer()
        touch.addTarget(self, action: #selector(handlerTapGester))
        
        self.view.addGestureRecognizer(touch)
        
        //contentView.frame = CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height - 100, width: 60, height: 60)
        //contentView.backgroundColor = .yellow
        //self.view.addSubview(contentView)
        //self.webview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handlerTapGester)))
        
        
    }
    
    @objc func handlerTapGester() {
        self.navigationController?.navigationBar.backgroundColor = .yellow
        myProtocol?.addFavourite(name: name, webView: url!.absoluteString)
        //print("Hello World")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension UIImageView {
//    func circle() -> UIImageView {
//        self.layer.borderWidth = 2
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.cornerRadius = self.bounds.width / 2
//
//        return self
//    }
//}
