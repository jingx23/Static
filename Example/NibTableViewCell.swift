import UIKit
import Static

final class NibTableViewCell: UITableViewCell, CellType {

    // MARK: - Properties

    @IBOutlet weak var centeredLabel: UILabel!

    
    // MARK: - CellType

    static func nib() -> UINib? {
        return UINib(nibName: String(self), bundle: nil)
    }

    func configure(row row: Row) {
        centeredLabel.text = row.text
    }
}
