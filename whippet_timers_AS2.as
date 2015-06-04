//whippet_timers_AS2.as 
//
//Timers and looping code - setup Monday 04 May 2015
//This code alllows timers along timeline using "pauseFor(.5);//seconds"
//`
//BEWARE of "delays", "onComplete" as these get delayed/disengaged from time when tabs are open within browsers.
//
//
trace ("-----> file 'whippet_global_AS2.as' loaded");
// ********************************************************************************   
//
//	DO NOT UPDATE CODE BELOW 
//
// ********************************************************************************
//
// *************	Reset the clips inside the content. 
function reset(){
	for(var i in contentMC){
			//Stop and hide all movies/content at frame 1;
			this.contentMC[i].gotoAndStop(1);
			this.contentMC[i]._visible = false;
			this.contentMC[i]._alpha = 0;
			this.contentMC.logo._visible = true;	
			this.contentMC.base._visible = true;
			this.contentMC.base._alpha = 100;	
			this.contentMC[i]._xscale = 100;
			this.contentMC[i]._yscale = 100;
	}
}
// Looping - Do not update
_global.loopCount = 0;
_global.replay = bannerReplay;
_global.loopMax = loopLimit;

var WSize:Number = Stage.width;
var HSize:Number = Stage.height;
var centreH =  WSize;
var centreW =  HSize;
var centreX = WSize/2;
var centreY = HSize/2;
//
// *************	Dynamic Keyline border and SWF background colour.
//
var keylineColour = borderKeyline;
this.createEmptyMovieClip("clickTagKeyline", 1);
this.clickTagKeyline.lineStyle(1, keylineColour, 100, true, "none", "round", "miter", 1);
this.clickTagKeyline.beginFill(0x000000, 0);//clickTagKeyline
this.clickTagKeyline.moveTo(0, 0);
this.clickTagKeyline.lineTo(WSize - 1, 0);
this.clickTagKeyline.lineTo(WSize - 1, HSize - 1);
this.clickTagKeyline.lineTo(0, HSize - 1);
this.clickTagKeyline.lineTo(0, 0);
this.clickTagKeyline.endFill();
//
// *************	Dynamic Background and clickThrough Button.
//
emptyMC.createEmptyMovieClip("clickBTN", 1);
emptyMC.clickBTN.beginFill(baseColour, 100);
emptyMC.clickBTN.moveTo(0, 0);
emptyMC.clickBTN.lineTo(WSize - 1, 0);
emptyMC.clickBTN.lineTo(WSize - 1, HSize - 1);
emptyMC.clickBTN.lineTo(0, HSize - 1);
emptyMC.clickBTN.lineTo(0, 0);
emptyMC.clickBTN.endFill();
//
// *************	Actions for clickthrough button:
//
emptyMC.clickBTN.onRelease = function(){
	EBStd.Clickthrough();
}
//
emptyMC.clickBTN.onRollOver = function(){
	rollOverButton();
}
//
// *************	Effect for "CTA button"
//
function rollOverButton (){
	var ctaBTN = contentMC.CTA;
	var percent:Number = CTARollOverPercent;
	new Tween(ctaBTN, "_xscale", Regular.easeInOut, 100, percent, 4, false);
	var CTARollOver:Tween = new Tween(ctaBTN, "_yscale", Regular.easeInOut, 100, percent, 4, false);
		CTARollOver.onMotionFinished = function (){
			new Tween(ctaBTN, "_xscale", Regular.easeInOut, percent, 100, 6, false);
			new Tween(ctaBTN, "_yscale", Regular.easeInOut, percent, 100, 6, false);
		}
}
//
// *************	Disclaimer presets and button actions
//
disclaimer._visible = false;
this.disclaimer.txtBox.text = disclaimerHeadline + " \n" + disclaimerCopy;
this.disclaimer.txtBoxjobNumber.text = jobNumber;




disclaimer._x = 0;
disclaimer.base._width = WSize;
disclaimer.base._height = HSize;
//
function disclaimerFadeIn(){
	if(disclaimer._visible == false){
		btn_disclaimer._visible = true;
		btn_disclaimer._alpha = 0;
		new Tween(btn_disclaimer, "_alpha", Regular.easeIn, 0, 100, 10, false);
	}
	else{
		
	}
}

////Added 27 May 2015
function positionJobNumberX(pos:String){
	switch (pos){
	case("left"):
		this.disclaimer.txtBoxjobNumber._x =  0 + jobNumberLeftRightOffset;
		//trace ("Position Left");
		break;
	case("right"):		
		this.disclaimer.txtBoxjobNumber._x =  (WSize- 50) - jobNumberLeftRightOffset;
		//trace ("Position Right");
		break;		
	}
}
function positionJobNumberY(pos:String){
	switch (pos){
	case("top"):
		this.disclaimer.txtBoxjobNumber._y =  0 + jobNumberTopBottomOffset;
		//trace ("Position top");
		//break;
	case("bottom"):		
		this.disclaimer.txtBoxjobNumber._y =  (HSize - 14) - jobNumberTopBottomOffset;
		//trace ("Position bottom");
		break;		
	}
	
	
}


//
// *************	Button actions for Disclaimer
//
function disclaimerType(embedd:Boolean){
	switch(embedd){
		case(true):
		//trace ("Hide the dynamic textBox and show the embedded version");
		disclaimer.txtDynamic._visible = false;
		break;
		case(false):
		//trace ("Show the dynamic textBox")
		disclaimer.embeddedTextBox._visible = false;
		break;
	}

}



btn_disclaimer.onRollOver = function (){
	btn_disclaimer._alpha = 0;
	btn_disclaimer.txtBox._visible = false;
	disclaimer._visible = true;
	disclaimer._alpha = 100;
	//
	positionJobNumberX(jobNumberLeftRight);
	positionJobNumberY(jobNumberTopBottom);
	//
	disclaimerType(embedDisclaimerText);
	
	
}
btn_disclaimer.onRollOut = function (){
	disclaimer._visible = false;
	btn_disclaimer.txtBox._visible = true;
	this._alpha = 100;
	disclaimerFadeIn();
	
}
//
// *************	Reset banner and call function to flush-out timers;
reset();
startTimers();
//Trace 
var replayStatus:Boolean = bannerReplay; // Variable for replaying
trace ("Banner is replaying:  " + replayStatus)	
