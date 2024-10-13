//
//  TEMPLATE-COORDINATOR.swift
//
//
//  Created by AUTHOR-NAME on DATE.
//

import UIKit
import Design
import Network
import PortalNetwork

public final class TEMPLATE-COORDINATOR {
    
    public enum Signal {
        case link(_ url: URL)
    }
    
    public var onSignal: ((Signal) -> Void)?
        
    private let imageWebSource: ImageWebSource
    private let apiProvider: ApiProvider

    public init(
        apiProvider: ApiProvider,
        imageWebSource: ImageWebSource
    ) {
        self.apiProvider = apiProvider
        self.imageWebSource = imageWebSource
    }
    
    private var navigationController: UINavigationController?
    
    public func start(
        on navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
        
        let viewController = show{SCREEN-NAME}Screen()
        navigationController.modalPresentationStyle = .fullScreen
        
        navigationController.setViewControllers([viewController], animated: true)
    }
}

private extension TEMPLATE-COORDINATOR {

    func show{SCREEN-NAME}Screen() {
        let viewController = make{SCREEN-NAME}Screen()
        
        navigationController?.pushViewController(
            viewController,
            animated: true
        )
    }

    func make{SCREEN-NAME}Screen() -> UIViewController {
        let viewModel: {SCREEN-NAME}ViewModel = { [unowned self] signal in
            switch signal {}
        }
                
        let view: {SCREEN-NAME}Scene = .init(viewModel: viewModel)
        
        let viewController = HostingViewController(rootView: view)
        viewController.hidesBottomBarWhenPushed = true
        viewController.view.backgroundColor = Colors.culturedPearl
        viewController.title = {SCREEN-NAME}
        
        return viewController
    }
}