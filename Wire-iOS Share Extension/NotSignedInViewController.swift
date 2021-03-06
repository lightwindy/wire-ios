//
// Wire
// Copyright (C) 2016 Wire Swiss GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//

import Foundation
import Cartography

class NotSignedInViewController : UIViewController {
    
    var closeHandler : (() -> Void)?
    
    let messageLabel = UILabel()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(onCloseTapped))
        
        messageLabel.text = "You need to sign into Wire before you can share anything";
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        
        view.addSubview(messageLabel)
        
        constrain(view, messageLabel) { container, messageLabel in
            messageLabel.edges == container.edgesWithinMargins
        }
    }
    
    func onCloseTapped() {
        closeHandler?()
    }
}
