//whippet_timers_AS2.as 
//
//Timers and looping code - setup Monday 04 May 2015
//This code alllows timers along timeline using "pauseFor(.5);//seconds"
//`
//BEWARE of "delays", "onComplete" as these get delayed/disengaged from time when tabs are open within browsers.
//
//
trace ("-----> file 'whippet_timers_AS2.as' loaded");
// *******************************************************************************  
//
//	DO NOT UPDATE CODE BELOW 
//
// *******************************************************************************
this.createEmptyMovieClip("timer",50);
timer.onEnterFrame = function(){
	this._alpha = 100;
        if (this.startTime>0){
                var diff = getTimer()-this.startTime;
                if (diff>this.timerLength){
                        this.target.play();
                        this.startTime = 0;
                }
        }
};
//
// ************		Pause
function pauseFor(theTime){
		var timeInSeconds = (theTime * 1000);
        stop();
        timer.timerLength = timeInSeconds;
        timer.startTime = getTimer();
        timer.target = this;
}
// ************		Looping
//
function bannerLoop(){
	
	loopCount++;
	trace ("loopCount: " + loopCount);
	//
	if(loopCount >= loopMax || replay == false){
		replay = false;
		trace ("you have reached limit played: " + loopCount )
	}
	else if (loopMax == "forever"){
		replay = true;
		
	}

}
//
// ************		Check lenght banner
//
time1 = new Date();
function checkBannerLength(loopType){
	var type:String = loopType;
	time2 = new Date();
	//
	if(type == "once" && loopCount == 1 ){//assures looped traces once only
		trace("When Single play time = " + (time2.getTime()-time1.getTime()) / 1000   +" Seconds" );
	}
	else if (type == "loop" && loopCount == 1  ){//assures looped traces once only
		trace("When Looped banner time = " + (time2.getTime()-time1.getTime()) / 1000   +" Seconds" );
		
	}

}



