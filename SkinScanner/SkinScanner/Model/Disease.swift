//
//  Data.swift
//  SkinScanner
//
//  Created by vivi on 21/10/22.
//

import Foundation

struct Disease: Identifiable {
    let id = UUID()
    let image: String
    let description: String
    let result: String
    let url: URL
}

struct DiseaseList {
    static let diseaseClasses = [
        Disease(
            image: "melanoma",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in sollicitudin est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus erat ex, sodales nec massa non, sollicitudin sodales sem. Sed dignissim vulputate risus, a laoreet nulla bibendum nec.",
            result: "Lesão vascular",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        ),
        Disease(
            image: "cat",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in sollicitudin est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus erat ex, sodales nec massa non, sollicitudin sodales sem. Sed dignissim vulputate risus, a laoreet nulla bibendum nec.",
            result: "Melanoma",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        ),
        Disease(
            image: "melanoma",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in sollicitudin est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus erat ex, sodales nec massa non, sollicitudin sodales sem. Sed dignissim vulputate risus, a laoreet nulla bibendum nec.",
            result: "Carcinoma de células escamosas",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        ),
        Disease(
            image: "melanoma",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in sollicitudin est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus erat ex, sodales nec massa non, sollicitudin sodales sem. Sed dignissim vulputate risus, a laoreet nulla bibendum nec.",
            result: "Ceratose Seborreica",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        ),
        Disease(
            image: "melanoma",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in sollicitudin est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus erat ex, sodales nec massa non, sollicitudin sodales sem. Sed dignissim vulputate risus, a laoreet nulla bibendum nec.",
            result: "cancer",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        ),
        Disease(
            image: "melanoma",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in sollicitudin est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus erat ex, sodales nec massa non, sollicitudin sodales sem. Sed dignissim vulputate risus, a laoreet nulla bibendum nec.",
            result: "cancer",
            url: URL(string: "https://www.sbd.org.br/doencas/cancer-da-pele/")!
        )
    ]
}
