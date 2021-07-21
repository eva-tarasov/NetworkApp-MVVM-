//
//  Box.swift
//  NetworkApp (MVVM)
//
//  Created by Евгений Тарасов on 18.01.2021.
//  Copyright © 2021 Евгений Тарасов. All rights reserved.
//

import Foundation

class Box<T> {

    typealias Listener = (T) -> Void

    var value: T {
        didSet {
            listener?(value)
        }
    }

    var listener: Listener?

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
