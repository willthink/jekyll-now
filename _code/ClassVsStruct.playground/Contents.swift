class CatClass {
    var name: String
    var color: String
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}

struct CatStruct {
    var name: String
    var color: String
}

var oreo = CatClass(name: "Oreo", color: "BlackWhite")
var coco = CatStruct(name: "Coco", color: "BlackWhiteRed")

print("\(coco.name)'s color is \(coco.color)")
print("\(oreo.name)'s color is \(oreo.color)")

var anotherOreo = oreo
var anotherCoco = coco
anotherCoco.color = "Red"
anotherOreo.color = "Black"

print("\(coco.name)'s color is \(coco.color)")
print("\(oreo.name)'s color is \(oreo.color)")