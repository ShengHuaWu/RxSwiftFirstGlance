import UIKit
import RxSwift
import RxCocoa

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let existingDisposeBag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        URL(string: "https://swapi.co/api/people/1")
            .map { URLRequest(url: $0) }
            .map {
                URLSession.shared.rx
                .data(request: $0)
                .map { print($0.count) }
                .subscribe()
                .disposed(by: existingDisposeBag)
        }
        
        return true
    }
}

