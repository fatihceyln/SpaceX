//
//  HomeVCViewModel.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import Foundation

protocol HomeVCViewModelInterface {
    var view: HomeVCInterface? { get set }
    var service: LaunchServiceProtocol { get set }
    var upcomingLaunches: [Launch] { get set }
    var pastLaunches: [Launch] { get set }
    var didGetUpcomingLaunches: Bool { get set }
    var didGetPastLaunches: Bool { get set }
    
    func getLaunches(type: LaunchType)
    func getLaunchDetail(id: String)
    func segmentedControlDidChange(_ selectedSegmentIndex: Int)
    func refreshData(_ selectedSegmentIndex: Int)
}

final class HomeVCViewModel: HomeVCViewModelInterface {
    weak var view: HomeVCInterface?
    var service: LaunchServiceProtocol = LaunchService()
    
    var upcomingLaunches: [Launch] = []
    var pastLaunches: [Launch] = []
    var didGetUpcomingLaunches: Bool = false
    var didGetPastLaunches: Bool = false
}

extension HomeVCViewModel {
    
    func getLaunches(type: LaunchType) {
        view?.showLoadingView()
        service.downloadLaunches(type: type) { [weak self] launches in
            
            guard
                let self = self,
                let launches = launches else { return }
            
            switch type {
            case .upcoming:
                self.upcomingLaunches = launches
                self.didGetUpcomingLaunches = true
            case .past:
                self.pastLaunches = launches
                self.didGetPastLaunches = true
            }
            
            self.view?.endRefreshing()
            self.view?.reloadCollectionView()
            self.view?.scrollToTop()
            self.view?.dismissLoadingView()
        }
    }
    
    func getLaunchDetail(id: String) {
        service.downloadLaunchDetail(id: id) { [weak self] launchDetail in
            
            guard
                let self = self,
                let launchDetail = launchDetail else { return }
            
            self.view?.goToDetailVC(launch: launchDetail)
        }
    }
    
    func refreshData(_ selectedSegmentIndex: Int) {
        switch selectedSegmentIndex {
        case 0:
            getLaunches(type: .upcoming)
        case 1:
            getLaunches(type: .past)
        default:
            break
        }
    }
    
    func segmentedControlDidChange(_ selectedSegmentIndex: Int) {
        switch selectedSegmentIndex {
        case 0:
            guard !didGetUpcomingLaunches else { self.view?.reloadCollectionView(); self.view?.scrollToTop(); return }
            getLaunches(type: .upcoming)
        case 1:
            guard !didGetPastLaunches else { self.view?.reloadCollectionView(); self.view?.scrollToTop(); return }
            getLaunches(type: .past)
        default:
            break
        }
    }
}
