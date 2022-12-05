//
//  Extension+Design.swift
//  NoteProject
//
//  Created by batuhan on 30.11.2022.
//

import UIKit


extension UIViewController{
    func viewDesign(){
        let tasarim = UINavigationBarAppearance()
        tasarim.backgroundColor = UIColor.systemYellow
        navigationItem.scrollEdgeAppearance = tasarim
        navigationItem.compactAppearance = tasarim
        navigationItem.standardAppearance = tasarim
        
    }
}
