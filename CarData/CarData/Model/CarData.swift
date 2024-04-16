//
//  CarData.swift
//  CarData
//  다양한 차량의 정보를 정의한 데이터 파일
//  전기차, 내연기관차, 하이브리드차 등의 정보를 포함한다
//
//  Created by uunwon on 4/16/24.
//

import Foundation

protocol Fuel {
    var fuelEfficiency: Double { get set } // 연비
    var isGasoline: Bool  { get set } // 가솔린일까 디젤일까
    
    var fuelEfficiencyString: String { get }
    var isGasolineString: String  { get }
}

extension Fuel {
    var fuelEfficiencyString: String {
        String(format: "%.2f", fuelEfficiency)
    }
    
    var isGasolineString: String {
        isGasoline ? "가솔린" : "디젤"
    }
}

protocol Electric {
    var autoLevel: Int  { get set }
    
    var autoLevelString: String { get }
}

extension Electric {
    var autoLevelString: String {
        String(autoLevel)
    }
}

class Car: Identifiable {
    var brand: String
    var modelName: String
    var year: Int
    
    init(brand: String, modelName: String, year: Int) {
        self.brand = brand
        self.modelName = modelName
        self.year = year
    }
}

// 전기차 🚗
class ElectricCar: Car, Electric {
    var doorCount: Int
    var weight: Int
    var height: Int
    var electricEfficiency: Double
    var fullChargeHours: Double
    var autoLevel: Int
    
    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Int, height: Int, electricEfficiency: Double, fullChargeHours: Double, autoLevel: Int) {
        self.doorCount = doorCount
        self.weight = weight
        self.height = height
        self.electricEfficiency = electricEfficiency
        self.fullChargeHours = fullChargeHours
        self.autoLevel = autoLevel
        
        super.init(brand: brand, modelName: modelName, year: year)
    }
}
 
// 내연기관차 🚕
class OilCar: Car, Fuel {
    var doorCount: Int
    var weight: Int
    var height: Int
    var isAutomatic: Bool
    var fuelEfficiency: Double = 0.0
    var isGasoline: Bool
    
    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Int, height: Int, isAutomatic: Bool, fuelEfficiency: Double, isGasoline: Bool) {
        self.doorCount = doorCount
        self.weight = weight
        self.height = height
        self.isAutomatic = isAutomatic
        self.fuelEfficiency = fuelEfficiency
        self.isGasoline = isGasoline
        
        super.init(brand: brand, modelName: modelName, year: year)
    }
}

// 하이브리드차 🚙
class HybridCar: Car, Fuel, Electric {
    var doorCount: Int
    var weight: Int
    var height: Int
    var fuelEfficiency: Double
    var isGasoline: Bool
    var autoLevel: Int
    
    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Int, height: Int, fuelEfficiency: Double, isGasoline: Bool, autoLevel: Int) {
        self.doorCount = doorCount
        self.weight = weight
        self.height = height
        self.fuelEfficiency = fuelEfficiency
        self.isGasoline = isGasoline
        self.autoLevel = autoLevel
        
        super.init(brand: brand, modelName: modelName, year: year)
    }
}
