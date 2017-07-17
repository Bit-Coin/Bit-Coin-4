
function ninemsnseachgobutton_onclick() {
	var searchTxt = window.document.getElementById('ninemsnseachtxtbox').value;
	if (searchTxt == "Web search") { searchTxt = ""; }
	var strHDParam='?v=1&FORM=MSNH&CY=en-au&RS=CHECKED&q='+searchTxt;
	window.location.href='http://search.ninemsn.com.au/results.aspx'+strHDParam;
	return false;
}
function ninemsnseachtxtbox_onkeypress(evt) {
	var e = (window.event) ? window.event : evt;
	if (e && e.keyCode == 13)
	{
		var btn = window.document.getElementById('ninemsnseachgobutton');
		btn.click();
		return false;
	}
	return true;
}
function ninemsnseachtxtbox_onfocus(objE) {
	if (objE.value == "Web search") { objE.value=""; }
}
function ninemsnseachtxtbox_onblur(objE) {
	if (objE.value == "") { objE.value="Web search"; }
}
function SetHome(arg, strUrl) {
	if(navigator.appVersion.charAt(navigator.appVersion.indexOf("MSIE") + 5) >= 5 && navigator.platform.indexOf("Win16") == -1 && navigator.platform.indexOf("Mac") == -1)	{
		arg.style.behavior='url(#default#homepage)'; 
		arg.setHomePage(strUrl); 
		arg.href='#'; 
		return true; 
	} 
	else { 
		return false;
	} 
}
function AddToFavorites(favoriteurl, favoritetitle){ 
	window.external.AddFavorite(favoriteurl,favoritetitle); 
} 
function LinkToOutside(sURL ,sName) {
	var sOptions = ',resizable=yes,location=no,toolbar=yes,scrollbars=yes,menubar=no,status=no';
	var intThisHeight = (window.screen.height* 0.8);
	var intThisWidth = (window.screen.width * 0.8);
	var sScr = 'width=' + intThisWidth.toString() + ',height=' + intThisHeight.toString();
   window.open('http://' + sURL, sName, sScr + sOptions);
}
function LRG(strWindow) {
	var showwindow = null;var i = 0;
	showwindow =window.open(strWindow,'lrgWindow','width=600,height=425');
	showwindow.focus();
}
function TWR(strWindow) {
	var showwindow = null;var i = 0;
	showwindow =window.open(strWindow,'TwrWindow','width=310,height=430');
	showwindow.focus();
}
function ImageViewer(url, w, h) {
   openwin = window.open(url,'ImageViewer','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width='+w+',height='+h); openwin.focus();
}
function cpNSF(objE) {
	if (objE.value == "enter email address") { objE.value=""; }
}
function cpNSB(objE) {
	if (objE.value == "") { objE.value="enter email address"; }
}
String.prototype.trim = function() { return this.replace(/(^\s*)|(\s*$)/g, ""); }
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
function OpenWindow (sUrl, sName, sFeatures)
{
	var str = sFeatures += "status=yes,resizable=yes,left=0,screenX=0,top=0,screenY=0";

	if (window.screen) {
  		var ah = screen.availHeight - 50;
  		var aw = screen.availWidth - 10;
  		str += ",height=" + ah;
  		str += ",innerHeight=" + ah;
  		str += ",width=" + aw;
  		str += ",innerWidth=" + aw;
} 	else {
  		str += ",resizable"; // so the user can resize the window manually
}
	window.open(sUrl, sName, str);
}
function CurrencyConverter()
{
window.open('http://www.ozforex.com.au/cgi-bin/convert.asp','Remote', 'toolbar=no,menubar=no,scrollbars=no,resizable=yes,status=no,location=no,directories=no,copyhistory=no,dependent=0');
}

function CurrencyFormatter(amount)
{
	var str = amount.toString();
	if (str.indexOf( ',' ) > 0)
		return str;
	
	var dec = str.indexOf( '.' );
	var len = dec;
	if (len < 0) len = str.length;
	
	var pos = len % 3;
	var formatted = str.substr( 0, pos );
	for (; pos < len; pos += 3)
		formatted = formatted + (pos == 0 ? "" : ",") + str.substr( pos, 3 );
	
	if (dec > 0) formatted += str.substring( dec, str.length );
	return formatted;
}

function EmailAFriend(url) {
   openwin = window.open('/Tig/Email-a-friend.aspx?'+url,'EmailaFriend','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=480,height=472'); openwin.focus();
}
function LoanCalculator(url) {
   openwin = window.open('/Tig/LoanCalculator.aspx?'+url,'LoanCalculator','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=340,height=570'); openwin.focus();
}
function PhotoSS(url) {
   openwin = window.open('/Tig/UI/PhotoSlideShow.aspx?'+url,'PhotoSS','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,width=700,height=670'); openwin.focus();
}

function popup(url, name, width, height)
{
	settings = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width="+width+",height="+height;
	window.open(url, name, settings);
}
function PhotoPopup(url)
{
	settings = "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=620,height=680";
	window.open(url, 'photoWindow', settings);
}
//-->
