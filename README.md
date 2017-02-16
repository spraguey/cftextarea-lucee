# cftextarea-lucee
CFTEXTAREA for Lucee

This is a replacement for cftextarea for Lucee servers. The intention of this tag is to prevent the need to go edit every place that you used cftextarea on a server that used to be Adobe CF. This will dumb down the code to a simple HTML5 textarea tag.

Why? I had a set of servers with hundreds of websites on them. They were all being converted from Adobe ColdFusion to Lucee. Rather than edit hundreds of files to remove cftextarea, I created this replacement tag.

## What it does not do...

This tag will not do richtext="yes" (ckeditor), and it will not do binding with bind="" like the Adobe version.

##Usage

You use this just like the regular CFTEXTAREA tag in Adobe ColdFusion (http://cfdocs.org/cftextarea).

##Supported Attributes

name:			{required:true,type:"string"},
id:      	{required:false,type:"string",default:""},	
value: 			{required:false,type:"string",default:"",hint:""},	
width: 			{required:false,type:"string",default:"",hint:""},
height:  			{required:false,type:"string",default:"",hint:""},	
style: 			{required:false,type:"string",default:"",hint:""},	
maxlength: 		{required:false,type:"string",default:"",hint:""},	
rows: 		{required:false,type:"string",default:"",hint:""},	
cols: 			{required:false,type:"string",default:"",hint:""},		
class: 		{required:false,type:"string",default:"",hint:""},	
required: 			{required:false,type:"string",default:"",hint:""},	
wrap: 			{required:false,type:"string",default:"",hint:""},
placeholder: {required:false,type:"string",default:"",hint:""}

Also, if you pass in any other attribute, it will be appended to the &lt;textarea&gt; tag.

##Examples
```html
 <cftextarea 
  name="Address"
  required="yes"
  style="background-color:gray;"
  value="123 Main Street"
  />
```
```html
 <cftextarea 
  name="Address"
  required="yes"
  style="background-color:gray;"
  data-custom="yes"
  >123 Main Street</cftextarea>
```
