extension String { 
    func at(_ i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    func safeAt(_ i: Int) -> Character? {
        guard i < count  else { return nil }
        return at(i)
    }
}
