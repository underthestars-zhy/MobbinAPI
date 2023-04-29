import Foundation

func convertStringToDate(_ dateString: String) -> Date? {
    let dateFormatter = ISO8601DateFormatter()
    dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

    if let date = dateFormatter.date(from: dateString) {
        return date
    } else {
        return nil
    }
}

let dateString = "2023-04-24T18:36:24.837732+00:00"
if let convertedDate = convertStringToDate(dateString) {
    print(convertedDate)
} else {
    print("Invalid date string format")
}
