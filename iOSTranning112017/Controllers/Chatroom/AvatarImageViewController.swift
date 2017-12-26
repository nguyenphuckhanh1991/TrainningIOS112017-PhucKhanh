//
//  AvatarImageViewController.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/27/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import UIKit
protocol AvatarImageViewControllerDelegate: class {
    func avaImageSelected(avaImageURL: String)
}
class AvatarImageViewController: BaseViewController {
    private var avaImages = [String]()
    private var avatarStore = ChatroomImageStore.init()
    weak var delegate: AvatarImageViewControllerDelegate?
    @IBOutlet weak private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        avaImages = avatarStore.getAvaImages()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func registerCell() {
        let cellAvaImageViewNib = UINib(nibName: Storyboard.CustomCell.AvaImageCollectionViewCell, bundle: nil)
        self.collectionView.register(cellAvaImageViewNib, forCellWithReuseIdentifier: Storyboard.CustomCell.AvaImageCollectionViewCell)
    }
}
extension AvatarImageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avaImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let avaImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CustomCell.AvaImageCollectionViewCell, for: indexPath) as? AvaImageCollectionViewCell
        avaImageCell?.configureCell(avaImageURL: avaImages[indexPath.row])
        return avaImageCell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.avaImageSelected(avaImageURL: avaImages[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
}
extension AvatarImageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthImageCell = self.view.bounds.size.width / 3
        return CGSize(width: widthImageCell, height: widthImageCell)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
