//
//  Questions.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 28/10/2021.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    var text: String
    var type: AnimalType
    
    static func getResult(answers: [Answer]) -> AnimalType {
        var dogs = 0
        var cats = 0
        var rabbits = 0
        var turtles = 0

        for answer in answers {
            if answer.type == .dog{
                dogs += 1
                } else if answer.type == .cat{
                    cats += 1
                } else if answer.type == .rabbit{
                    rabbits += 1
                } else {
                    turtles += 1
                }
        }
        if dogs >= cats && dogs >= rabbits && dogs >= turtles {
            return AnimalType.dog
        } else if cats > dogs && cats >= rabbits && cats >= turtles {
            return AnimalType.cat
        } else if rabbits > cats && rabbits > dogs && rabbits >= turtles {
            return AnimalType.rabbit
        }else{
            return AnimalType.turtle
        }
        }
   }

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        }
    }
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Какую пищу предпочитаете?",
                type: .single,
                answers: [
                    Answer(text: "Стейк", type: .dog),
                    Answer(text: "Рыба", type: .cat),
                    Answer(text: "Морковь", type: .rabbit),
                    Answer(text: "Кукуруза", type: .turtle)
                ]
            ),
            Question(
                text: "Что вам нравиться больше?",
                type: .multiple,
                answers: [
                    Answer(text: "Плавать", type: .dog),
                    Answer(text: "Спать", type: .cat),
                    Answer(text: "Обниматься", type: .rabbit),
                    Answer(text: "Есть", type: .turtle)
                ]
            ),
            Question(
                text: "Любите ли вы поездки на машине?",
                type: .ranged,
                answers: [
                    Answer(text: "Ненавижу", type: .cat),
                    Answer(text: "Нервничаю", type: .rabbit),
                    Answer(text: "Не замечаю", type: .turtle),
                    Answer(text: "Обожаю", type: .dog)
                ]
            )
        ]
    }
}

