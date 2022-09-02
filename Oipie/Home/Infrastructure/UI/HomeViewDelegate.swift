//
//  HomeViewDelegate.swift
//  Oipie
//
//  Created by Daniel Ramos on 1/9/22.
//

protocol HomeViewDelegate: AnyObject {
    func presentRecepies(_ recepies: [Recepie])
    func addRecepies(_ recepies: [Recepie])
}
