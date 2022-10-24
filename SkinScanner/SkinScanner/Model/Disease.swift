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
            image: "actinicKeratoses",
            description: "Mancha escamosa áspera na pele causada por anos de exposição ao sol. A ceratose actínica geralmente afeta idosos. Reduzir a exposição ao sol pode ajudar a diminuir o risco. É mais comum no rosto, nos lábios, nas orelhas, no dorso das mãos, nos antebraços, no couro cabeludo e no pescoço. A pele escamosa e áspera aumenta lentamente e não costuma causar outros sinais ou sintomas. A lesão pode levar anos para se desenvolver. Como pode se tornar cancerígeno, geralmente é removido como precaução.",
            result: "Ceratose actínica",
            url: URL(string: "https://www.skincancer.org/skin-cancer-information/actinic-keratosis/")!
        ),
        Disease(
            image: "basalcarcioma",
            description: "Tipo de câncer de pele que começa nas células basais. As células basais produzem novas células da pele conforme as antigas morrem. Limitar a exposição ao sol pode ajudar a evitar que essas células se tornem cancerígenas. Esse tipo de câncer geralmente aparece como um nódulo de cera branco ou uma mancha escamosa marrom em áreas expostas ao sol, como rosto e pescoço. Os tratamentos incluem prescrição de cremes ou cirurgia para remover o câncer.",
            result: "Carcinoma basocelular",
            url: URL(string: "https://www.skincancer.org/skin-cancer-information/basal-cell-carcinoma/")!
        ),
        Disease(
            image: "dermatofibroma",
            description: "Dermatofibromas são lesões benignas típicas de extremidades, como braços, antebraços e pernas. Por terem coloração acastanhada, geralmente, são motivos de consulta, na qual os pacientes buscam saber se são pintas ou sinais. De origem diferenciada, os dermatofibromas são, na verdade, depósitos de fibrinas, ou seja, cicatrizes causadas por pequenos traumatismos, geralmente como picadas de insetos ou espinhos, por isso são típicos de ocorrerem nas regiões nas quais a vestimenta não cobre a pele.",
            result: "Dermatofibroma",
            url: URL(string: "https://www.sbd.org.br/doencas/dermatofibroma/#:~:text=Dermatofibromas%20s%C3%A3o%20les%C3%B5es%20benignas%20t%C3%ADpicas,se%20s%C3%A3o%20pintas%20ou%20sinais.")!
        ),
        Disease(
            image: "melanoma",
            description: "O tipo mais grave de câncer de pele. O melanoma ocorre quando as células produtoras dos pigmentos que dão cor à pele tornam-se cancerígenas. Os sintomas podem incluir um novo nódulo anormal ou uma mudança em uma pinta existente. Os melanomas podem ocorrer em qualquer parte do corpo. O tratamento pode envolver cirurgia, radioterapia, medicamentos ou, em alguns casos, quimioterapia.",
            result: "Melanoma",
            url: URL(string: "https://drauziovarella.uol.com.br/doencas-e-sintomas/melanoma-maligno/")!
        ),
        Disease(
            image: "mancha",
            description: "Lesão comum de pele pigmentada, que geralmente se desenvolve durante a vida adulta. A maioria das pessoas desenvolve várias pintas (nevos) durante a vida adulta. As pintas podem ser encontradas em qualquer parte do corpo, geralmente em áreas expostas ao sol, e costumam ser marrons, lisas e ligeiramente salientes. Na maioria dos casos, um nevo é benigno e não requer tratamento. Raramente, transformam-se em melanoma ou outros tipos de câncer de pele. Um nevo que muda de forma, cresce ou escurece deve ser avaliado para remoção.",
            result: "Mancha",
            url: URL(string: "https://www.msdmanuals.com/pt-br/casa/dist%C3%BArbios-da-pele/tumores-cut%C3%A2neos-n%C3%A3o-cancerosos/nevos#:~:text=Os%20nevos%20s%C3%A3o%20pequenas%20les%C3%B5es,%C3%A9%2C%20%C3%A0s%20vezes%2C%20heredit%C3%A1ria.")!
        ),
        Disease(
            image: "seborrheic_keratosis",
            description: "Condição de pele benigna com aspecto de um nódulo maleável de cor castanha, preta ou marrom. A ceratose seborreica é um dos tumores de pele benignos mais comuns em idosos. Embora existam casos de tumores individuais, a presença de vários tumores é mais comum. A ceratose seborreica costuma aparecer no rosto, no tórax, nos ombros ou nas costas. Tem aparência sebosa, escamosa e ligeiramente elevada. Não é necessário tratamento. Se a ceratose seborreica provocar irritação, poderá ser removida por um médico.",
            result: "Ceratose Seborreica",
            url: URL(string: "https://www.msdmanuals.com/pt-br/casa/dist%C3%BArbios-da-pele/tumores-cut%C3%A2neos-n%C3%A3o-cancerosos/ceratose-seborreica")!
        ),
        Disease(
            image: "squamous_cell_carcinoma",
            description: "É um tumor maligno dos queratinócitos epidérmicos que invadem a derme, ocorrendo geralmente em áreas expostas ao sol. A destruição local pode ser extensa e as metástases são observadas nos estágios avançados. O diagnóstico é por biópsia. O tratamento depende das características do tumor e pode ser realizado por eletrocoagulação e curetagem, excisão cirúrgica, criocirurgia ou, ocasionalmente, radioterapia.",
            result: "Carcinoma de células escamosas",
            url: URL(string: "https://www.msdmanuals.com/pt-br/profissional/dist%C3%BArbios-dermatol%C3%B3gicos/c%C3%A2ncer-de-pele/carcinoma-de-c%C3%A9lulas-escamosas")!
        ),
        Disease(
            image: "vascularLesion",
            description: "Lesões vasculares: manchas “vinho do porto”, hemangiomas, telangiectasias, angiomas (face) e varicoses (pernas) são constituídas por uma rede de vasos sanguíneos que deixam a superfície da pele na tonalidade rosa, vermelha e púrpura.",
            result: "Lesões Vascular",
            url: URL(string: "https://sanfranciscodayhospital.com.br/lesoes-vasculares/#:~:text=O%20que%20%C3%A9%3F,tonalidade%20rosa%2C%20vermelha%20e%20p%C3%BArpura.")!
        )
    ]
}
