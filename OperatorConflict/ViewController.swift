//
//  ViewController.swift
//  OperatorConflict
//
//  Created by Matt Rubin on 5/9/15.
//
//

import UIKit
import Result

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let resultString: Result<String, Void> = .success("hello!")
        let enthusiasticResult = resultString >>- intensifyEnthusiasm
        print(enthusiasticResult)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


private func intensifyEnthusiasm(string: String) -> Result<String, Void> {
    // If the string is already enthusiastic...
    if string[string.endIndex.predecessor()] == "!" {
        // ...intensify the enthusiasm!
        return .success(string + "!")
    }
    // We can't handle such an unenthusiastic string.
    return .failure()
}
