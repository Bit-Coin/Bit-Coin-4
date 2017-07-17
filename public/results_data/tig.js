/***************************************** 
 * Common Utils
 *****************************************/

// represent 'document.getElementById'
$ = function(__id) 
{ 
	var obj = document.getElementById(__id); 
	if (typeof(obj) == "undefined" || obj == null)
		return null;
	return obj;
}

// return value of HTML INPUT CONTROL 'htmlInputControl.value'
$V = function(__id)
{
	var control = $(__id);
	if (control == null)
		return "";
	return control.value;
}

/***************************************** 
 * Native Object Class Extension
 *****************************************/
Object.extend = function(destination, source) 
{
	for (property in source)
		destination[property] = source[property];
	return destination;
}

/***************************************** 
 * Native String Class Extension
 *****************************************/
Object.extend(String.prototype, {
	// return boolean if the string is equal with given compareTo string
	// by default, the comparison is CaseSensitive
	equal : function (compareTo, ignoreCase)
	{
		if (ignoreCase)
			return (this.toLowerCase() == compareTo.toLowerCase());			
		return (this == compareTo);
	},
	
	// remove "escape character" from this string, so it become valid JSON format
	// the string input normally, what we get from server
	// return false if escaping is failed
	escapeJson : function()
	{
		var newObj;
		try
		{
			var contentStart = obj.indexOf("[");
			var tmp = obj.substring(contentStart + 1);
			tmp = tmp.substring(0, tmp.length-1);	
			var arr = tmp.split(",");	
			for (var i=0; i<arr.length; i++) 
			{
				tmp = arr[i].substring(0, arr[i].length-2).substring(arr[i].indexOf("\"")+1);		
				arr[i] = tmp.replace(/(["\\])/g, '\\$1');
			}	
			arr = arr.join("\",\"");
			newObj = eval(obj.substring(0, contentStart+2) + arr + "\"\]");	
			return newObj;
		}
		catch (e)
		{
			return false;
		}	
	},
	
	// in some case, the data might contain query symbol which might interfere querystring
	// those symbol such as "&" will be translated to different symbol that will not interfere querystring
	escapeQuerySymbol : function()
	{
		return this.replace(/[&=]/g, "-");
	},

	// decode HTML format to string
	htmlDecode : function() 
	{
		var div = document.createElement('div');
		div.innerHTML = this.stripTags();
		return div.childNodes[0] ? div.childNodes[0].nodeValue : '';
	},
	
	// encode string as HTML friendly format
	htmlEncode : function()
	{
		var div = document.createElement('div');
		var text = document.createTextNode(this);
		div.appendChild(text);    	
		return div.innerHTML;
	},	
	
	// return boolean true / false, if the string is in valid email format
	isValidEmail : function()
	{
		return /^[\w-_.]*[\w-_.]@[\w].+[\w]+[\w]$/.test(this.trim());
	},
	
	// return boolean true / false, if the string is in valid australian postcode format
	isValidPostCode : function()
	{
		return /^\d{3,4}$/.test(this.trim());
	},
	
	// drop all html tags from the string
	// for eg: <a>hello world</a> -> hello world
	stripTags : function() 
	{
		return this.replace(/<\/?[^>]+>/gi, '');
	},
	
	trim : function()
	{
		var str = this;
		while(str.charAt(0) == (" ") )
			str = str.substring(1);		

		while(str.charAt(str.length-1) == " " )
			str = str.substring(0, str.length-1);

		return str.toString();	
	},
	
	// decode URL 
	urlDecode : function()
	{
		return unescape(this);		
	},
	
	// encode string as URL friendly encoding
	urlEncode : function () 
	{
		// there is a limitation in javascript escape
		// it doesn't escape "+" and "/", so we need to escape it manually
		// it escape "=" and "&" so we need to unescape it
		var encodedUrl = escape(this);
		encodedUrl = encodedUrl.replace(/\+/g, "%2B");
		encodedUrl = encodedUrl.replace(/\//g, "%2F");
		encodedUrl = encodedUrl.replace(/%3D/g, "=");
		encodedUrl = encodedUrl.replace(/%26/g, "&");			
		return encodedUrl;
	}	
});

/***************************************** 
 * TIG Library
 *****************************************/

/* TIG Object Init */
var Tig = new Object();

/* TIG Regex Object Init */
Tig.Regex = new Object();

/* TIG Browser Static Class */
Tig.Browser = {
	Firefox : function()
	{	
		// navigator.userAgent returns 'Mozilla/4.0 (compatible; MSIE6.0; Windows NT 5.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'
		return (window.navigator.userAgent.indexOf("Firefox") > -1);
	},

	MSIE : function()
	{	
		// navigator.appName returns "Microsoft Internet Explorer"
		return (window.navigator.appName.indexOf("Microsoft") > -1);
	},	

	Safari : function()
	{			
		return (window.navigator.userAgent.indexOf("Safari") > -1);
	}	
}

/* TIG Regex Static Class */
Tig.Regex.Rules = {
	// default pattern "i" means case-insensitive
	defaultPattern : "i",
	
	// this pattern will search the value of given key
	// the data must be in this format: 
	// -> &key=value&key1=value1&
	// -> ?key=value&key1=value1&
	UrlQuery : function(key, pattern)
	{
		if (typeof(pattern) == "undefined")
			pattern = this.defaultPattern;			
		return new RegExp("(.*)(\\?|&)" + key + "=([^&]+?)(&)(.*)", pattern);
	}
}


/***************************************** 
 * TIG Url Class 
 *****************************************/

/* CONSTRUCTOR */
Tig.Url = function(__url)
{
	this.url = __url;
	this.path = "";
	this.query = "";
	this.fragment = "";
	
	// flag to indicate whether the url has been modified via SET operation
	this.isModified = false;
	
	var temp;	
	// if url has querystring
	if (this.url.indexOf("?") > -1)
	{
		temp = this.url.split("?");
		this.path = temp[0];
		// if url has querystring and fragment
		if (temp[1].indexOf("#") > -1)
		{
			temp = temp[1].split("#");
			this.query = temp[0];
			this.fragment = temp[1];
		}
		else
			this.query = temp[1];
	}
	// if url doesn't have querystring but has fragment
	else if (this.url.indexOf("#") > -1)
	{		
		temp = this.url.split("#");
		this.path = temp[0];
		this.fragment = temp[1];
	}	
	// if url doesn't have either query and fragment
	else
		this.path = this.url;	
}

/* PUBLIC METHOD */
Object.extend(Tig.Url.prototype, {
	// remove fragment from the url
	ClearFragmentString : function()
	{
		this.fragment = "";
		this.isModified = true;
	},

	// remove query from the url
	ClearQueryString : function()
	{
		this.query = "";
		this.isModified = true;
	},
			
	// search key in the provided data 
	// (data is either query or fragment or custom with format key=value&key=value&..)
	GetKey : function(key, data)
	{
		// build regex friendly query by adding "?" before the query and "&" after the query
		var temp = "?" + data + "&";	
			
		var regex = Tig.Regex.Rules.UrlQuery(key);
		var match = temp.match(regex);		
		return (match != null) ? match[3] : null;
	},
	
	// return null if not found
	GetFragment : function(key)
	{
		return this.GetKey(key, this.fragment);

	},
	
	// return null if not found
	GetQuery : function(key)
	{		
		return this.GetKey(key, this.query);
	},
	
	// Remove key from the URL
	// Nothing is happened if key is not exists
	// (data is either query or fragment or custom with format key=value&key=value&..)
	RemoveKey : function(key, data)
	{
		// build regex friendly query by adding "?" before the query and "&" after the query
		var temp = "?" + data + "&";
		
		var regex = Tig.Regex.Rules.UrlQuery(key);					
		temp = temp.replace(regex, "$1$2$5");											
			
		// set flag to indicate, this url has been modified
		this.isModified = true;	
		
		// remove "?" and "&" from the query before returning
		return (temp.length === 1) ? "" : temp.substring(1, temp.length-1);
	},
	
	// Support multiple arguments
	// If there are multiple keys (eg: multiple N), then only the 1st match will be removed.
	RemoveFragment : function(keys)
	{
		// search all keys in the url and remove it
		for (var i=0; i<arguments.length; i++)
			this.fragment = this.RemoveKey(arguments[i], this.fragment);
	},
	
	// Support multiple arguments
	// If there are multiple keys (eg: multiple N), then only the 1st match will be removed.	
	RemoveQuery : function(keys)
	{
		// search all keys in the url and remove it
		for (var i=0; i<arguments.length; i++)
			this.query = this.RemoveKey(arguments[i], this.query);
	},
	
	// Assign a new value to the existing key (UPDATE).
	// If the key is not exists, append it to URL.
	// If there are multiple keys (eg: multiple N), then only the 1st match will be updated.
	// The value is automatically encoded.
	SetFragment : function(key, value)
	{		
		if (typeof(value) == "undefined" || value == null || value.length == 0) 
		{
			// remove the fragment if value is not set
			this.RemoveFragment(key);
			return;
		}
		
		// encode the value	
		var encodedVal = value;			
		
		// remove the existing key, it will do nothing if not found		
		this.RemoveFragment(key);
		
		// add the new value to the query
		if (this.fragment.length > 0)
			this.fragment += "#";			
		this.fragment += key + "=" + encodedVal;
	},
		
	// Assign a new value to the existing key (UPDATE).
	// If the key is not exists, append it to URL.
	// If there are multiple keys (eg: multiple N), then only the 1st match will be updated.
	// The value is automatically encoded.
	SetQuery : function(key, value)
	{		
		if (typeof(value) == "undefined" || value == null || value.length == 0) 
		{
			// remove the Query if value is not set
			this.RemoveQuery(key);
			return;
		}	
		
		// encode the value	
		var encodedVal = value;			
		
		// remove the existing key, it will do nothing if not found		
		this.RemoveQuery(key);
		
		// add the new value to the query
		if (this.query.length > 0)
			this.query += "&";			
		this.query += key + "=" + encodedVal;
	},

	ToString : function()
	{		
		// re-construct the url if it has been modified
		if (this.isModified)
		{
			this.url = this.path;
			if (this.query.length > 0)
				this.url += "?" + this.query;
			if (this.fragment.length > 0)
				this.url += "#" + this.fragment;	
				
			this.isModified = false;
		}
				
		return this.url;
	}
});

//var url = new Tig.Url(location.href);
//url.RemoveFragment("N", "a", "b");
//alert(url.ToString());

//url.ClearQueryString();
//url.SetQuery("Ns", "abc");
//url.SetQuery("N", "good");
//url.RemoveQuery("__sid", "__N");
//alert(url.ToString());
//alert(url.GetQuery("Ns"));
//alert(url.GetQuery("N"));
//alert(url.GetFragment("N"));
//alert(url.GetQuery("special"));
//url.RemoveQuery("__Ns", "special_category", "Ns"); 
//alert(url.ToString());
//alert(url.getHash("N"));
//url.removeQuery("N", "Nne", "seot");
//alert(url.getQuery("__Ns"));
//alert(url.setQuery("N", "Hello"));
//alert(url.getQuery("N"));
//url.clearQueryString();
//alert(url.toString().urlDecode());
//alert(url.toString().urlDecode().urlEncode());
//alert(url.toString().urlDecode().urlEncode().urlDecode());

