//
//  LoginInterfaces.swift
//  TheMovieDB
//
//  Created by Sandy Sánchez on 16/03/25.
//  Copyright (c) 2025 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum LoginNavigationOption {
    //navegaciòn
    case goToOpenApp
}

protocol LoginWireframeInterface: WireframeInterface {
    func navigate(to option: LoginNavigationOption)
}

protocol LoginViewInterface: ViewInterface {
    //protocolo respuestas de servicio success/failure
}

protocol LoginPresenterInterface: PresenterInterface {
    //referencias del presenter
    func performLogIn()
}

protocol LoginInteractorInterface: InteractorInterface {
    //funcion para ejecutar el servicio
}
