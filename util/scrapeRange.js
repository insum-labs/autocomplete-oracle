//Parameters
//apex_5
//apex_5.1
//oracle_12c
//oracle_11g
var scrapeType = ['standard'];
var getFirstSignatureOnly = true;
var doNotScrapeBody = false;


/////////////////////////////////


function initScrapeParameters() {
	let st = scrapeType;
	if(typeof scrapeType  == 'object') {
		st = scrapeType.pop();
	}
	switch(st){
		case 'standard':
				beginUrl = 'https://www.techonthenet.com/oracle/functions/index_alpha.php';
				finishUrl = 'https://www.techonthenet.com/oracle/exceptions/sqlerrm.php';
				finishUrl = 'https://www.techonthenet.com/oracle/functions/add_months.php';
				baseUrl = 'https://www.techonthenet.com';
				isApexScrape = false;
				filename += 'standardFuncs';
				scrapingStandardFuncs = true;
				scrapingSpeed = 1500;
			break;
		case 'apex_5':
				beginUrl = 'http://docs.oracle.com/cd/E59726_01/doc.50/e39149/apex_app.htm';
				finishUrl = 'http://docs.oracle.com/cd/E59726_01/doc.50/e39149/apex_zip.htm';
				baseUrl = 'http://docs.oracle.com/cd/E59726_01/doc.50/e39149/';
				isApexScrape = true;
				apexVersion = 5.0;
				filename += 'apexVer5'
				scrapingStandardFuncs = false;
				scrapingSpeed = 100;
			break;
		case 'apex_5.1':
				beginUrl = 'http://docs.oracle.com/database/apex-5.1/AEAPI/APEX_APPLICATION.htm';
				finishUrl = 'http://docs.oracle.com/database/apex-5.1/AEAPI/GET_FILES-Function.htm';
				baseUrl = 'http://docs.oracle.com/database/apex-5.1/AEAPI/';
				isApexScrape = true;
				apexVersion = 5.1
				filename += 'ApexVer51'
				scrapingStandardFuncs = false;
				scrapingSpeed = 100;
			break;
		case 'oracle_12c':
				beginUrl = 'http://docs.oracle.com/database/121/ARPLS/c_adm.htm';
				finishUrl = 'http://docs.oracle.com/database/121/ARPLS/w_wdoclo.htm';
				baseUrl = 'http://docs.oracle.com/database/121/ARPLS/';
				isApexScrape = false;
				apexVersion = null;
				filename += 'oracle12c'
				scrapingStandardFuncs = false;
				scrapingSpeed = 100;
			break;
		case 'oracle_11g':
				beginUrl = 'http://docs.oracle.com/cd/B28359_01/appdev.111/b28419/c_adm.htm';
				finishUrl = 'http://docs.oracle.com/cd/B28359_01/appdev.111/b28419/t_xml.htm';
				baseUrl = 'http://docs.oracle.com/cd/B28359_01/appdev.111/b28419/';
				isApexScrape = false;
				apexVersion = null;
				filename += 'oracle11g'
				scrapingStandardFuncs = false;
				scrapingSpeed = 100;
			break;
	}
	if(typeof scrapeType == 'object') {
		if(scrapeType.length == 0) {
			//We are on our last scrape
			filename += '.json';
		}
	} else {
		filename += '.json'
	}

}

var express = require('express');
var fs = require('fs');
var request = require('request');
var cheerio = require('cheerio');
var app = express();
var $;


var allSignatures = {};
var allScrapedObjs = [];
var currentScrapeUrl;
var isExternalDoc = false;
var beginUrl  = '';
var finishUrl = '';
var isApexScrape;
var apexVersion;
var filename = '';
var scrapingStandardFuncs = false;
var nextUrl;
var allStandardFuncUrls = [];
var scrapingSpeed;



initScrapeParameters();


//NOTE: Taken from http://docs.oracle.com/database/apex-5.1/HTMDB/understanding-substitution-strings.htm#GUID-2903142F-17A1-4DF4-956C-1CC0A238A4E4
//             and http://docs.oracle.com/database/apex-5.1/AEAPI/Global-Variables.htm#AEAPI29544
//The regexes were $('body').text().match(/v\([^\)]+\)/gi) and $('body').text().match(/\w+\.\w+/gi)
var allSubStringsAndGlobals = [
  {name:"APEX_APPLICATION.G_USER", description: 'Specifies the currently logged in user.' },
  {name:"APEX_APPLICATION.G_FLOW_ID", description: 'Specifies the ID of the currently running application.'},
  {name:"APEX_APPLICATION.G_FLOW_STEP_ID", description: 'Specifies the ID of the currently running page.'},
  {name:"APEX_APPLICATION.G_FLOW_OWNER", description: 'Specifies the schema to parse for the currently running application.'},
  {name:"APEX_APPLICATION.G_REQUEST", description: 'Specifies the value of the request variable most recently passed to or set within the show or accept modules.'},
  {name:"APEX_APPLICATION.G_BROWSER_LANGUAGE", description: 'Refers to the web browser\\\'s current language preference.'},
  {name:"APEX_APPLICATION.G_DEBUG", description: 'Refers to whether debugging is currently switched on or off. Valid values for the DEBUG flag are \\\'Yes\\\' or \\\'No\\\'. Turning debug on shows details about application processing.'},
  {name:"APEX_APPLICATION.G_HOME_LINK", description: 'Refers to the home page of an application. The Application Express engine redirects to this location if no page is given and if no alternative page is dictated by the authentication scheme\\\'s logic.'},
  {name:"APEX_APPLICATION.G_LOGIN_URL", description: 'Used to display a link to a login page for users that are not currently logged in.'},
  {name:"APEX_APPLICATION.G_IMAGE_PREFIX", description: 'Refers to the virtual path the web server uses to point to the images directory distributed with Oracle Application Express.'},
  {name:"APEX_APPLICATION.G_FLOW_SCHEMA_OWNER", description: 'Refers to the owner of the Application Express schema.'},
  {name:"APEX_APPLICATION.G_PRINTER_FRIENDLY", description: 'Refers to whether the Application Express engine is running in print view mode. This setting can be referenced in conditions to eliminate elements not desired in a printed document from a page.'},
  {name:"APEX_APPLICATION.G_PROXY_SERVER", description: 'Refers to the application attribute \\\'Proxy Server\\\'.'},
  {name:"APEX_APPLICATION.G_SYSDATE", description: 'Refers to the current date on the database server. this uses the DATE DATATYPE.'},
  {name:"APEX_APPLICATION.G_PUBLIC_USER", description: 'Refers to the Oracle schema used to connect to the database through the database access descriptor (DAD).'},
  {name:"APEX_APPLICATION.G_GLOBAL_NOTIFICATION", description: 'Specifies the application\\\'s global notification attribute.'},
  {name:"APP_ID", description: 'APP_ID identifies the application ID of the currently executing application. Table 2-7 describes the supported syntax for referencing APP_ID.', isSubstitutionString: true},
  {name:"APP_ALIAS", description: 'APP_ALIAS is an alphanumeric name for the current application. APP_ALIAS is different from the APP_ID in that the APP_ID must be unique over all workspaces and all applications hosted in one database. In contrast, APP_ALIAS must be unique within a workspace. For example, by using the same APP_ALIAS you can create the application, ABC, in two different workspaces. You can use APP_ALIAS almost anywhere APP_ID can be used. For example, f?p syntax can use an APP_ALIAS or an application ID as demonstrated in this example:', isSubstitutionString: true},
  {name:"APP_AJAX_X01", description: 'APP_AJAX_Xnn specifies the values of the APP_AJAX_X01, ... APP_AJAX_X10 URL parameters most recently passed to or set within the show or accept modules. You typically use these variables in On Demand AJAX processes.', isSubstitutionString: true},
  {name:"APP_AJAX_X02", description: 'APP_AJAX_Xnn specifies the values of the APP_AJAX_X01, ... APP_AJAX_X10 URL parameters most recently passed to or set within the show or accept modules. You typically use these variables in On Demand AJAX processes.', isSubstitutionString: true},
  {name:"APP_AJAX_X03", description: 'APP_AJAX_Xnn specifies the values of the APP_AJAX_X01, ... APP_AJAX_X10 URL parameters most recently passed to or set within the show or accept modules. You typically use these variables in On Demand AJAX processes.', isSubstitutionString: true},
  {name:"APP_DATE_TIME_FORMAT", description: 'APP_DATE_TIME_FORMAT is the application date time format of the application. This value reflects the format specified in the Application Date Time Format attribute of the Globalization settings of an application. If the Application Date Time Format is not set in an application, then a reference to APP_DATE_TIME_FORMAT returns the database session NLS date format and the NLS time format. Table 2-10 describes the supported syntax for referencing APP_DATE_TIME_FORMAT.', isSubstitutionString: true},
  {name:"#SUB_STRING#.APP_IMAGES", description: 'Use this substitution string to reference uploaded images, JavaScript, and cascading style sheets that are specific to a given application and are not shared over many applications. If you upload a file and make it specific to an application, then you must use this substitution string, or bind variable. Table 2-11 describes the supported syntax for referencing APP_IMAGES.', isSubstitutionString: true},
  {name:"APP_NLS_DATE_FORMAT", description: 'APP_NLS_DATE_FORMAT is the application date format of the database session. This value reflects the format specified in the Application Date Format attribute of the Globalization settings of the application. However, if the Application Date Format is not set, then APP_NLS_DATE_FORMAT returns the NLS_DATE_FORMAT value of the database session at the start of the request to the Application Express engine', isSubstitutionString: true},
  {name:"APP_NLS_TIMESTAMP_FORMAT", description: 'APP_NLS_TIMESTAMP_FORMAT is the application timestamp format of the database session. This value reflects the format specified in the Application Timestamp Format attribute of the Globalization settings of the application. However, if the Application Timestamp Format is not set, then APP_NLS_TIMESTAMP_FORMAT return the NLS_TIMESTAMP_FORMAT value of the database session at the start of the request to the Application Express engine.', isSubstitutionString: true},
  {name:"APP_NLS_TIMESTAMP_TZ_FORMAT", description: 'APP_NLS_TIMESTAMP_TZ_FORMAT is the application timestamp time zone format of the database session. This value reflects the format specified in the Application Timestamp Time Zone Format attribute of the Globalization settings of an application. However, if the Application Timestamp Time Zone Format is not set, then APP_NLS_TIMESTAMP_TZ_FORMAT returns the NLS_TIMESTAMP_TZ_FORMAT value of the database session at the start of the request to the Application Express engine.', isSubstitutionString: true},
  {name:"APP_PAGE_ALIAS", description: 'APP_PAGE_ALIAS is an alphanumeric name for the current application page. A page alias is not case-sensitive and it is an optional page attribute. APP_PAGE_ALIAS is unique within an application. You can use APP_PAGE_ALIAS almost anywhere APP_PAGE_ID can be used.', isSubstitutionString: true},
  {name:"APP_PAGE_ID", description: 'APP_PAGE_ID is the current application page ID. For example, if your application was on page 3, then the result would be 3. Using this syntax is useful when writing application components that must work generically in multiple applications.', isSubstitutionString: true},
  {name:"APP_REQUEST_DATA_HASH", description: 'APP_REQUEST_DATA_HASH is a hash value of the request, item name, and item value parts in the URL. It is primarily useful to detect whether two browser requests passed different parameters to APEX.', isSubstitutionString: true},
  {name:"APP_SESSION", description: 'APP_SESSION is the most commonly used built-in substitution strings. You can use this substitution string to create hypertext links between application pages that maintain a session state by passing the session number. Note that you can also use the substitution string SESSION in place of APP_SESSION.', isSubstitutionString: true},
  {name:"APP_SESSION_VISIBLE", description: 'APP_SESSION_VISIBLE is similar to the built-in substitution APP_SESSION. Use this substitution string to create hypertext links between application pages that maintain a session state by passing the session number. APP_SESSION_VISIBLE always returns \\\'0\\\' when users are not authenticated to an application and they are using the Zero Session ID feature of Oracle Application Express. ', isSubstitutionString: true},
  {name:"APP_TITLE", description: 'APP_TITLE is an alphanumeric title for the current application. The title is derived from an application substitution string called APP_TITLE. If not defined the Logo attribute will be used if it is of type text.', isSubstitutionString: true},
  {name:"APP_UNIQUE_PAGE_ID", description: 'APP_UNIQUE_PAGE_ID is an integer generated from an Oracle sequence which is unique for each page view. This number is used by applications to prevent duplicate page submissions and can be used for other purposes. For example, to make a unique URL and avoid browser caching issues, you can embed this number in the request or debug column in calls to the f procedure.', isSubstitutionString: true},
  {name:"APP_USER", description: 'APP_USER is the current user running the application. Depending upon your authentication model, the value of the user is set differently. If the application is running using database authentication, then the value of the user is the same as the database pseudo column USER. If the application uses an authentication scheme that requires the user to authenticate, the value of APP_USER is set by the authentication scheme, usually to the user name used during authentication.', isSubstitutionString: true},
  {name:"AUTHENTICATED_URL_PREFIX", description: 'This application-level attribute identifies a valid authenticated prefix (that is, a logged in URL prefix). You can use a relative path or a full path beginning with http. This item is useful if your application can be run in both authenticated (logged in) and public (not logged in) modes. You can use AUTHENTICATED_URL_PREFIX to construct a link to an authenticated page. This item is most useful when using basic database authentication because changes to the URL can require authentication. ', isSubstitutionString: true},
  {name:"BROWSER_LANGUAGE", description: 'BROWSER_LANGUAGE refers to the web browser\\\'s current language preference.', isSubstitutionString: true},
  {name:"CURRENT_PARENT_TAB_TEXT", description: 'CURRENT_PARENT_TAB_TEXT is most useful in page templates, but is only relevant for applications that use two-level tabs (that is, parent and standard tabs). Use this string to reference the parent tab label. This substitution string enables you to repeat the currently selected parent tab within the page template.', isSubstitutionString: true},
  {name:"DEBUG", description: 'Valid values for the DEBUG flag are Yes or No. Turning debug on shows details about application processing. If you write your own custom code, you may want to generate debug information only if the debug mode is set to Yes.', isSubstitutionString: true},
  {name:"HOME_LINK", description: 'HOME_LINK is the home page of an application. The Application Express engine redirects to this location if no page is given and if no alternative page is dictated by the authentication scheme\\\'s logic. You define the Home URL on the User Interface Details page.', isSubstitutionString: true},
  {name:"IMAGE_PREFIX", description: 'The value of IMAGE_PREFIX determines the virtual path the web server uses to point to the images directory distributed with Oracle Application Express. To reference uploaded images, use WORKSPACE_IMAGES and APP_IMAGES. ', isSubstitutionString: true},
  {name:"LOGIN_URL", description: 'Use LOGIN_URL to display a link to a login page for users that are not currently logged in.', isSubstitutionString: true},
  {name:"LOGOUT_URL", description: 'LOGOUT_URL is an application-level attribute used to identify the logout URL. This is a URL that navigates the user to a logout page or optionally directly logs out a user. To create a logout navigation bar entry, add a trailing period to &LOGOUT_URL (&LOGOUT_URL.). If you are coding a page template, use #LOGOUT_URL#.', isSubstitutionString: true},
  {name:"PRINTER_FRIENDLY", description: 'The value of PRINTER_FRIENDLY determines if the Application Express engine is running in print view mode. This setting can be referenced in conditions to eliminate elements not desired in a printed document from a page.', isSubstitutionString: true},
  {name:"PUBLIC_URL_PREFIX", description: 'PUBLIC_URL_PREFIX is an application-level attribute that identifies a URL to toggle out of a logged in mode to a public view.', isSubstitutionString: true},
  {name:"REQUEST", description: 'Each application button sets the value of REQUEST to the name of the button or to the request value attribute associated with the button, enabling accept processing to reference the name of the button when a user clicks it. In the f?p syntax, REQUEST may be set using the fourth argument.', isSubstitutionString: true},
  {name:"WORKSPACE_ID", description: 'Use this substitution string to reference the workspace ID.', isSubstitutionString: true}
];


function scrapeRange(startUrl,endUrl){
	currentScrapeUrl = startUrl;
	console.log('start scraping ' + currentScrapeUrl);
	request(currentScrapeUrl, function(error, response,html){
		if(!error){
			// Now use cheerio on the returned HTML which will give jQuery functionality
			$ = cheerio.load(html);
			let scrapedObjs = [];

			//NOTE: scrapingStandardFuncs should always be false because this has not yet been implemented. It's a work in progress at the moment.
			if(scrapingStandardFuncs) {
				if(currentScrapeUrl == beginUrl) {
					allStandardFuncUrls = scrapeStandardFuncUrls();
					nextUrl = allStandardFuncUrls.pop();
					console.log('nextUrl', baseUrl + nextUrl);
				}
				else {
					scrapedObjs = scrapeSnippetsFromStdPage();
				}
			}
			else {

				mergeConsecutivePres();


				if(!isExternalDoc) {
					nextUrl = html.match(/<a href="([^"]+)"><img width="24" height="24" src="[^"]*" alt="Go to next page"/)[1];

					if(html.indexOf('For a complete description of this package') != -1) {
						let externalDocUrl = $('p:contains("For a complete description of this package")').find('a').first().prop('href');
						if(externalDocUrl) {
							isExternalDoc = true;
							scrapeRange(baseUrl+externalDocUrl, endUrl);
							return;
						}
						else {
							console.log('-Error- cannot find external document url')
							return;
						}
					}
				} else {
					//nextUrl was set before this function was called, so we will go there next
				}

				scrapedObjs = scrapeSnippetsFromPage();

			}


			for(let i = 0; i < scrapedObjs.length; i++) {
				if(scrapedObjs[i]){
					if(!scrapedObjs[i]) {
						continue;
					}
					allScrapedObjs.push(scrapedObjs[i]);
				}
			}

			setTimeout(function(){
				if (startUrl != endUrl){
					//console.log('startUrl', startUrl, 'endUrl', endUrl )
					isExternalDoc = false;
					scrapeRange(baseUrl+nextUrl,endUrl);
				}
				else if(typeof scrapeType == 'object' && scrapeType.length > 0) {
					//Check to see if the last item we scraped is an apex item
					if(isApexScrape) {
						addGlobalsAndSubtitutionStrings();
					}
						initScrapeParameters();
						console.log('beginUrl',beginUrl,'finishUrl',finishUrl);
						scrapeRange(beginUrl,finishUrl);
				}
				else {
					//Check to see if the last item we scraped is an apex item
					if(isApexScrape) {
						addGlobalsAndSubtitutionStrings();
					}

					//Time to add back prefixes in where possible
					addPrefixesToAllScrapedObjsWherePossible()


					console.log('\nScraping Complete, sorting then writing allScrapedObjs to file');

					allScrapedObjs.sort(function(a,b) {
						//console.log('comparing',a['sN'].name,'to',b['sN'].name);
						let textA = a.name.toLowerCase();
						let textB = b.name.toLowerCase();
						return (textA < textB) ? -1 : (textA > textB) ? 1 : 0;
					});
					writeObjectsToFile(allScrapedObjs);


					convertAllScrapedObjsToDictionaryFormat();

					process.exit();
				};
			}, scrapingSpeed);
		}
	});
}




function mergeConsecutivePres() {
	var all = $('*').toArray();
	var $lastItem;
	var $currentItem;
	for(let i = 0; i < all.length; i++) {
		$currentItem = $(all[i]);
		 if($lastItem && $currentItem.prop('tagName') == 'PRE' && $lastItem.prop('tagName') == 'PRE') {
			 $lastItem.text($lastItem.text() + $currentItem.text());
		 } else {
			 $lastItem = $currentItem;
		 }
	}
}

function scrapeSnippetsFromPage() {
	let $allSyntaxCodeSections = $('.titleinrefsubsect:contains("Syntax"),'+
																 '.subhead1:contains("Syntax"),' +
																 '.subhead2:contains("Syntax")'
															 );

	if($allSyntaxCodeSections.length == 0){
		console.log('No Syntax Code Found')
		return [null];
	} else if ($allSyntaxCodeSections.length > 1)
	{
		let allSyntaxCodeSections = $allSyntaxCodeSections.toArray();
		let rslts = [];
		for(let i = 0; i < allSyntaxCodeSections.length; i++) {
			let $snippetHNode =  getPrevHNode($(allSyntaxCodeSections[i]));
			rslts.push(scrapeSingleSnippet(getSyntaxText($(allSyntaxCodeSections[i])), $snippetHNode));
		}
		return rslts;
	} else {
		let $snippetHNode = getPrevHNode($allSyntaxCodeSections);
		return [scrapeSingleSnippet(getSyntaxText($allSyntaxCodeSections), $snippetHNode)];
	}
}

function getPrevHNode($syntaxCodeSection) {

	let firstH = null;
	let seedNode = $syntaxCodeSection[0];
	let walk_the_DOM = function walk(node, func) {
			let rslt;
			if(rslt = func(node)) {
					if(rslt != 'found no pre') {
						firstH = node;
					} else {

					}
					return;
			};

			node = node.firstChild;
			while (node && !firstH) {
					walk(node, func);
					node = node.nextSibling;
			}
	};

	while(!firstH && seedNode) {
			walk_the_DOM(seedNode, function(node) {
					if(node && node.tagName && node.tagName) {
							let tagName = node.tagName.toLowerCase();
							if(tagName == 'h1' ||
								 tagName == 'h2' ||
								 tagName == 'h3') {
								 return node;
							}
					}
			});

		if($(seedNode).prev().length) {
			seedNode = $(seedNode).prev()[0];
		}
		else {
			seedNode = $(seedNode).parent()[0];
		}
	}
	return $(firstH);

}

function getSyntaxText($syntaxCodeSection) {
	let $section = $syntaxCodeSection;

	let firstPre = null;
	let foundNewSection = false;
	let sectionClass = $section[0].attribs.class; //For some reason cheerio doesn't like node.tagName or $(node).prop('tagName') here
	let seedNode = $section[0];
  let firstPass = true;
	let walk_the_DOM = function walk(node, func) {
			let rslt;
			if(rslt = func(node)) {
					if(rslt != 'found no pre') {
						firstPre = node;
					} else {
						foundNewSection = true;
					}
					return;
			};

			node = node.firstChild;
			while (node && !firstPre) {
					walk(node, func);
					node = node.nextSibling;
			}
	};

	while(!firstPre && seedNode && !foundNewSection) {
			walk_the_DOM(seedNode, function(node) {
					if(node && node.tagName && node.tagName.toLowerCase() == 'pre') {
							return node;
					}
					else if((node.className == sectionClass) && !firstPass) {
						return 'found no pre';
					}
					firstPass = false;
			});
		if($(seedNode).next().length) {
			seedNode = $(seedNode).next()[0];
		} else {
			seedNode = $(seedNode).parent()[0];
		}
	}

	if(!firstPre || foundNewSection) {
		console.log('-Error- Could not find pre, syntaxCodeSection:', $syntaxCodeSection.text());
		return -1;
	}

	let syntax = $(firstPre).text().trim();

	//Get rid of the occasional starting of: "function" or "procedure" or "exec"
	syntax = syntax.split(' ');
	if(syntax[0].toLowerCase() == 'function' ||
		 syntax[0].toLowerCase() == 'procedure' ||
		 syntax[0].toLowerCase() == 'exec') {
		syntax.splice(0,1);
	}
	syntax = syntax.join(' ');

	//console.log('syntax: ', syntax);
	return syntax;
}

function scrapeSingleSnippet(syntax, $snippetHNode) {
		if(syntax == -1) {
			return null;
		}

		let firstId = null;
		let seedNode = $snippetHNode[0];
		let walk_the_DOM = function walk(node, func) {
				if(func(node)) {
						return;
				};

				node = node.firstChild;
				while (node && !firstId) {
						walk(node, func);
						node = node.nextSibling;
				}
		};

		while(!firstId && seedNode) {
			walk_the_DOM(seedNode, function(node) {
					if(node && $(node) && $(node).prop('id')) {
							firstId = $(node).prop('id');
							return true;
					}
			});
			if(!$(seedNode).next().legnth) {
				seedNode = $(seedNode).next()[0];
			}
			else {
				seedNode = $(seedNode).parent()[0];
			}

		}

		if(!firstId) {
			console.log('-Error-Cannot find id for snippet');
			snippetUrl = 'error';
		} else {
			//console.log('currentScrapeUrl', currentScrapeUrl);
			//Remove '#'
			snippetUrl = currentScrapeUrl.split('#')[0];
			snippetUrl = snippetUrl + '#' + firstId;
		}

		let name;
		let missingPrefix = false;
		let descriptionText = getSnippetDescriptionText($snippetHNode);

		//Get the name of the function/procedure.
		//Note:the\s* fixes "DBMS_DATA_MINING. ALTER_REVERSE_EXPRESSION (" on http://docs.oracle.com/cd/B28359_01/appdev.111/b28419/d_datmin.htm#CACCBBJG
		var nameReg = /^[\w]+(\s*\.\s*)?[\w]+/;
		name = syntax.match(nameReg);
		if(!name || !name[0]) {
			return null;
		}
		else {
			name = name[0].toLowerCase();
		}
		//console.log('name: ' + name);
		if(getFirstSignatureOnly) {
			if(allSignatures[name]) {
				//console.log('skipping ' + name + ', signature already found');
				return null;
			} else {
				allSignatures[name] = true;
			}
		} else {
			if(!allSignatures[name]) {
				allSignatures[name] = 1;
			} else {
				allSignatures[name]++;
				signatureNum = allSignatures[name];
			}
		}

		if(name.indexOf('.') == -1) {
			if(!isExternalDoc) {
				if(isApexScrape && (apexVersion == 5.1 || apxVersion == 4.2)) {
					let regexp = /<meta name="keywords" content="([^"]+)"/;
					let rslt = regexp.exec($('html').html());
					if(rslt) {
						//console.log('found content to search through');
						let content = rslt[1];
						let apexPrefix = null;
						let onlyOneApexPrefix = true;
						content = content.split(',');
						for(let i = 0; i < content.length; i++) {
							content[i] = content[i].toLowerCase().trim();
							//console.log(content[i]);
							if(content[i].indexOf('apex_') == 0 && !apexPrefix) {
								apexPrefix = content[i].match(/apex_[\w]+/)[0];
							} else if(content[i].indexOf('apex_') == 0 && apexPrefix){
								//Looks like there's more than one apexPrefix so we can't draw any conclusions
								onlyOneApexPrefix = false;
								break;
							}
						}
						if(!apexPrefix)  {
							onlyOneApexPrefix = false;
						}

						if(onlyOneApexPrefix) {
							name = apexPrefix + '.' + name;
						}
					}

				} else {
					name = $('title').text().trim().split(' ')[0].toUpperCase() + '.' + name;
				}
			}
			else {
				console.log('-Warning- Name without period', name);
				missingPrefix = true;
			}
		}

		let packageName = '';
		if(name.indexOf('.') != -1) {
			packageName = name.match('^[^\.]+')[0];
		}
		let procFuncName = name.match('[^\.]+$')[0];

		console.log('scraping', name);
		//console.log('syntax', syntax);

		let body = "";
		let bodyNoDefault = "";
		let bodyFullText = syntax;
		let containsNonStandardParameterLine = false;
		let parameters = [];

		if(!doNotScrapeBody) {
			if(syntax.indexOf('(') == -1) {
				body = "";
			}
			else {
				//ASSUMPTIONS
				//Each paramter begins with /\w/

				let tmpCode;

				//Lop off the front
				tmpCode = syntax.replace(/^[^\(]+\(/,'');
				//Lop off the end (note: we want the LAST end parenthesis, hence the lookahead)
				tmpCode = tmpCode.replace(/\)(?=([^\)]+$))[^$]*?$/,'');

				let tmpCodeBase = tmpCode;
				tmpCode = "";
				isInStr = false;
				parenthesis = 1;
				for(let i = 0; i < tmpCodeBase.length; i++) {

					if(tmpCodeBase[i] == "'") {
						isInStr = !isInStr;
					}
					else if(!isInStr && tmpCodeBase[i] == ')') {
						parenthesis--;
						}
					else if(!isInStr && tmpCodeBase[i] == '(') {
							parenthesis++;
					}
					if(parenthesis != 0) {
							tmpCode += tmpCodeBase[i];
						} else {
							break;
						}
				}

				tmpCode = tmpCode.trim();



				if(!tmpCode || tmpCode == "") {
					console.log('-Warning- tmpCode is empty, Syntax:', syntax );
					body = "";
				}
				else {
					//The first half of the regex matches for when there's a default
					//The second half of the regex regex matches for when there is no default
					tmpCode = tmpCode.replace(/[\t \r]*([\w]+)[^,]+?(default|\:\=)\s([^,\n]+)[^\n]*|[\t \r]*([\w]+)[^\n]*/gi, '$1,$2,$3,$4');
					tmpCode = tmpCode.split('\n');
					let cursorIndexSkipDefault = 0;
					let cursorIndex = 0;
					//NOTE: For now prefixSpaces will always be a single tab, maybe later we'll change This
					//The issue is that atom's snippet interpretter has difficulty with tabbing at the start of a new line
					let prefixSpaces = '\t';
					//console.log(tmpCode);
					for(let i = 0; i < tmpCode.length; i++) {
						tmpCode[i] = tmpCode[i].split(',');
						if(tmpCode[i].length != 4) {
							//There is either no parameter here and instead something like "..."
							//e.g. http://docs.oracle.com/database/apex-5.1/AEAPI/ADD_MEMBER-Procedure.htm
							tmpCode[i] = tmpCode[i].join(',').trim();
							console.log('-Warning- found non-standard parameter line: ' + tmpCode[i]);
							containsNonStandardParameterLine = true;
							tmpCode[i] = prefixSpaces + tmpCode[i] + '\n';
							body += tmpCode[i];
							bodyNoDefault += tmpCode[i];
							continue;
						}
						cursorIndex++;
						let param;
						//Check to see whether we have a default or not
						if(tmpCode[i][3] != "") {
							//We don't have a default
							param = tmpCode[i][3];
							param = param.trim();
							cursorIndexSkipDefault++;

							body += prefixSpaces + ', ' + param + ' => $' + cursorIndexSkipDefault + '\n';
							bodyNoDefault += prefixSpaces + ', ' + param + ' => $' + cursorIndex + '\n';
							parameters.push(param);
						}
						else
						{
							//We do have a default
							param = tmpCode[i][0];
							param = param.trim();
							let defaultVal = tmpCode[i][2];
							body += prefixSpaces + ', ' + param + ' => ' + defaultVal + '\n';
							bodyNoDefault += prefixSpaces + ', ' + param + ' => $' + cursorIndex + '\n';
							parameters.push(param);
						}



						//We set prefixSpaces to 0 because we're on the second line or lower
						prefixSpaces = '\t';

					}
					//Remove the first comma and trailing whitespace
					body = body.replace(/,/, ' ');
					body = body.replace(/[\r\n\s\t]*$/, '');
					bodyNoDefault = bodyNoDefault.replace(/,/, ' ');
					bodyNoDefault = bodyNoDefault.replace(/[\r\n\s\t]*$/, '');

				}
			}
		}

		if(!name) {
			console.log('-Error- name is empty or undefined')
		}

		return {
			name: name,
			packageName: packageName,
			procFuncName: procFuncName,
			body: body,
			bodyNoDefault: bodyNoDefault,
			bodyFullText: bodyFullText,
			parameters: parameters,
			url: snippetUrl,
			descriptionText: descriptionText,
			rightLabelHTML: '',
			containsNonStandardParameterLine: containsNonStandardParameterLine,
			missingPrefix: missingPrefix,
			isApexFuncProc: isApexScrape,
			apexVersion: apexVersion ? apexVersion : null,
			isStandardFunction: false
		}
}

function addPrefixToName(name) {
	name = name.trim();
	console.log('-Error- Name found without prefix', name);
	return name;
}



//ASSUMPTION - the first text after the h1/h2 we are given will always contain the description text
//ASSUMPTION - we are already on a page where a snippet is found
function getSnippetDescriptionText($desc) {
	$desc = $desc.next();
	if(!$desc || $desc.length != 1) {
		console.log('-Warning-: unable to find description for snippet')
	}
	let text = $desc.text().trim().match(/[^\n]+/);
	if(text) {
		text = text[0];
	}
	if(!text) {
		console.log('-Warning-: description is empty for snippet')
		text = "";
	}
	text = text.replace(/[^\\]\\[^']/g,'\\\\'); //Replace \ with \\ unless it's escaping nothing or a '
	text = text.replace(/[^\\]\'/g,'\\\''); //Replace ' with \', unless it's already escaped.

	return text;
}


function addPrefixesToAllScrapedObjsWherePossible() {
	let lasPrefix = "";
	let nextPrefix = "";
	for(let i = 1; i < allScrapedObjs.length -1; i++) {
		if(allScrapedObjs[i].missingPrefix) {
			lastPrefix = allScrapedObjs[i-1].name.match(/^[^\.]+\./);
			nextPrefix = allScrapedObjs[i+1].name.match(/^[^\.]+\./);
			if(lastPrefix && nextPrefix) {
				lastPrefix = lastPrefix[0].replace(/\./,'').toUpperCase();
				nextPrefix = nextPrefix[0].replace(/\./,'').toUpperCase();
				if(lastPrefix == nextPrefix) {
					allScrapedObjs[i].name = nextPrefix + allScrapedObjs[i].name;
					allScrapedObjs[i].missingPrefix = false;
				}
			} else {
				console.log('-Error-Cannot find prefix for ' + allScrapedObjs[i].name);
			}
		}
	}
}

function writeObjectsToFile(allScrapedObjects){

	fs.writeFileSync(filename, JSON.stringify(allScrapedObjects));

	console.log('Finished. Scraped ' + allScrapedObjects.length + ' funcs/procs');
	let missingPrefixCount = 0;
	let containsNonStandardParameterLineCount = 0;
	for(let i = 0; i < allScrapedObjects.length; i++) {
		if(allScrapedObjects[i].missingPrefix) {
			missingPrefixCount++;
		}
		if(allScrapedObjects[i].containsNonStandardParameterLine){
			containsNonStandardParameterLineCount++;
		}
	}

	console.log('# MissingPrefixes: ' + missingPrefixCount + ', # w/ nonstandard parameter line: ' + containsNonStandardParameterLineCount );
	console.log('Writing to File: ' + filename);
}

//ASSUMPTION: CurrentURL is http://www.techonthenet.com/oracle/functions/index_alpha.php
function scrapeStandardFuncUrls() {
	let arr = [];
	$('.list-group a').each(function() {
		arr.push($(this).prop('href'))
	});
	return arr.reverse();
}

//NOTE: This function is not yet complete! It does not work.
//This function runs when we set scrapeType to contain 'standard'
//Do not use this function until it is finished being written (so do not set scrapeType to contain standard)
function scrapeSnippetsFromStdPage() {
	let packageName = 'STANDARD';
	let url = currentScrapeUrl;

	let procFuncName;
	let bodyNoDefault;
	let bodyFullText;
	let descriptionText;

	//Get rid of any infoboxes that may be between the purose/syntax p node, and the description p node.
	$('.infobox-note').remove()

	let $pDesc = $('p:contains("Purpose")');
	if(!$pDesc.length || !$pDesc.text().trim().match(/^Purpose/)) {
		$pDesc = $('p:contains("Syntax")')
		if(!$pDesc.length || !$pDesc.text().trim().match(/^Purpose/)) {
			console.log('-error- incorrect description pDesc Syntax/Purpose node');
			return [null];
		}
	}
	$pDesc = $pDesc.next();
	if(!$pDesc || !$pDesc.text().trim()) {
		console.log('-error- incorrect p node for description');
		return [null];
	}
	descriptionText[0] = descriptionText[0].toUpperCase();
	$desc = $pDesc.text().match(/^[^\n]+/);



	bodyFullText = $pSyntax.text().trim();
	procFuncName = bodyFullText.match(/^\w+/);
	bodyNoDefault = bodyFullText.replace(/^\w+/,'').trim();








	return
	[{
		name: packageName + '.' + funcName,
		packageName: packageName,
		procFuncName: procFuncName,
		body: null,
		bodyNoDefault: bodyNoDefault,
		bodyFullText: bodyFullText,
		parameters: null,
		url: url,
		descriptionText: descriptionText,
		rightLabelHTML: '',
		containsNonStandardParameterLine: false,
		missingPrefix: false,
		isApexFuncProc: false,
		apexVersion: null,
		isStandardFunction: true
	}]
}

//ASSUMPTION
function addGlobalsAndSubtitutionStrings() {

}



scrapeRange(beginUrl,finishUrl);
exports = module.exports = app;
