import XCTest
import Static

class RowTests: XCTestCase {

    func testInit() {
        let selection: Selection = {}
        let context: Row.Context = [
            "Hello": "world"
        ]

        let row = Row(text: "Title", detailText: "Detail", selection: selection, cellClass: ButtonCell.self, context: context, UUID: "1234")
        XCTAssertEqual("1234", row.UUID)
        XCTAssertEqual("Title", row.text!)
        XCTAssertEqual("Detail", row.detailText!)
        XCTAssertEqual("world", row.context?["Hello"] as? String)
    }

    func testInitWithImage() {
        let image = UIImage(named: "Setting")
        let row = Row(image: image)
        XCTAssertEqual(row.image, image)
    }

    func testInitWithImageTintColor() {
        let image = UIImage(named: "Setting")
        let row = Row(image: image, imageTintColor: UIColor.lightGrayColor())
        XCTAssertEqual(row.image, image)
        XCTAssertEqual(row.imageTintColor, UIColor.lightGrayColor())
    }

    func testInitWithAccessoryType() {
        let accessory: Row.Accessory = .Checkmark

        let row = Row(accessory: accessory)

        XCTAssertTrue(row.accessory == accessory)
    }

    func testInitWithSelectableAccessoryType() {
        let selection: Selection = {}
        let accessory: Row.Accessory = .DetailButton(selection)

        let row = Row(accessory: accessory)

        XCTAssertEqual(row.accessory, accessory)
        XCTAssertTrue(row.accessory.selection != nil)
    }

    func testInitWithAccessoryView() {
        let view = UIView()
        let accessory: Row.Accessory = .View(view)

        let row = Row(accessory: accessory)

        XCTAssertEqual(row.accessory, accessory)
        XCTAssertEqual(row.accessory.view!, view)
    }

    func testHashable() {
        let row = Row()
        var hash = [
            row: "hi"
        ]

        XCTAssertEqual("hi", hash[row]!)
    }

    func testEquatable() {
        let row1 = Row()
        let row2 = Row()

        XCTAssertEqual(row1, row1)
        XCTAssertFalse(row1 == row2)
    }
}
