//
//  MailComposer.swift
//  UselessEmailApp
//
//  Created by Lucas Dimer Justo on 30/11/21.
//

import Foundation
import MessageUI
import SwiftUI

struct MailComposer: UIViewControllerRepresentable {
    typealias UIViewControllerType = MFMailComposeViewController
    static var nome: String = ""
    static var email: String = ""
    static var telefone: String = ""
    static var trabalho: String = ""
    static var empresa: String = ""
    static var turno: String = ""
    static var initialTime: TimeInterval = Date().timeIntervalSinceReferenceDate
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        
        let composer = MFMailComposeViewController()
        //composer.mailComposeDelegate = self
        composer.setToRecipients([MailComposer.email])
        composer.setSubject("The most useless message ever.")
        composer.setMessageBody("Thank you for informing your data:\nname: \(MailComposer.nome)\ntelefone: \(MailComposer.telefone)\ntrabalho: \(MailComposer.trabalho)\nempresa: \(MailComposer.empresa)\nturno: \(MailComposer.turno)\nWe used it for absolutelly nothing!\n Have a nice day!", isHTML: false)
        
        return composer
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
        
    }
}

