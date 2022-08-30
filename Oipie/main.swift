//
//  main.swift
//  Oipie
//
//  Created by Daniel Ramos on 26/8/22.
//

import Foundation
import UIKit

let appDelegateClass: AnyClass = NSClassFromString("TestingAppDelegate") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
