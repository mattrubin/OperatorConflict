//
//  ViewController.swift
//  OperatorConflict
//
//  Created by Matt Rubin on 5/9/15.
//
//

import UIKit
import Result
import Runes

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        useResult()
        useRunes()
    }

    private func useResult() {
        let possibleString: Result<String, Void> = .success("hello!")
        let possibleEnthusiasticString = possibleString >>- intensifyEnthusiasm
        print(possibleEnthusiasticString)
    }

    private func useRunes() {
        let possibleString: String? = .Some("hello!")
        let possibleEnthusiasticString = possibleString >>- intensifyEnthusiasm
        print(possibleEnthusiasticString)
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

private func intensifyEnthusiasm(string: String) -> String? {
    // If the string is already enthusiastic...
    if string[string.endIndex.predecessor()] == "!" {
        // ...intensify the enthusiasm!
        return string + "!"
    }
    // We can't handle such an unenthusiastic string.
    return .None
}
