//
//  TestItem.swift
//  Shared
//
//  Created by Julian Beck on 11.09.20.
//

import Foundation
let testItem = BlackBoardMessage(title: "Beispiel Nachricht", subTitle: "Beispiel", courseOfStudies: [CourseOfStudy.infb], publicationDate: "2020-07-20", expirationDate: "2020-07-29", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", links: nil, type: TypeEnum.announcement, deleteOnExpiration: false, publicationTimestamp: "2020-07-20 11:29:25.458", id: 1759, idOwner: 18, emailOwner: "informatik@hs-karlsruhe.de", nameOwner: "Max Mussterman")

let gradeTestItem = GradesModel(basicStudyPeriod: Optional(false), avarageBasicStudyPeriod: Optional(-1), avarageMainStudyPeriod: Optional(9999), grades: Optional([Grade(examNumber: Optional("INFBXXXX"), examName: Optional("B:Mathematik 1"), examSemester: Optional("SS 2020"), idExamSemester: Optional(19), status: Optional("bestanden"), date: Optional("2020-07-24"), grade: Optional(100), externalGrade: Optional(false), comment: Optional(""), attempt: Optional(1), weighting: Optional(1)), Grade(examNumber: Optional("INFBXXXX"), examName: Optional("B:Mathematik Labor"), examSemester: Optional("SS 2020"), idExamSemester: Optional(19), status: Optional("bestanden"), date: Optional("2020-07-10"), grade: Optional(300), externalGrade: Optional(false), comment: Optional(""), attempt: Optional(1), weighting: Optional(1))]), gradesBasicStudyPeriod: Optional([]), gradesMainStudyPeriod: Optional([Grade(examNumber: Optional("INFMF01"), examName: Optional("Wahlpflichtblock 1"), examSemester: Optional("SS 2020"), idExamSemester: Optional(19), status: Optional("bestanden"), date: Optional("2020-07-24"), grade: Optional(300), externalGrade: Optional(false), comment: Optional(""), attempt: Optional(1), weighting: Optional(1))]))

