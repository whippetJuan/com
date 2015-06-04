//whippet_disclaimer_AS2.as
//
//Disclaimer text code - Monday 04 May 2015
//This code renders dynamic text for diclaimer texts.
//``
//BEWARE of tight layout or large font size as end result will vary on each browser.
//
trace ("-----> file 'whippet_disclaimer_AS2.as' loaded");
//
// ********************************************************************************   
//
//	DO NOT UPDATE CODE BELOW 
//
// ********************************************************************************
//
//
// *************	Presets required - Use this to update fontsize, position and sizes
//
var showLogo:Boolean = TCs_showLogo; // 'false' = show logo, 'true' = hide logo.
var offsetTop:Number = TCs_offsetTop;// Position for top of banner
var offsetLeft:Number = TCs_offsetLeft;//Position for Left side
var offsetRight:Number = TCs_offsetRight; // Use for text box "Width" - Use high numbers to minimise risk text spilling.
var TCsFontSize:Number = TCs_fontSize;//Font size for "Terms and Conditions" and "Disclaimer".
var fontLeading:Number = TCs_fontLeading;//Change as desired - test on IE, Chrome, Safari.
var fontKerning:Number = TCs_fontKerning;//Change as desired - test on IE, Chrome, Safari.
//
//Added 27 May 2015
var jobNumberXPos:Number = jobNumber_XPos;

//
var WSize:Number = Stage.width;//trace(WSize + "<---- width");
var HSize:Number = Stage.height;//trace(HSize + "<---- height");
var centreH =  WSize;//Stage.height / 2;
var centreW =  HSize;//Stage.width / 2;
var centreX = WSize/2;
var centreY = HSize/2;
//
function renderTextDynamic(){
		txtBox._y = -2000;
		//
		var resizeText = txtBoxHeading.getTextFormat();
		resizeText.size = TCsFontSize;
		txtBoxHeading.setTextFormat(resizeText);
		//
		this.createTextField("txtDynamic", 0, 0, 1, WSize - offsetRight, 0);
		//Formating
		var txtFormat:TextFormat = new TextFormat();
		txtFormat.size = TCsFontSize; //Do not change
		txtFormat.font = "_sans" // Leave "_sans" - else embed fonts
		txtFormat.color = 0x000000;//Hex colours
		//txtFormat.letterSpacing = fontKerning;
		txtFormat.leading = fontLeading; 
		txtDynamic.multiline = true;
		txtDynamic.wordWrap = true;
		txtDynamic.html = true;
		txtDynamic.text = txtBox.text;
		embeddedTextBox.text = txtBox.text;//embeddedTextBox
		txtDynamic.selectable = false;
		txtDynamic.setTextFormat(txtFormat);
		txtDynamic.autoSize = true;
		txtDynamic._height;
		txtDynamic._y = (HSize - txtDynamic._height )/2;
		txtDynamic._y = offsetTop;
		txtDynamic._x = offsetLeft;		
}

function positionLogo() {
		logo._visible = showLogo;
		logo._x = _root.contentMC.logo._x;
		logo._y = _root.contentMC.logo._y;
	
}


positionLogo();
renderTextDynamic();
