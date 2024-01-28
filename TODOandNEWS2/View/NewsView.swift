//
//  NewsView.swift
//  TODOandNEWS2
//
//  Created by 芥川浩平 on 2024/01/28.
//

import SwiftUI

protocol NewsDelegate {
    func transition(article: Article)
}

final class NewsArticleDidTap {
    var delegate: NewsDelegate?
    func TappedArticle(article: Article) {
        guard let delegate = delegate else {
            return
        }
        delegate.transition(article: article)
    }
}

struct NewsView: View {
    @StateObject var newsList = GetNews()
    var newsArticleDidTap = NewsArticleDidTap()

    var body: some View {
        VStack {
            Text("News")
                .font(.system(size: 30, weight: .bold, design: .default))
            List(newsList.articles, id: \.title) { article in
                Button {
                    newsArticleDidTap.TappedArticle(article: article)
                } label: {
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.title)
                                    .font(.headline)
                                    .foregroundStyle(Color("TextColor"))
                                Spacer()
                                Text(article.publishedAt)
                                    .font(.caption)
                                    .foregroundStyle(Color.gray)
                                Text(article.author ?? "")
                                    .font(.caption)
                                    .foregroundStyle(Color.gray)

                            }
                            AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 70)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await newsList.getNews()
            }
        }
    }
}

#Preview {
    NewsView()
}
