
//MARK: Eğer ileride Drone gibi farklı bir uçan araç eklemek istersek, kodun esnekliği nasıl artırılabilir?
/*
 Şimdi Drone eklendiği zaman elimizde Airplane,Bird,Drone classları olacak bunlardan bazıları canlı bazıları ise cansızdır. Bunun için ileride ayrı bir canlı varlık eklendiği zaman kullanmak için iki Adet protocol üreterek bunları ayrılmasını sağlayabilirim
 */

//MARK: Before

protocol Flyable : AnyObject {
    func fly() -> String
}

class Bird: Flyable {
    var name: String

    init(name: String) {
        self.name = name
    }

    func fly() -> String {
        return "\(name) is flying"
    }
}

class Airplane: Flyable {
    var model: String

    init(model: String) {
        self.model = model
    }

    func fly() -> String {
        return "Airplane \(model) is flying"
    }
}

class Airport {
    var flyables: [Flyable] = []

    func addFlyable(_ flyable: Flyable) {
        flyables.append(flyable)
    }

    func listFlyingObjects() {
        for item in flyables {
            print(item.fly())
        }
    }
}


let bird = Bird(name: "Eagle")
let airplane = Airplane(model: "Boeing 747")

let airport = Airport()
airport.addFlyable(bird)
airport.addFlyable(airplane)

airport.listFlyingObjects()

//MARK: After
protocol Flyable : AnyObject{
    func fly() -> String
}

protocol LivingFlyable: Flyable {
    var name: String { get }
    
}

protocol MechanicalFlyable: Flyable {
    var model: String { get }
    
}


class Bird: LivingFlyable {
    var name: String

    init(name: String) {
        self.name = name
    }

    func fly() -> String {
        return "\(name) is flying"
    }
}


class Airplane: MechanicalFlyable {
    var model: String

    init(model: String) {
        self.model = model
    }

    func fly() -> String {
        return "Airplane \(model) is flying"
    }
}


class Drone: MechanicalFlyable {
    var model: String

    init(model: String) {
        self.model = model
    }

    func fly() -> String {
        return "Drone \(model) is flying"
    }
}

