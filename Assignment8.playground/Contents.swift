import UIKit

//🛰️ "Welcome aboard! You have come a long (910 light years) way to reach your final destination, the orbit of XO-5b. My name is exoControlCenterDrone and I will give you a quick tour of the station. This is quite exciting, you are the first human to ever set foot on our space station!" 🛰️


//🛰️ "Over here we see the Station Module. We, drones call it "God". it gives meaning to our existence by assigning tasks to us. Let's explore further!" 🛰️

class StationModule {
    let moduleName: String
    var drone: Drone?
    
    init(moduleName: String, drone: Drone? = nil) {
        self.moduleName = moduleName
        self.drone = drone
    }
    
    
    func giveTaskDrone(task: String) {
        if let drone = self.drone {
            print("Task information: \(task)")
        } else {
            print("No drone available to assign a task")
        }
    }
}

//🛰️ "This is our Control Center, you can only access it when it isn't locked and you can only lock or unlock it with a password protected by private access. I will grant you the access later." 🛰️

class ControlCenter: StationModule {
    var isLockedDown: Bool
    private let securityCode: String
    
    init(moduleName: String, drone: Drone? = nil, isLockedDown: Bool, securityCode: String) {
        self.isLockedDown = isLockedDown
        self.securityCode = securityCode
        super.init(moduleName: moduleName, drone: drone)
    }
    
    fileprivate func lockdown(password: String) {
        if password == securityCode {
            isLockedDown = true
            print("The Control Center has been locked down.")
        } else {
            print("The password you have provided is incorrect. Lockdown attempt failed.")
        }
    }
    
    func showLockdownStatus() {
        if isLockedDown == true {
            print("The Control Center is locked down.")
        } else {
            print("The Control Center is not locked.")
        }
    }
}

private let exoControlCenter = ControlCenter(moduleName: "Control Center", isLockedDown: false, securityCode: "01010100 01001111 01010011 01010011 01000110 01001101 01001111 01000111 01001100 01000110 01001101")

//🛰️ "Remember all the cool facts about XO-5b from Wikipedia? Well, they were all first gathered here at the ResearchLab before it finally reached the Earth few hundred light years later." 🛰️

class ResearchLab: StationModule {
    var researchSamples: [String] = []
    
    init(moduleName: String, drone: Drone? = nil, researchSamples: [String]) {
        self.researchSamples = researchSamples
        super.init(moduleName: moduleName, drone: drone)
    }
    
    func addSample(newsample: String) {
        researchSamples.append(newsample)
    }
}

let exoResearchLab = ResearchLab(moduleName: "Research Lab", researchSamples: [])

//🛰️ "We are very well aware of the terrible dependency you humans have on oxygen, so we did build a system to keep you alive. Don't worry, you will be hearing an annoying beeping sound to notify you in case we reach a critical level." 🛰️

class LifeSupportsystem: StationModule {
    var oxygenLevel: Int
    
    init(moduleName: String, drone: Drone? = nil, oxygenLevel: Int) {
        self.oxygenLevel = oxygenLevel
        super.init(moduleName: moduleName, drone: drone)
    }
    
    func showOxygenLevels() {
        if oxygenLevel <= 10 {
            print("Critical oxygen levels")
        } else if oxygenLevel > 10 && oxygenLevel <= 25 {
            print("Optimal oxygen levels")
        } else if oxygenLevel > 25 {
            print("High concentration of oxygen, please consider taking action before we reach a critical point")
        }
    }
}

let exoLifeSupportSystem = LifeSupportsystem(moduleName: "Life Support System", oxygenLevel: 19)

// 🛰️ "To check oxygen levels, just press this button: showOxygenLevels() 🛰️
exoLifeSupportSystem.showOxygenLevels()
//🛰️ "See? Oxygen levels are optimal. We were very much expecting you." 🛰️

//🛰️ "Let me introduce you to our kind: Drones. We might or might not have a task assigned to us at times, but we appear busy regardless, sorta like you, humans. We do have a built-in method to check what task we are currently assinged to. You just have to press this button to check: checkDroneTasks()" 🛰️

class Drone {
    var task: String?
    unowned var assignedModule: StationModule
    weak var missionControlLink: MissionControl?
    
    init(task: String? = nil, assignedModule: StationModule, missionControlLink: MissionControl? = nil) {
        self.task = task
        self.assignedModule = assignedModule
        self.missionControlLink = missionControlLink
    }
    
    func checkDroneTasks() {
        if task == nil {
            print("No tasks have been given to the drone at this time")
        } else {
            print("The task given to the drone: \(String(describing: task))")
        }
    }
}

//🛰️ "Oh, look! Here I am along with my colleagues:" 🛰️

let exoControlCenterDrone = Drone(task: nil, assignedModule: exoControlCenter)
let exoResearchLabDrone = Drone(task: nil, assignedModule: exoResearchLab)
let exoLifeSupportDrone = Drone(task: nil, assignedModule: exoLifeSupportSystem)

//🛰️ "As you can see, I was assigned to greet you upon arrival. Don't you think I'm doing a marvelous job?" 🛰️

exoControlCenterDrone.task = "Greet any humans upon arrival, show the human around; Identify possible threats and ensure general security of Control Center. Give the human private access after the tour."
exoResearchLabDrone.task = "Collect research samples from Exo planets currently in scope"
exoLifeSupportDrone.task = "Monitor oxygen levels"

exoControlCenterDrone.checkDroneTasks()
exoResearchLabDrone.checkDroneTasks()
exoLifeSupportDrone.checkDroneTasks()

// 🛰️ "HEY! Stop pressing all the buttons!" 🛰️

// 🛰️ "You may find all the essential components of our space station here. Isn't it all fascinating?" 🛰️

class OrbitronSpaceStation {
    var controlCenter: ControlCenter
    var researchLab: ResearchLab
    var lifeSupportSystem: LifeSupportsystem
    var controlCenterDrone: Drone
    var researchLabDrone: Drone
    var lifeSupportDrone: Drone
    
    init(controlCenter: ControlCenter, researchLab: ResearchLab, lifeSupportSystem: LifeSupportsystem, controlCenterDrone: Drone, researchLabDrone: Drone, lifeSupportDrone: Drone) {
        self.controlCenter = controlCenter
        self.researchLab = researchLab
        self.lifeSupportSystem = lifeSupportSystem
        self.controlCenterDrone = controlCenterDrone
        self.researchLabDrone = researchLabDrone
        self.lifeSupportDrone = lifeSupportDrone
    }
    
    fileprivate func lockDownControlCenter(password: String) {
        controlCenter.lockdown(password: password)
    }
}

let exoSpaceStation = OrbitronSpaceStation(
    controlCenter: exoControlCenter,
    researchLab: exoResearchLab,
    lifeSupportSystem: exoLifeSupportSystem,
    controlCenterDrone: exoControlCenterDrone,
    researchLabDrone: exoResearchLabDrone,
    lifeSupportDrone: exoLifeSupportDrone
)

//🛰️ "Here's our Mission Control. You can check many things from here. You can establish contact with the Space Station from here and get all the essential information!" 🛰️

class MissionControl {
    var spaceStation: OrbitronSpaceStation?
    
    init(spaceStation: OrbitronSpaceStation? = nil) {
        self.spaceStation = spaceStation
    }
    
    func mcContactOrbitron() {
        print("Mission Control is in contact with Orbitron")
        
    }
    
    func mcRequestControlCenterStatus() {
        if let controlCenter = spaceStation?.controlCenter {
            controlCenter.showLockdownStatus()
        }
    }
    
    func mcRequestOxygenStatus() {
        if let spaceStation = spaceStation {
            let lifeSupportSystem = spaceStation.lifeSupportSystem
            lifeSupportSystem.showOxygenLevels()
        } else {
            print("no space station available")
        }
    }
    
    func mcRequestDroneTask(drone: Drone) {
        drone.checkDroneTasks()
    }
}

let exoMissionControl = MissionControl(spaceStation: exoSpaceStation)

exoMissionControl.mcContactOrbitron()
exoMissionControl.mcRequestControlCenterStatus()


// 🛰️ "Our tour is officially over and you have been granted the private access. Let's see how quick you password input skills are: see if you can lock down the Control Center!" 🛰️

exoControlCenter.lockdown(password: "01010100010011110101001101010011010001100100110101001111 01000111010011000100011001001101")

//🛰️ "Ah, the password is incorrect, look:" 🛰️
exoControlCenter.showLockdownStatus()

//🛰️ "Go on, try again and don't forget to use Spaces. After all, we are in SPACE" 🛰️

exoControlCenter.lockdown(password: "01010100 01001111 01010011 01010011 01000110 01001101 01001111 01000111 01001100 01000110 01001101")
exoControlCenter.showLockdownStatus()

//🛰️ "EXOtraordinary !"


