var xPositions = [];
var yPositions = [];
var dropColors = [];
var dropSpeeds = [];
var dropSizes = [];

var dropNum = 255;
var lightningProb = 1;

var loadDrops = function(){
    
    xPositions = [];
    yPositions = [];
    dropColors = [];
    dropSpeeds = [];
    dropSizes = [];
    
    for (var n = 0; n < dropNum; n++){
      xPositions.push(random(-4, screen.width));
      yPositions.push(random(-4, screen.height));
      dropColors.push(random(0, 150));
      dropColors.push(random(60, 200));
      dropColors.push(random(200, 255));
      dropSpeeds.push(random(5, 15));
      dropSizes.push(random(8, 10));
    }
};

void setup() {
 size(screen.width, screen.height);
}

mouseClicked = function(){
    dropNum += 5;
    loadDrops();
};

//adding information for n many raindrops

loadDrops();

draw = function() {
    background(150, 222, 235);
    
    //drawing each raindrop
    for (var i = 0; i < xPositions.length; i++) {
        noStroke();
        if (yPositions[i] > screen.height) {
            yPositions[i] = -10;
        }
        if (xPositions[i] > screen.width) {
            xPositions[i] = -10;
        }
        
        fill(
            dropColors[3 * i ], 
            dropColors[3 * i + 1], 
            dropColors[3 * i + 2]
        );
            
        ellipse(xPositions[i], yPositions[i], dropSizes[i], dropSizes[i]);
        triangle(
            xPositions[i] - 5, yPositions[i],
            xPositions[i] + 5, yPositions[i],
            xPositions[i] - 2, yPositions[i] - 10
        );
        
        yPositions[i] += dropSpeeds[i];
        xPositions[i] += 0.4 * dropSpeeds[i];
    }
    
    //randomly making lightning appear (about once every 60 frames)
    var lightning = random(0, 100);
    if (lightning < lightningProb){
        fill(255, 255, 0);
        var lightningShift = random(-50, screen.width);
        
        triangle(
            72 +  lightningShift, 400,
            86 +  lightningShift, 189,
            114 +  lightningShift, 141
        );
        
        triangle(
            86 +  lightningShift, 189,
            114 +  lightningShift, 141,
            42 +  lightningShift, 133
        );
        
        triangle(
            42 +  lightningShift, 133,
            115 +  lightningShift, 146,
            32 +  lightningShift, -11
        );
        
        triangle(
            60 +  lightningShift, 135,
            34 +  lightningShift, -11,
            148 +  lightningShift, -16
        );
    }
    
    //drawing clouds at the top
    fill(99, 95, 99);
    for (var cloudX = 0; cloudX < screen.width; cloudX += 50){
        ellipse(cloudX, 0, 100, 100);
    }
};