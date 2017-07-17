var TRACK_CS_UTILS = true;

enquiry = new Image(); enquiry_hover = new Image(); enquiry_hover.src="/carcontent/cse/ul_enquiry_ov.gif"; 

var bookmarkurl = "http://www.carsales.com.au"; // the url for the bookmark/favourite
var bookmarktitle = "carsales.com.au";         // bookmark/favourite title
function addbookmark()
{
	if (document.all)
		window.external.AddFavorite(bookmarkurl, bookmarktitle);
}
function preloadImages() {
  var d=document; if(d.images){ if(!d.p) d.p=new Array();
    var i,j=d.p.length,a=preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.p[j]=new Image; d.p[j++].src=a[i];}}
}
function swapImgRestore() {
  var i,x,a=document.sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function findObj(n, d) {
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=findObj(n,d.layers[i].document); return x;
}
function swapImage() {
  var i,j=0,x,a=swapImage.arguments; document.sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=findObj(a[i]))!=null){document.sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function navover(id) { window.document.getElementById("button"+id).src = overgfx.src; }
function navout(id) { window.document.getElementById("button"+id).src = upgfx.src; }
upgfx = new Image(); upgfx.src = "/carcontent/cse/small_button.gif";
overgfx = new Image(); overgfx.src = "/carcontent/cse/small_button_ov.gif";
small_go_gfx = new Image(); small_go_gfx_hover = new Image(); small_go_gfx_hover.src="/carcontent/cse/go_ov.gif";
function replaceUrlParams(url, p, v)
{
	var pv = p + "=" + v;
	var regex = new RegExp("(.*[?&])" + p + "=[^&\n]*(.*)$");
	url = url.replace(regex, "$1" + pv + "$2");
	if (url.indexOf("?"+p+"=") < 0 && url.indexOf("&"+p+"=")<0)
	{
		url += ((url.indexOf("?")==-1) ? "?" : "&") + pv;
	}
	return url;
}
function removeUrlParams(url, p)
{
	var regex = new RegExp("(.*[?&])" + p + "=[^&\n]*(.*)$");
	url = url.replace(regex, "$1$2");
	url = url.replace("\?\&", "?");
	url = url.replace("\&\&", "&");
	//url = url.replace("?$", "");
	if(url.lastIndexOf("&")==url.length-1 || url.lastIndexOf("?")==url.length-1)
		url = url.substring(0,url.length-1);
	return url;
}
function doSort(id, paramName) 
{ 
	var ctrl = window.document.getElementById(id);
	var queryParams = replaceUrlParams(location.search, paramName, ctrl.value);
	queryParams = replaceUrlParams(queryParams, "sort_type", ctrl.selectedIndex+1); 
	queryParams = removeUrlParams(queryParams, "No");
	
	location.href = location.pathname + queryParams;
}
function initSort(id)
{
	var q = location.search;
	if (q.indexOf("Ns=") > 0)
	{
		var s = window.document.getElementById(id);
		for (i=0; i<s.options.length; i++)
		{
			if (q.indexOf(s.options[i].value) > 0)
			{
				s.selectedIndex = i;
				break;
			}
		}
	}
}
function keyword_onkeypress(control, lnk_id, evt)
{
	var e = (window.event) ? window.event : evt;
	if (e && e.keyCode == 13)
	{
		var lnk = window.document.getElementById(lnk_id);
		lnk.click();
		return false;
	}
	return true;
}
function getSelectedValue(ctrl_id)
{
	var ctrl = document.getElementById(ctrl_id);
	var value = ctrl.options[ctrl.selectedIndex].value;
	return value;
}
function addParam(url, key, value)
{
	if (url.charAt(url.length-1) != '?')
		url += "&";
	url += key + "=" + value;
	return url;
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
function popupWindow(url, windowName, width, height, widthForPositioning, heightForPositioning, hasScrollbars)
{
	var leftPos = (screen.width - ((widthForPositioning > 0) ? widthForPositioning : width))/2;
	var topPos = (screen.height - ((heightForPositioning > 0) ? heightForPositioning : height))/2;
	var opts = "directories=no,location=no,menubar=no,resizable=yes,scrollbars=" + (hasScrollbars?"yes":"no") +",toolbar=no,status=no,width=" + width + ",height=" + height;
	if (widthForPositioning >= 0)
		opts += ",top=" + topPos + ",left=" + leftPos;
	popup = window.open(url, windowName, opts);
	popup.focus();
}
function CSPhotoSS(url) {
   openwin = window.open('/Tig/UI/CSPhotoSlideShow.aspx?'+url,'photoWindow','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=680,height=620'); openwin.focus();
}
function CSPhotoSS2(url) {
   openwin = window.open('/cars/gallery.aspx?'+url,'photoWindow','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=780,height=680'); openwin.focus();
}
function showPhoto(url)
{
	popupWindow(url, "photoWindow", 680, 620, -1, -1, true);
}
function insuranceTerms(url)
{
	popupWindow(url, "insuranceTerms", 580, 400, 0, 0, true);
}
function say(url)
{
	popupWindow(url, "carsales", 420, 320, -1, -1, false);
}
function openDAPWindow2(url)
{
	popupWindow(url, "DAPWindow", 450, 360, 0, 0, true);
}
function specialsDisclaimer(url)
{
	popupWindow(url, "DisclaimerWindow", 500, 400, -1, -1, false);
}
function justTypeRego()
{
	popupWindow("/info/just-type-rego.htm", "regosearch", 550, 450, 0, 0, false);
}
function showReport(report_url)
{
	var url = "http://www.carsales.com.au/pls/carsales/!csc_certifieds.racv?"+report_url;
	popupWindow(url, "showReport", 650, 630, 0, 0, true);
}
function emailFriend()
{
	var opts = "toolbar=no,directories=no,menubar=no,width=570,height=520,resizable=yes,scrollbars=yes,location=no,status=no";
	popup = window.open("", "emailfriend", opts);
	popup.focus();
}

function emailFriendPopup(url)
{
	var opts = "toolbar=no,directories=no,menubar=no,width=570,height=520,resizable=yes,scrollbars=yes,location=no,status=no";
	popup = window.open(url, "emailfriendPopup", opts);
	popup.focus();
}

function printablePopup()
{
	var opts = "toolbar=no,directories=no,menubar=no,width=550,height=500,resizable=yes,scrollbars=yes,location=no,status=no";
	popup = window.open("", "emailfriend", opts);
	popup.focus();
}


// Another copy of this method is in csusedcars3.js
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
