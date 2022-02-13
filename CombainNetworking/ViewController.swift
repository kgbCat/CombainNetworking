//
//  ViewController.swift
//  CombainNetworking
//
//  Created by Anna Delova on 2/12/22.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private var subscriptions: Set<AnyCancellable> = []
    private var viewModel: ViewModel?
    private var characterimage: UIImage?

    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var idTxtField: UITextField!
    @IBOutlet var image: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ViewModel(apiClient: ApiClient(), inputIdPublisher: setIdPublisher())

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resign))
        view.addGestureRecognizer(tapGesture)

        fetchCharacter()
//        fetchLocation()
//        fetchEpisod()

    }
    @objc private func resign() {
        view.endEditing(true)
        resignFirstResponder()
    }
    private func setIdPublisher() -> AnyPublisher<Int, Never> {
        return idTxtField
            .publisher(for: \.text)
            .compactMap {$0.flatMap { Int($0)}}
            .print("inputId")
            .eraseToAnyPublisher()
    }

    private func loadImageFrom(url: URL) {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .print("Image")
            .sink { [weak self] value in
                if let value = value {
                    self?.characterimage = value
                }
            }
            .store(in: &subscriptions)
    }

    private func fetchCharacter() {
        viewModel?.character
            .catch {_ in Empty<Character, Never>() }
            .receive(on: DispatchQueue.main)
            .print("Character")
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { [weak self] value in

                self?.descriptionLbl.text! = value.description

                if let url = URL(string: value.image) {
                    self?.loadImageFrom(url: url)
                    if let charImage = self?.characterimage {
                        self?.image?.image = charImage
                    }
                }
            })
            .store(in: &subscriptions)
    }

    private func fetchLocation() {
        viewModel?.location
            .catch {_ in Empty<Location, Never>() }
            .receive(on: DispatchQueue.main)
            .print("Location")
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { [weak self] value in

                self?.descriptionLbl.text! = value.description

            })
            .store(in: &subscriptions)
    }

    private func fetchEpisod() {
        viewModel?.episode
            .catch {_ in Empty<Episode, Never>() }
            .receive(on: DispatchQueue.main)
            .print("Episode")
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { [weak self] value in

                self?.descriptionLbl.text! = value.description

            })
            .store(in: &subscriptions)
    }
}

