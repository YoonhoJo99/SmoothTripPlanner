//
//  WriteViewController.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/10/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class WriteViewController: UIViewController {

    private let writeView = WriteView()
    private let tableView = UITableView()
    private let cellIdentifier = "PlanCell"
    private var tripPlans = [Plan]() // 파이어베이스에서 가져온 여행 계획 데이터를 저장할 배열

    override func loadView() {
        view = writeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupAddTarget()
        fetchTripPlans()
    }

    func setupAddTarget() {
        writeView.floatingButton.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)
    }

    func setupTableView() {
        // 테이블 뷰의 데이터 소스와 델리게이트 설정
        tableView.dataSource = self
        tableView.delegate = self

        // 테이블 뷰를 WriteView에 추가
        writeView.addSubview(tableView)

        // 테이블 뷰의 셀 등록
        tableView.register(PlanViewCell.self, forCellReuseIdentifier: cellIdentifier)

        // 테이블 뷰의 오토레이아웃 설정
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    func fetchTripPlans() {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }

        let db = Firestore.firestore()
        let tripPlansRef = db.collection("tripPlans").whereField("userId", isEqualTo: currentUserID)
        tripPlansRef.getDocuments { [weak self] (querySnapshot, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching trip plans: \(error.localizedDescription)")
                return
            }

            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            self.tripPlans = documents.compactMap { queryDocumentSnapshot in
                let data = queryDocumentSnapshot.data()
                guard
                    let tripName = data["tripName"] as? String,
                    let place = data["place"] as? String,
                    let startDateTimestamp = data["startDate"] as? Timestamp,
                    let endDateTimestamp = data["endDate"] as? Timestamp
                else {
                    return Plan(date: "", place: "", tripName: "")
                }
                let startDate = self.dateToString(startDateTimestamp.dateValue())
                let endDate = self.dateToString(endDateTimestamp.dateValue())
                let date = "\(startDate) ~ \(endDate)"

                return Plan(date: date, place: place, tripName: tripName)
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func dateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        return dateFormatter.string(from: date)
    }

    @objc func floatingButtonTapped() {
        print("플로팅 버튼 클릭됨")
        let newPlanVC = NewPlanViewController()
        present(newPlanVC, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension WriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripPlans.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PlanViewCell
        let plan = tripPlans[indexPath.row]
        cell.configure(with: plan)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension WriteViewController: UITableViewDelegate {
    // 필요한 UITableViewDelegate 메서드 구현
}

