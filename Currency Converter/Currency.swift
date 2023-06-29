enum Currency: Double, CaseIterable {
case copperPenny = 640
    case silverPenny = 64
case silverPiece = 16
    case goldPenny = 4
case goldPiece = 1
    func convert(amount: String, to currency: Currency) -> String {
        guard let startAmount = Double(amount) else {
            return ""
        }
        let convertedAmount = (startAmount / self.rawValue) * currency.rawValue
        if convertedAmount > 0 {
            return String(format: "%.2f", convertedAmount)
        }
        return ""
    }
}

enum CurrencyText: String, CaseIterable {
case copperPenny = "Copper Penny"
    case silverPenny = "Silver Penny"
case silverPiece = "Silver Piece"
    case goldPenny = "Gold Penny"
case goldPiece = "Gold Piece"
}
enum CurrencyImage: String, CaseIterable {
case copperPenny = "copperpenny"
    case silverPenny = "silverpenny"
case silverPiece = "silverpiece"
    case goldPenny = "goldpenny"
case goldPiece = "goldpiece"
}
