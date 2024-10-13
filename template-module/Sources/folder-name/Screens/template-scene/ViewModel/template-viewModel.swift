//
//  {SCREEN-NAME}ViewModel.swift
//  
//
//  Created by AUTHOR-NAME on DATE.
//

import UIKit
import RxSwift
import RxRelay
import Network

final class {SCREEN-NAME}ViewModel: ObservableObject {
    
    enum Signal {}
    
    @Published var entity: [String] = []

    @Published var isLoading = false
    @Published var isLoadingFailed = false
    @Published var isFirstLoad = true
    @Published var isRefreshing = false
    
    private let viewOnAppearSignal = PublishRelay<Void>()
    private let retryButtonTappedSignal = PublishRelay<Void>()
    private let didScrollToEndSignal = PublishRelay<Void>()
   
    // Here add events
    
    private let onSignal: (Signal) -> Void
    
    // Here add usecases
    
    private let imageResolver: (String?) -> String?
    
    private let bag = DisposeBag()
    
    init(
        apiProvider: ApiProvider,
        imageResolver: @escaping (String?) -> String?,
        onSignal: @escaping (Signal) -> Void
    ) {
        // Init usecases with apiProvider.make()
        
        self.imageResolver = imageResolver
        self.onSignal = onSignal
        
        bindSelf()
    }
}
    
private extension {SCREEN-NAME}ViewModel {    
    func bindSelf() {
        bindViewEvents()
        bindLoadingEvents()
    }
    
    func bindViewEvents() {
        viewOnAppearEvent
            .take(1)
            .bind(to: viewOnAppearSignal)
            .disposed(by: bag)
        
        retryButtonTappedEvent
            .do(onNext: { [unowned self] in isLoadingFailed = false })
            .bind(to: viewOnAppearSignal)
            .disposed(by: bag)
                
        refreshEvent
            .do(onNext: { [unowned self] in
                isLoadingFailed = false
            })
            .bind(to: viewOnAppearSignal)
            .disposed(by: bag)
    }
    
    func bindLoadingEvents() {}
}

extension {SCREEN-NAME}ViewModel {
    
    func viewOnAppear() {
        viewOnAppearEvent.accept(())
    }
    
    func onRetryButtonTapped() {
        retryButtonTappedEvent.accept(())
    }
    
    func onRefresh() {
        guard !isRefreshing else { return }
        isRefreshing = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.refreshEvent.accept(())
        }
    }
}
