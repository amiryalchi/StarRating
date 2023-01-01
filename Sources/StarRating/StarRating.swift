

import SwiftUI

public struct StarRating: View {

    @Binding var rating: Int
    let maxRating: Int
    let onImage: Image
    let offImage: Image
    let size: CGSize
    let spacing: CGFloat

    public init(rating: Binding<Int>, maxRating: Int, onImage: Image, offImage: Image, size: CGSize, spacing: CGFloat) {
        self._rating = rating
        self.maxRating = maxRating
        self.onImage = onImage
        self.offImage = offImage
        self.size = size
        self.spacing = spacing
    }

    public var body: some View {
        HStack(spacing: spacing) {
            ForEach(1..<maxRating + 1) { index in
                self.image(for: index)
                    .resizable()
                    .frame(width: size.width, height: size.height)
                    .foregroundColor(index > self.rating ? .gray : .yellow)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }

    private func image(for index: Int) -> Image {
        index > rating ? offImage : onImage
    }
    
    
}
