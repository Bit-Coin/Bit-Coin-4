var TRACK_TIGUTILS = true;

function __doSubmit(target, event)
{
	if (event.keyCode==13)
	{
		document.getElementById(target).click();
		if (window.event)
			window.event.returnValue = null; 
		else
			event.preventDefault();
	}
}

function isValidEmail(email)
{
	var regex = new RegExp("^[\\w-_\.]*[\\w-_\.]\@[\\w]\.+[\\w]+[\\w]$");
	if (!regex.test(email))
	{
		return false;
	}
	return true;
}

function validateEmail(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	var email = window.document.getElementById(parentid+"txtEmail").value.trim();
	if (!isValidEmail(email))
	{
		alert("Please enter a valid email address.");
		return false;
	}
	return true;
}
function NewsletterSubscription_onkeypress(control)
{
	if (window.event && window.event.keyCode == 13)
	{
		var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
		var btn = window.document.getElementById(parentid+"btnGo");
		btn.click();
		return false;
	}
	return true;
}
// this function is obselete, dont't use this one, 
function SearchKeyword_onkeypress(control)
{
	if (window.event && window.event.keyCode == 13)
	{
		var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
		var btn = window.document.getElementById(parentid+"btnSearchNow");
		btn.click();
		return false;
	}
	return true;
}
function SearchKeywordOnKeyPress(control, e)
{
	if (!e) e = window.event;
		
	if (e.keyCode==13)
	{		
		var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
		var btn = window.document.getElementById(parentid+"btnSearchNow");
		btn.click();

		if (window.event)
			window.event.returnValue = null; 
		else
			e.preventDefault();
		return false;
	}		
	return true;
}
function BikeSearchNew_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	if (window.document.getElementById(parentid+"cboMake").value == "All" &&
		window.document.getElementById(parentid+"cboPrice1").value == "-1" &&
		window.document.getElementById(parentid+"cboPrice2").value == "-1" &&
		window.document.getElementById(parentid+"cboBiketype").value == "All" &&
		window.document.getElementById(parentid+"cboCapacity").value == "0,9999")
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	return true;
}
function BikeSearchUsed_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	if (window.document.getElementById(parentid+"cboMake").value == "0" &&
		window.document.getElementById(parentid+"cboLocation").value == "0" &&
		window.document.getElementById(parentid+"cboPrice1").value == "-1" &&
		window.document.getElementById(parentid+"cboPrice2").value == "-1" &&
		window.document.getElementById(parentid+"cboBiketype").value == "0" &&
		window.document.getElementById(parentid+"cboCapacity").value == "0,0" &&
		window.document.getElementById(parentid+"cboYear1").value == "-2" &&
		window.document.getElementById(parentid+"cboYear2").value == "-2" &&
		window.document.getElementById(parentid+"cboCreatedDate").value == "0" &&
		window.document.getElementById(parentid+"txtKeywords").value.trim() == "")
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	return true;
}
function BikeSearchHome_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	if (window.document.getElementById(parentid+"cboMake").value == "0" &&
		window.document.getElementById(parentid+"cboLocation").value == "0" &&
		window.document.getElementById(parentid+"cboPrice1").value == "-1" &&
		window.document.getElementById(parentid+"cboPrice2").value == "-1" &&
		window.document.getElementById(parentid+"txtUKeywords").value.trim() == "")
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	return true;
}
function CarSearchQuick_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	if (window.document.getElementById(parentid+"cboMake").value == "0" &&
		window.document.getElementById(parentid+"cboLocation").value == "0" &&
		window.document.getElementById(parentid+"txtUKeywords").value.trim() == "")
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	return true;
}
function CarSearchUsed_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	if (window.document.getElementById(parentid+"cboMake").value == "0" &&
		window.document.getElementById(parentid+"cboLocation").value == "0" &&
		window.document.getElementById(parentid+"cboPrice1").value == "-1" &&
		window.document.getElementById(parentid+"cboPrice2").value == "-1" &&
		window.document.getElementById(parentid+"cboBodytype").value == "0" &&
		window.document.getElementById(parentid+"cboTransmission").value == "0" &&
		window.document.getElementById(parentid+"cboYear1").value == "-2" &&
		window.document.getElementById(parentid+"cboYear2").value == "-2" &&
		window.document.getElementById(parentid+"cboCreatedDate").value == "0" &&
		window.document.getElementById(parentid+"txtKeywords").value.trim() == "")
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	return true;
}
function CarSearchNew_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	if (window.document.getElementById(parentid+"cboMake").value == "All" &&
		window.document.getElementById(parentid+"cboBodytype").value == "" &&
		window.document.getElementById(parentid+"cboCategory").value == "" &&
		window.document.getElementById(parentid+"cboTransmission").value == "" &&
		window.document.getElementById(parentid+"cboPrice1").value == "-1" &&
		window.document.getElementById(parentid+"cboPrice2").value == "-1")
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	return true;
}
function CarSearchHome_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	if (window.document.getElementById(parentid+"cboMake").value == "0" &&
		window.document.getElementById(parentid+"cboLocation").value == "0" &&
		window.document.getElementById(parentid+"cboPrice1").value == "-1" &&
		window.document.getElementById(parentid+"cboPrice2").value == "-1")
		
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	return true;
}
function BoatReviewSearch_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	
	var regExPattern = "^(([0-9]+[.][0-9]*)|([0-9]*[.][0-9]+)|([0-9]+))$"
	var regex = new RegExp(regExPattern);
	
	var lengthFrom = window.document.getElementById(parentid+"txtLengthFrom").value.trim();
	var lengthTo = window.document.getElementById(parentid+"txtLengthTo").value.trim();
		
	if (window.document.getElementById(parentid+"cboBoatPower").value == "" &&
		window.document.getElementById(parentid+"cboBoatHull").value == "" &&
		(lengthFrom == "0" || lengthFrom == "") &&
		(lengthTo == "0" || lengthTo == "") &&
		window.document.getElementById(parentid+"cboPrice1").value == "0" &&
		window.document.getElementById(parentid+"cboPrice2").value == "0" &&
		window.document.getElementById(parentid+"txtMakeModel").value == "")
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	
	//Validate the length field. 
	if (!regex.test(lengthFrom) || !regex.test(lengthTo))
	{
		alert("Please enter a valid boat length.");
		return false;
	}
	return true;
}
function DealerEnquiry_ValidateFields(control, isPostCodeMandatory)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	var msg = "";
	if (window.document.getElementById(parentid+"txtName").value.trim() == "")
		msg += "- Please enter your name\n";
	var email = window.document.getElementById(parentid+"txtEmail").value.trim();
	if (email == "" || !isValidEmail(email))
		msg += "- Please enter a valid e-mail address\n";
	if (window.document.getElementById(parentid+"txtHomePhone").value.trim() == "" &&
		window.document.getElementById(parentid+"txtBusinessPhone").value.trim() == "" &&
		window.document.getElementById(parentid+"txtMobile").value.trim() == "")
		msg += "- Please enter at least one phone number\n";
	if (window.document.getElementById(parentid+"cboState").value == "0")
		msg += "- Please select a region\n";
	if (window.document.getElementById(parentid+"txtPostcode").value.trim() == "" && isPostCodeMandatory)
		msg += "- Please enter your postcode\n";
	if (msg != "")
	{
		msg = "Correct these errors first before sending your message:\n" + msg;
		alert(msg);
		return false;
	}
	return true;
}
function DealerEnquirySimple_ValidateFields(control, isPostCodeMandatory, isPhoneMandatory, validatePhoneNumber)
{	
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	var msg = "";
	if (window.document.getElementById(parentid+"txtName").value.trim() == "")
		msg += "- Please enter your name\n";
	var email = window.document.getElementById(parentid+"txtEmail").value.trim();
	if (email == "" || !isValidEmail(email))
		msg += "- Please enter a valid e-mail address\n";
	if (isPhoneMandatory)
	{
		if (window.document.getElementById(parentid+"txtHomePhone").value.trim() == "")
			msg += "- Please enter a contact number\n";
		else if (validatePhoneNumber)
		{
		    var phoneElement = window.document.getElementById(parentid+"txtHomePhone");
		    var phoneNum = phoneElement.value.replace(/\s/g, "");

		    if (isNaN(phoneNum))
		        msg += "- Please enter a valid contact number containing numbers only\n";
		}
		else
		{
		}
		
			
	}
	if (window.document.getElementById(parentid+"cboState").value == "0")
		msg += "- Please select a region\n";
	if ( window.document.getElementById(parentid+"txtPostcode") != null
			&& isPostCodeMandatory 
			&& window.document.getElementById(parentid+"txtPostcode").value.trim() == "" )
		msg += "- Please enter your postcode\n";

	if (msg != "")
	{
		msg = "Correct these errors first before sending your message:\n" + msg;
		alert(msg);
		return false;
	}
	return true;
}
function BoatSearchHome_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	
	var regExPattern = "^(([0-9]+[.][0-9]*)|([0-9]*[.][0-9]+)|([0-9]+))$"
	var regex = new RegExp(regExPattern);
	
	var lengthFrom = window.document.getElementById(parentid+"txtLengthFrom").value.trim();
	var lengthTo = window.document.getElementById(parentid+"txtLengthTo").value.trim();
	if (window.document.getElementById(parentid+"cboBoatType").value == "" &&
		window.document.getElementById(parentid+"cboPrice1").value == "-1" &&
		window.document.getElementById(parentid+"cboPrice2").value == "-1" &&
		window.document.getElementById(parentid+"txtKeywords").value.trim() == "" &&
		(lengthFrom == "0" || lengthFrom == "") &&
		(lengthTo == "0" || lengthTo == ""))
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	//Validate the length field. 
	if (!regex.test(lengthFrom) || !regex.test(lengthTo))
	{
		alert("Please enter a valid boat length.");
		return false;
	}
	return true;
}
function BoatSearchNew_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	
	var regExPattern = "^(([0-9]+[.][0-9]*)|([0-9]*[.][0-9]+)|([0-9]+))$"
	var regex = new RegExp(regExPattern);
	
	var lengthFrom = window.document.getElementById(parentid+"txtLengthFrom").value.trim();
	var lengthTo = window.document.getElementById(parentid+"txtLengthTo").value.trim();
	var power = window.document.getElementById(parentid+"cboPower").value;
	var hull = window.document.getElementById(parentid+"cboHull").value
		
	if (window.document.getElementById(parentid+"cboPower").value == "" &&
		window.document.getElementById(parentid+"cboHull").value == "" &&
		window.document.getElementById(parentid+"cboMake").value == "All" &&
		window.document.getElementById(parentid+"cboCategory").value == "" &&
		window.document.getElementById(parentid+"cboUsage").value == "" &&
		(lengthFrom == "0" || lengthFrom == "") &&
		(lengthTo == "0" || lengthTo == ""))
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	
	if ((power != "" && hull == "") || (hull != "" && power== ""))
	{
		alert("Please select both power and hull to begin your search.");
		return false;
	} 
	
	//Validate the length field. 
	if (!regex.test(lengthFrom) || !regex.test(lengthTo))
	{
		alert("Please enter a valid boat length.");
		return false;
	}
	return true;
}
function BoatSearchUsed_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	
	var regExPattern = "^(([0-9]+[.][0-9]*)|([0-9]*[.][0-9]+)|([0-9]+))$"
	var regex = new RegExp(regExPattern);
	
	var lengthFrom = window.document.getElementById(parentid+"txtLengthFrom").value.trim();
	var lengthTo = window.document.getElementById(parentid+"txtLengthTo").value.trim();
		
	if (window.document.getElementById(parentid+"cboPower").value == "" &&
		window.document.getElementById(parentid+"cboHull").value == "" &&
		window.document.getElementById(parentid+"cboUsage").value == "0" &&
		window.document.getElementById(parentid+"cboLocation").value == "0" &&
		window.document.getElementById(parentid+"cboPrice1").value == "-1" &&
		window.document.getElementById(parentid+"cboPrice2").value == "-1" &&		
		window.document.getElementById(parentid+"cboCreatedDate").value == "0" &&
		window.document.getElementById(parentid+"txtKeywords").value.trim() == "" &&
		window.document.getElementById(parentid+"txtMake").value.trim() == "" &&
		(lengthFrom == "0" || lengthFrom == "") &&
		(lengthTo == "0" || lengthTo == ""))
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	
	//Validate the length field. 
	if (!regex.test(lengthFrom) || !regex.test(lengthTo))
	{
		alert("Please enter a valid boat length.");
		return false;
	}
	return true;
}
function BoatWanted_ValidateFields(control)
{
	if (window.document.getElementById(control.id+"_0").checked == false &&
		window.document.getElementById(control.id+"_1").checked == false &&
		window.document.getElementById(control.id+"_2").checked == false &&
		window.document.getElementById(control.id+"_3").checked == false)
	{
		alert("Please select one or more boat types.");
		return false;
	}
	return true;
}

function BoatsWantedEnquiry_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	var msg = "";
	if (window.document.getElementById(parentid+"chkBoatType_0").checked == false &&
		window.document.getElementById(parentid+"chkBoatType_1").checked == false &&
		window.document.getElementById(parentid+"chkBoatType_2").checked == false &&
		window.document.getElementById(parentid+"chkBoatType_3").checked == false)
		msg += "- Please select one or more boat types.\n";
	if (window.document.getElementById(parentid+"txtName").value.trim() == "")
		msg += "- Please enter your name\n";
	var email = window.document.getElementById(parentid+"txtEmail").value.trim();
	if (email == "" || !isValidEmail(email))
		msg += "- Please enter a valid e-mail address\n";
	if (window.document.getElementById(parentid+"txtPhone").value.trim() == "")
		msg += "- Please enter a contact number\n";
	if (window.document.getElementById(parentid+"cboLocation").value == "")
		msg += "- Please select a region\n";

	if (msg != "")
	{
		msg = "Correct these errors first before sending your message:\n" + msg;
		alert(msg);
		return false;
	}
	return true;
}

function IndustrySearchUsed_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
		
	if (window.document.getElementById(parentid+"cboType").value == "0" &&
		window.document.getElementById(parentid+"cboLocation").value == "0" &&
		window.document.getElementById(parentid+"cboPrice1").value == "-1" &&
		window.document.getElementById(parentid+"cboPrice2").value == "-1" &&		
		window.document.getElementById(parentid+"cboCreatedDate").value == "0" &&
		window.document.getElementById(parentid+"txtKeywords").value.trim() == "")
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	return true;
}
function IndustrySearchHome_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
		
	if (window.document.getElementById(parentid+"cboType").value == "0" &&
		window.document.getElementById(parentid+"cboLocation").value == "0" &&
		window.document.getElementById(parentid+"cboPrice1").value == "-1" &&
		window.document.getElementById(parentid+"cboPrice2").value == "-1" &&		
		window.document.getElementById(parentid+"txtUKeywords").value.trim() == "")
	{
		alert("Please select one or more criteria to begin your search.");
		return false;
	}
	return true;
}
//
function txtbox_onkeypress(control, btnName, evt)
{
	var e = (window.event) ? window.event : evt;
	if (e && e.keyCode == 13)
	{
		var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
		var btn = window.document.getElementById(parentid+btnName);
		btn.click();
		return false;
	}
	return true;
}
function DealerEmailAFriend_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	var msg = "";
	var email = window.document.getElementById(parentid+"txtEmail").value.trim();
	if (email == "" || !isValidEmail(email))
		msg += "- Please enter a valid address for your email\n";
	var email2 = window.document.getElementById(parentid+"txtFEmail").value.trim();
	if (email2 == "" || !isValidEmail(email2))
		msg += "- Please enter a valid address for your friend's email\n";
	var comment = window.document.getElementById(parentid+"txtMsg").value.trim();
	if (comment.length > 1000)
		msg += "- Your message cannot exceed 1000 characters\n";
	if (msg != "")
	{
		msg = "Correct these errors first before sending your message:\n" + msg;
		alert(msg);
		return false;
	}
	return true;
}
function MerchandiseScheduler_ValidateFields(control)
{
	var parentid = control.id.substring(0, control.id.lastIndexOf("_")+1);
	if (window.document.getElementById(parentid+"cboSite").value == "0" ||
		window.document.getElementById(parentid+"cboRegion").value == "-1" ||
		window.document.getElementById(parentid+"cboMake").value == "")
	{
		alert("Please select ALL criteria to begin your search.");
		return false;
	}
	return true;
}

function LuckySearchOnFocus(ctrl) {
	if (ctrl.value=='eg: Automatic Hatchback') ctrl.value='';
}
function LuckySearchOnBlur(ctrl) {
	if (ctrl.value=='') ctrl.value='eg: Automatic Hatchback';
} 
function LuckySearch (form) {
	var searchValue = form.FeelingLucky.value;
	
	if(searchValue == "")
		return;
	
	if(searchValue == "eg: Automatic Hatchback")
		searchValue = "Automatic Hatchback";
	searchValue = encodeURIComponent(searchValue);
	
	var newLocation = "/search/search.aspx?" + "N=291&Ntx=mode+matchallpartial&Ntk=CarAll&Ntt=" + searchValue + "&Nty=1&Dx=mode+matchany&D=" + searchValue;
	window.location = newLocation;
}
function LuckySearchKeyPress(control, evt)
{
	var e = (window.event) ? window.event : evt;
	if (e && e.keyCode == 13)
	{
		LuckySearch(control.form);
		return false;
	}
	return true;
}
function LuckySearchOnLoad () {

	var terms= GetQueryArgVal('Ntt');
	var tabid= GetQueryArgVal('TabID');
	if (terms.length >0 && tabid.length >0) 
		window.document.getElementById('FeelingLucky').value = terms;
	else 
		window.document.getElementById('FeelingLucky').value = 'eg: Automatic Hatchback';
}
function GetQueryArgVal (theArgName) {
	var sArgs = new Array();
	sArgs= location.search.slice(1).split('&');
    var r = '';
    for (var i = 0; i < sArgs.length; i++) {
        if (sArgs[i].slice(0,sArgs[i].indexOf('=')) == theArgName) {
            r = sArgs[i].slice(sArgs[i].indexOf('=')+1);
            break;
        }
    }
    return (r.length > 0 ? unescape(r).split(',') : '')
}


function showtab(name, imgCtrl, imgpath)
{
	window.document.getElementById('EndecaParamSearches_Used').style.display = "none";
	window.document.getElementById('EndecaParamSearches_New').style.display = "none";
	window.document.getElementById('EndecaParamSearches_Reviews').style.display = "none";
	window.document.getElementById('EndecaParamSearches_Dealers').style.display = "none";
	window.document.getElementById('EndecaParamSearches_Valuation').style.display = "none";
	window.document.getElementById('EndecaParamSearches_'+name).style.display = "block";

	window.document.getElementById('imgTabUsedCarSearch').src = '/carcontent/endeca/b_s_used_o.gif';
	window.document.getElementById('imgTabNewCarSearch').src = '/carcontent/endeca/b_s_new_o.gif';
	window.document.getElementById('imgTabCarReviewsSearch').src = '/carcontent/endeca/b_s_reviews_o.gif';
	window.document.getElementById('imgTabCarDealerSearch').src = '/carcontent/endeca/b_s_dealers_o.gif';
	window.document.getElementById('imgTabCarValuationSearch').src = '/carcontent/endeca/b_s_value_o.gif';
	window.document.getElementById(imgCtrl).src =  imgpath;
	return false;
}

function showtab2(name)
{
	window.document.getElementById('EndecaParamSearches_Used').style.display = "none";
	window.document.getElementById('EndecaParamSearches_New').style.display = "none";
	if (window.document.getElementById('EndecaParamSearches_Reviews') != null)
		window.document.getElementById('EndecaParamSearches_Reviews').style.display = "none";
	if (window.document.getElementById('EndecaParamSearches_Dealers') != null)
		window.document.getElementById('EndecaParamSearches_Dealers').style.display = "none";
	if (window.document.getElementById('EndecaParamSearches_Valuation') != null)
	window.document.getElementById('EndecaParamSearches_Valuation').style.display = "none";
	window.document.getElementById('EndecaParamSearches_'+name).style.display = "block";

	return false;
}
function MSNSearchOnFocus(ctrl) {
	if (ctrl.value=='anything else eg: Automatic Hatch') ctrl.value='';
}
function MSNSearchOnBlur(ctrl) {
	if (ctrl.value=='') ctrl.value='anything else eg: Automatic Hatch';
} 
function NZSearchOnFocus(ctrl) {
	if (ctrl.value=='anything else') ctrl.value='';
}
function NZSearchOnBlur(ctrl) {
	if (ctrl.value=='') ctrl.value='anything else';
} 
function openCarPointTopDealWindow(tabID, modID)
{
	var winl = (screen.width - 560)/2;
	var wint = (screen.height - 400)/2;
	var opts = "dependent=no,toolbar=no,directories=no,menubar=no,width=560,height=400,top="+wint+",left="+winl+",resizable=yes,scrollbars=no,location=no,status=no";
	bodyWin=window.open("/Tig/CPHtmlPopup.aspx?TabID="+tabID+"&modID="+modID);

	//set focus to window
	if (parseInt(navigator.appVersion) >=4)
		bodyWin.window.focus();
}
