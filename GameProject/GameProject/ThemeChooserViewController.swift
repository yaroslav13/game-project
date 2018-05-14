//
//  ThemeChooserViewController.swift
//  GameProject
//
//  Created by Yaroslav Halivets on 4/30/18.
//  Copyright © 2018 Yaroslav Halivets. All rights reserved.
//

import UIKit

class ThemeChooserViewController: UIViewController {

   let themes = [
    
    "Sports"  : "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸🥊⛳️🤽🏿‍♂️" ,
    "Animals" : "🐶🐱🐯🐣🦈🐼🦄🐧🐰🐳🐊🦍🦉"  ,
    "Faces" : "😂😎🤩🤬😱🤮😭🤪😌😡🙃😍🤯"
    
    
    ]

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let button = sender as? UIButton {
                if let themeName = button.currentTitle {
                    if let theme = themes[themeName]{
                        if let gvc =  segue.destination as? GameController {
                            gvc.theme = theme 
                        }
                    }
                }
            }
           
        }
    }


}
