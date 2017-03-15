var Rmap='.'
String.prototype.replaceAll = function(str1, str2, ignore) 
{
    return this.replace(new RegExp(str1.replace(/([\/\,\!\\\^\$\{\}\[\]\(\)\.\*\+\?\|\<\>\-\&])/g,"\\$&"),(ignore?"gi":"g")),(typeof(str2)=="string")?str2.replace(/\$/g,"$$$$"):str2);
} 
String.prototype.ToHighmap = function(str1) 
{
	var str1=JSON.stringify(str1);
	var txjs=str1.replaceAll('["' , '"');
	var txjs=txjs.replaceAll('"]' , '"');
	var txjs=txjs.replaceAll('],[' , ',');
	var txjs=txjs.replaceAll('[[[[' , '[[[');
	var txjs=txjs.replaceAll(']]]]' , ']]]');
	var txjs=JSON.parse(txjs)
    return txjs;
} 
String.prototype.ToJS = function(str1) 
{
	var str1=JSON.stringify(str1);
	var txjs=str1.replaceAll('["' , '"');
	var txjs=txjs.replaceAll('"]' , '"');
	var txjs=txjs.replaceAll('],[' , ',');
	var txjs=txjs.replaceAll('[[[[' , '[[[');
	var txjs=txjs.replaceAll(']]]]' , ']]]');
    return txjs;
} 