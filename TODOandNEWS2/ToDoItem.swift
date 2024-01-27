//
//  ToDoItem.swift
//  TODOandNEWS2
//
//  Created by 芥川浩平 on 2024/01/27.
//

import SwiftUI

struct ToDoItem: Hashable, Codable {
    var id = UUID()
    var isChecked: Bool
    var task: String
}
