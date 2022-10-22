//
//  Data.swift
//  SkinScanner
//
//  Created by vivi on 21/10/22.
//

import Foundation

struct Data {
    let date: String
    let image: String
    let result: String
    let url: URL
}

struct DataList {
    static let topTen = [
        Data(
            date: "23/07/2001",
            image: "camera",
            result: "cancer",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        ),
        Data(
            date: "23/07/2001",
            image: "leaf",
            result: "cancer",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        ),
        Data(
            date: "23/07/2001",
            image: "clock",
            result: "cancer",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        ),
        Data(
            date: "23/07/2001",
            image: "mic",
            result: "cancer",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        ),
        Data(
            date: "23/07/2001",
            image: "message",
            result: "cancer",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        ),
        Data(
            date: "23/07/2001",
            image: "heart",
            result: "cancer",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        )
    ]
}
