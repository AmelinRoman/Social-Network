//
//  AllGroupVC+FillData.swift
//  SocialNetworkAmelinRoman
//
//  Created by Macbook Pro on 23.11.2021.
//

import UIKit
// - MARK: Расширение для работы с данными всех групп
extension AllGroupViewController {
    // - Функция заполнения и передачи данных в основной массив
    func allGroupFillData() {
        
        let allGroup: [Group] = [
            Group(nameGroup: "Aviasales", avatarGroupName: "1_1"),
            Group(nameGroup: "Brand Shop", avatarGroupName: "1_2"),
            Group(nameGroup: "Botanica", avatarGroupName: "1_3"),
            Group(nameGroup: "Brain Fuck", avatarGroupName: "1_4"),
            Group(nameGroup: "Cosmos", avatarGroupName: "1_5"),
            Group(nameGroup: "Flora", avatarGroupName: "1_6"),
            Group(nameGroup: "Futurama", avatarGroupName: "1_7"),
            Group(nameGroup: "Java Script", avatarGroupName: "1_8"),
            Group(nameGroup: "Liga Champions", avatarGroupName: "1_9"),
            Group(nameGroup: "Simpsons", avatarGroupName: "1_10"),
            Group(nameGroup: "Marvel", avatarGroupName: "1_11"),
            Group(nameGroup: "Moscow", avatarGroupName: "1_12"),
            Group(nameGroup: "World", avatarGroupName: "1_13"),
            Group(nameGroup: "Sport", avatarGroupName: "1_14"),
            Group(nameGroup: "Swift", avatarGroupName: "1_15"),
            Group(nameGroup: "Swimmining", avatarGroupName: "1_16"),
            Group(nameGroup: "Travel", avatarGroupName: "1_17"),
        ]
        
        for i in allGroup {
            arrayAllGroupList.append(i)
        }
        
      
        
     
        
    }
    
    
}
