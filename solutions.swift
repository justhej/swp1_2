//////////////////////////////////
// 1.2.1 composing a new behaviour
// Noob

func turnRight(){
    turnLeft()
    turnLeft()
    turnLeft()
}

while !isOnGem{
    moveForward()
    if isBlocked{
        turnRight()
    }
}

collectGem()

// Pro

func turnRight() {
    (1...3).forEach { _ in turnLeft()}
}

while !isOnGem{
    (isBlocked ?  turnRight() : moveForward())
}

collectGem()

//////////////////////////////////
// 1.2.2: Creating a new function
// Noob

var steps = 0 
while !isOnClosedSwitch{
    isBlocked ? turnLeft() : moveForward()
    steps += 1
    if steps == 3 || steps == 4 || steps == 5 {
        turnRight()
    }
    if steps == 6 {
        turnLeft()
        
    }
    if isOnClosedSwitch {
        toggleSwitch()
        break
    }
    
}

// Pro

var steps = 0
let RturnSteps = [ 3, 4, 5]

while !isOnClosedSwitch{
    isBlocked ? turnLeft() : moveForward()
    steps += 1
    if RturnSteps.contains(steps) {turnRight() }
    if steps == 6 {turnLeft()}
    if isOnClosedSwitch { 
        toggleSwitch() 
        break }

}


// Hej-level

var steps = 0
let RturnSteps = [3, 4, 5]

while !isOnClosedSwitch {
    isBlocked ? turnLeft() : moveForward()
    steps += 1
    RturnSteps.contains(steps) ? turnRight() : (steps == 6 ? turnLeft() : ())
    if isOnClosedSwitch { toggleSwitch(); break }
}

//////////////////////////////////
// 1.2.3 Collect, toggle, repeat
// noob

func collTogg() {
	if isOnGem {
	            collectGem()
	        }
	        if isOnClosedSwitch {
	            toggleSwitch()
	        }
  
}

for _ in 1...4 {
    while !isBlocked {
        moveForward()
        collTogg()
    }
    turnLeft()
}

// pro

func collTogg(){
	moveForward()
	isOnGem ? collectGem() : ()
	isOnClosedSwitch ? toggleSwitch() : () 
}

(1...4).forEach { _ in while !isBlocked {collTogg()}; turnleft()}

//////////////////////////////////
// 1.2.5 Across the board
// noob

func harvest(){
	collectGem()
	moveForward()
}

var gems = 0

while gems < 8 {
   harvest()
   gems += 1
   if isBlocked {
       turnRight()
   }
   if gems == 7{
       turnRight()
       harvest()
   }
}

// pro

func harvest(){
	collectGem()
	moveForward()
}

for gems in 1...8 {
    harvest()
    if isBlocked { turnRight() }
    if gems == 7 { turnRight(); harvest() }
}

//////////////////////////////////
// 1.2.6 Nesting patterns:
// noob

func turnAround(){
	turnLeft()
	turnLeft()
}

func solveStair(){
	moveForward()
	collectGem()
	turnAround()
	moveForward()
	turnRight()
}

for k in 1...4{
	solveStair()
}


// better but this puzzle does not
// allow for any other solution.

func turnAround(){
	turnLeft()
	turnLeft()
}

for gem in 1...4{
	moveForward()
	collectGem()
	turnAround()
	moveForward()
	turnRight()
}

//////////////////////////////////
// 1.2.7 Slotted stairways:
// noob

func collectGemTurnAround(){
		moveForward()
	    moveForward()
	    collectGem()
	    turnLeft()
	    turnLeft()
	    moveForward()
	    moveForward()
}

func solveRow(){
		collectGemTurnAround()
	    collectGemTurnAround()
	    turnRight()
	    moveForward()
	    turnLeft()
}

for k in 1...3{
	solveRow()
}

// fine-tuned control

var gems = 0 
var steps = 0
while gems < 6 {
    moveForward()
    steps += 1
    if isOnGem{
        collectGem()
        gems += 1
    }
    if isBlocked{
        turnLeft()
        turnLeft()
    }
    if steps == 8 || steps == 16 || steps == 24 {
        turnRight()
        moveForward()
        turnLeft()
    }
}

/// Pro

var steps = 0
for k in 1...28 {
    if isOnGem {
        collectGem()
    }
    if isBlocked {
        turnLeft()
        turnLeft()
        continue
    }
    moveForward()
    steps += 1
    if [8, 16, 24].contains(steps) {
        turnRight()
        moveForward()
        turnLeft()
    }
}

/// Hej

func turnAround(){
    turnLeft()
    turnLeft()
}

var steps = 0
    while steps < 22 {
        moveForward()
        steps += 1
        isOnGem ? collectGem() : ()
        isBlocked ? turnAround() : ()
       if [8, 16, 24].contains(steps){
            turnRight()
            moveForward()
            turnLeft()
        }
         
    }
   
//////////////////////////////////
// 1.2.8 Treasure Hunt
// modular noob

var steps = 0
var switches = 0
turnRight()

func turnAround() {
    turnLeft()
    turnLeft()
}

func handleSwitch() {
    if isOnClosedSwitch {
        toggleSwitch()
        switches += 1
    }
}

func handleObstacle() {
    if isBlocked {
        turnAround()
    }
}

while switches < 6 {
    moveForward()
    steps += 1
    handleSwitch()
    handleObstacle()
    if steps == 16 {
           turnRight()
    }
}


/// philosophical

func turnAround(){
    turnLeft() 
    turnLeft()
}

var steps = 0
var switches = 0
turnRight()

while switches < 6 {
    moveForward()
    steps += 1
    if isOnClosedSwitch {
        toggleSwitch()
         switches += 1
    }
    isBlocked ? turnAround() : ()
    if steps == 16 {
        turnRight()
    }
   
}

// using inout

func turnAround() {
    turnLeft()
    turnLeft()
}

func moveAndHandle(steps: inout Int, switches: inout Int) {
    moveForward()
    steps += 1
    if isOnClosedSwitch {
        toggleSwitch()
        switches += 1
    }
    if isBlocked {
        turnAround()
    }
    if steps == 16 {
        turnRight()
    }
}

var steps = 0
var switches = 0
turnRight()

while switches < 6 {
    moveAndHandle(steps: &steps, switches: &switches)
}


/// pro 
func turnAround() {
    turnLeft()
    turnLeft()
}

for step in 1...20{
    moveForward()
    isBlocked ? turnAround() : ()
    step == 8 ? turnRight() : ()
    if [2, 6, 10, 12, 18, 20].contains(step){
        toggleSwitch()
    }
    
}

/// hej

for step in 1...20 {
    moveForward()
    if isOnClosedSwitch { toggleSwitch() }
    if isBlocked { turnLeft(); turnLeft() }
    if step == 8 { turnRight() }
}









