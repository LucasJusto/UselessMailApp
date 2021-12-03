//
//  ResultView.swift
//  UselessEmailApp
//
//  Created by Marcelo Diefenbach on 29/11/21.
//

import SwiftUI
import MessageUI

struct ResultView: View {
    let screenSize = UIScreen.main.bounds
    @State private var showingMailComposer = false
    
    /// The delegate required by `MFMailComposeViewController`
    private let mailComposeDelegate = MailDelegate()

    /// The delegate required by `MFMessageComposeViewController`
    private let messageComposeDelegate = MessageDelegate()
    
    var body: some View {
        ZStack {
            VStack {
                Text("Pronto!")
                    .font(.system(size: screenSize.height*0.06))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(EdgeInsets.init(top: 0, leading: 0, bottom: screenSize.height*0.09, trailing: 0))
                Text("Você gastou")
                    .font(.body)
                Text("\(seconds) segundos")
                    .font(.system(size: screenSize.height*0.06))
                    .fontWeight(.bold)
                Text("preenchendo as informações")
                    .font(.body)
                    .padding(EdgeInsets.init(top: 0, leading: 0, bottom: screenSize.height*0.15, trailing: 0))
                Text("Agora você pode enviar suas informações por e-mail")
                    .font(.system(size: screenSize.height*0.02))
                    .bold()
                    .frame(width: screenSize.width*0.62, height: screenSize.height*0.07, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets.init(top: 0, leading: 0, bottom: screenSize.height*0.015, trailing: 0))
                Button(action: {
//                    showingMailComposer = true
                    self.presentMailCompose()
                }) {
                    HStack {
                        Text("Enviar e-mail")
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                    }
                    .frame(width: screenSize.width*0.9, height: screenSize.height*0.07, alignment: .center)
                    .foregroundColor(.black)
                    .background(Color.green)
                    .cornerRadius(40)
                }
            }
        }
//        .sheet(isPresented: $showingMailComposer, content: {
//            MailComposer()
//        })
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}

// MARK: The mail part
extension ResultView {

    /// Delegate for view controller as `MFMailComposeViewControllerDelegate`
    private class MailDelegate: NSObject, MFMailComposeViewControllerDelegate {

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            controller.dismiss(animated: true)
        }

    }

    /// Present an mail compose view controller modally in UIKit environment
    private func presentMailCompose() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let vc = UIApplication.shared.keyWindow?.rootViewController

        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = mailComposeDelegate
        composeVC.setToRecipients([MailComposer.email])
        composeVC.setSubject("The most useless message ever.")
        composeVC.setMessageBody("Thank you for informing your data:\nname: \(MailComposer.nome)\ntelefone: \(MailComposer.telefone)\ntrabalho: \(MailComposer.trabalho)\nempresa: \(MailComposer.empresa)\nturno: \(MailComposer.turno)\nWe used your data for absolutely nothing!\n Have a nice day!", isHTML: false)

        vc?.present(composeVC, animated: true)
    }
}

// MARK: The message part
extension ResultView {

    /// Delegate for view controller as `MFMessageComposeViewControllerDelegate`
    private class MessageDelegate: NSObject, MFMessageComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            // Customize here
            controller.dismiss(animated: true)
        }

    }

    /// Present an message compose view controller modally in UIKit environment
    private func presentMessageCompose() {
        guard MFMessageComposeViewController.canSendText() else {
            return
        }
        let vc = UIApplication.shared.keyWindow?.rootViewController

        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = messageComposeDelegate

        vc?.present(composeVC, animated: true)
    }
}
