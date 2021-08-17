struct Response: Decodable {
    let info: Info
    let results: [Character]
}
