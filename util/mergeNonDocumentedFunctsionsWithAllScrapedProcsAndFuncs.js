/* PARAMETERS*/
var nonDocFuncsFileName = 'nonDocumentedFunctions12G.txt';
var docFuncsFileName = 'oracle12cApexVer51.json';
/* End of Parameters */

var fs = require('fs');
var nonDocFuncs = fs.readFileSync(nonDocFuncsFileName, {'encoding':'utf8'});
var docFuncs = fs.readFileSync(docFuncsFileName,{'encoding':'utf8'});
var allFuncProcs = {};

nonDocFuncs = nonDocFuncs.trim();
nonDocFuncs = nonDocFuncs.split('\n');

docFuncs = JSON.parse(docFuncs);



function mergeDocFuncsIntoAllFuncProcs() {
  for(let i = 0; i < docFuncs.length; i++) {
      var packageName = docFuncs[i].packageName.toUpperCase();
      var procFuncName = docFuncs[i].procFuncName.toUpperCase();
      if(!allFuncProcs[packageName]) {
        allFuncProcs[packageName] = {};
      }
      allFuncProcs[packageName][procFuncName] = docFuncs[i];
  }
}


function mergeNonDocFuncsIntoAllFuncProcs() {
  var body = '';
  var currentPackage = '';
  var currentFuncProc = '';
  var currentArguments = '';
  var currentFuncReturn = '';
  var bodyFullText = '';
  for(var i = 0; i < nonDocFuncs.length; i++) {
    if(!nonDocFuncs[i].match(/^\s\s\s\s/)) {
      currentPackage = nonDocFuncs[i].trim();
      if(!allFuncProcs[currentPackage]) {
        allFuncProcs[currentPackage] = {};
      }
      addFuncProc();
    }
    else if(!nonDocFuncs[i].match(/^\s\s\s\s\s\s\s\s/)) {
      addFuncProc();

      currentArguments = '';
      currentFuncReturn = '';


      currentFuncProc = nonDocFuncs[i].trim();
      currentFuncReturn = null;
    }else if(nonDocFuncs[i].match(/\s\s\s\s\s\s\s\s#/)) {
      currentFuncReturn = nonDocFuncs[i].trim().split(' ')[1];
    }else {
      currentArguments += ('\n' + nonDocFuncs[i]);
      currentArguments = currentArguments.trim();
    }
  }

  addFuncProc();

  function addFuncProc() {
    if(currentFuncProc) {
      currentArguments = currentArguments.replace(/N\n|N$/g, '\n');
      currentArguments = currentArguments.replace(/Y\n|Y$/g, 'default {unknown}\n');
      var currentArgumentsSnippet;
      currentArgumentsSnippet = currentArguments.trim().split('\n');
      currentArguments = '        ' + currentArguments;
      var length = currentArgumentsSnippet.length;
      for(var j = 0; j < length; j++) {
        currentArgumentsSnippet[j] = (j != 0 ? '\t, ' : '\t  ') +
                                     currentArgumentsSnippet[j].trim().split(' ')[0] +
                                      ' => ';
        if(j != length -1) {
          currentArgumentsSnippet[j] = currentArgumentsSnippet[j] + '$' + (j+1);
        }
        else {
          currentArgumentsSnippet[j] = currentArgumentsSnippet[j] + '$' + (j+1);
        }
      }

      currentArgumentsSnippet = currentArgumentsSnippet.join('\n');

      bodyFullText = currentPackage + '.' + currentFuncProc +
                     (currentArguments ? '(\n' + currentArguments + ')': '' ) +
                     (currentFuncReturn ? '\nreturn ' + currentFuncReturn : '');
      bodyNoDefault = (currentArguments ? currentArgumentsSnippet + '\n' : '');
      allFuncProcs[currentPackage][currentFuncProc] = {
        bodyFullText: bodyFullText,
        bodyNoDefault: bodyNoDefault
      };
    }
  }
}

mergeDocFuncsIntoAllFuncProcs()
mergeNonDocFuncsIntoAllFuncProcs();

fs.writeFileSync('allFuncProcsOracle12CApex51.json', JSON.stringify(allFuncProcs));
//Now merge it with

//console.log(allFuncProcs);
