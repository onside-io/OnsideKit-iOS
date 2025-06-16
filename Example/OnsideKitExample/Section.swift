//
//  Section.swift
//  OnsideKitExample
//
//  Created by Alexander Goremykin on 14.07.2025.
//

import SwiftUI

struct Section<Content: View>: View {

    var systemImage: String
    var title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            SectionTitle(systeImage: systemImage, title: title)
                .padding(.leading, 12.0)
            content()
                .padding(.init(top: 16.0, leading: 16.0, bottom: 16.0, trailing: 16.0))
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16.0))
        }
        .shadow(color: .gray.opacity(0.1), radius: 6.0, x: 0.0, y: 6.0)
    }

}

struct SectionItem<Leading: View, Trailing: View>: View {

    @ViewBuilder var leading: () -> Leading
    @ViewBuilder var trailing: () -> Trailing

    var body: some View {
        HStack(spacing: 12.0) {
            leading()
            Spacer()
            trailing()
        }
    }

}

struct SectionTitle: View {

    var systeImage: String?
    var title: String

    var body: some View {
        HStack(spacing: 6.0) {
            Group {
                if let systeImage = systeImage.map({ Image(systemName: $0) }) {
                    systeImage
                }
                Text(title)
                    .font(Font.system(size: 16.0, weight: .medium))
            }
            .foregroundColor(Color(.secondaryLabel))
        }
    }

}

struct SectionItemTitle: View {

    var systeImage: String?
    var title: String

    var body: some View {
        HStack(spacing: 6.0) {
            Group {
                if let systeImage = systeImage.map({ Image(systemName: $0) }) {
                    systeImage
                }
                Text(title)
                    .font(Font.system(size: 14.0, weight: .regular))
            }
            .foregroundColor(Color(.label))
        }
    }

}

struct SectionItemTextValue: View {

    var title: String

    var body: some View {
        Text(title)
            .font(Font.system(size: 14.0, weight: .regular))
            .foregroundColor(Color(.label))
    }

}
