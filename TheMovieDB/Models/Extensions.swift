//
//  APIManager.swift
//  TheMovieDB
//
//  Created by Sandy Sánchez on 17/03/25.
//
import UIKit
import FCAlertView
import SystemConfiguration

extension UIImageView {
    func load(imageString: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/original" + imageString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class ATAlert {
    static var lableAtt = UILabel(frame: .zero)
    
    static func displayAlert(viewController: UIViewController, title: String, subtitle: String?, autoHide: Bool, needConfirmation: Bool, action: @escaping () -> Void) {
     //   viewController.view.backgroundColor = #colorLiteral(red: 0.04741105437, green: 0.4169731438, blue: 0.6149932742, alpha: 0.4296875)
        let alert = FCAlertView()
        alert.colorScheme = #colorLiteral(red: 0.05098039216, green: 0.1450980392, blue: 0.2470588235, alpha: 1)
        alert.titleColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        alert.subTitleColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        alert.bounceAnimations = true
        alert.detachButtons = true
        alert.cornerRadius = 8
        alert.showAlert(inView: viewController,
                        withTitle: title,
                        withSubtitle: "\(subtitle ?? "")",
            withCustomImage: nil,
            withDoneButtonTitle: (needConfirmation ?  "Si" : "Entendido"),
            andButtons: nil)
        
        alert.doneActionBlock(action)

            alert.autoHideSeconds = 2;
        if needConfirmation {
            alert.addButton("Cancelar", withActionBlock: {})
        }
    }
}



class CheckConection {
    class func connection() -> Bool {
          var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
          zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
          zeroAddress.sin_family = sa_family_t(AF_INET)
          
          let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
              $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                  SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
              }
          }
          
          var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
          if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
              return false
          }
          
          //MARK: Working for Cell and WIFI
          let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
          let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
          let ret = (isReachable && !needsConnection)
          
          return ret
      }
}
