'use babel';

var path = require('path');



String.prototype.regexIndexOf = function(regex, startpos) {
    var indexOf = this.substring(startpos || 0).search(regex);
    return (indexOf >= 0) ? (indexOf + (startpos || 0)) : indexOf;
}

let myself;




//console.log('require string', atom.packages.resolvePackagePath('snippets'));

let snippetPackagePath = atom.packages.resolvePackagePath('snippets')
let snippetHandler = require(snippetPackagePath);
/*var expandedSnippet = require(snippetPackagePath + '\\lib' + '\\snippet-expansion.js');
var snippet = require(snippetPackagePath + '\\lib' + '\\snippet-expansion.js');
console.log('apd', apd);
console.log('expandedSnippet', expandedSnippet);
console.log('snippet class', snippet);*/




class OracleCompletionProvider {

		constructor(){
				this.selector = '.source.plsql.oracle';
				this.disableForSelector = '.source.plsql.oracle .comment.block.oracle, .source.plsql.oracle .comment.line.double-dash.oracle';
				this.filterSuggestions = true;
				this.marker = null;
				this.decoration = null;
				this.editorSubscription = null;
				this.editor = null;
				this.docDataStore = null;
				this.dataStoreLoaded = false;
				this.snippet = null;
        this.language = null;
				myself = this;

        let waitForInit = setInterval(function() {
          if(atom && atom.workspace && atom.workspace.onDidChangeActiveTextEditor && atom.workspace.getActiveTextEditor()) {
  					atom.workspace.onDidChangeActiveTextEditor(function(editor) {
              myself.subscribeToEditor(true);
  					});
            myself.subscribeToEditor(true);
            clearInterval(waitForInit);
  				}
        }, 1000)

        setInterval(function() {
          if(atom && atom.workspace && atom.workspace.getActiveTextEditor()) {
            //console.log('checking...')
            let currEditor = atom.workspace.getActiveTextEditor();

            //console.log('myself.language', myself.language)
            //console.log('currEditor.getRootScopeDescriptor()', currEditor.getRootScopeDescriptor());
            if(myself.language != currEditor.getRootScopeDescriptor()) {
              myself.subscribeToEditor(false);
            }
          }
        }, 500);
		}


		subscribeToEditor(editorChanged) {
			//console.log('subscribing..');
			if(this.editorSubscription && editorChanged) {
				this.editorSubscription.dispose();
			}
			this.editor = atom.workspace.getActiveTextEditor();
			if(this.editor) {
        this.language = atom.workspace.getActiveTextEditor().getRootScopeDescriptor();
        //console.log(this.language);
				this.editorSubscription =
					atom.workspace.getActiveTextEditor().onDidChangeCursorPosition(function(e) {
						if(myself.language && myself.language.scopes.length) {
							let lang = myself.language.scopes[0];
							if(lang == 'source.sql' ||
								 lang == 'source.plsql.oracle') {
                 //console.log('calling handleOverlayDecoration');
								editor = atom.workspace.getActiveTextEditor();
								myself.handleOverlayDecoration();
							}
					}
				});
			}
		}

		loadDataStore(){
			let jsonPath = 'dataStore.json';
			this.dbDataStore = path.resolve(__dirname, '..', jsonPath);
			this.dbDataStore = require(this.dbDataStore);
			jsonPath = 'allFuncProcsOracle12CApex51.json';
			this.docDataStore = path.resolve(__dirname, '..', jsonPath);
			this.docDataStore = require(this.docDataStore);
			this.dataStoreLoaded = true;
      console.log('docDataStore loaded', this.docDataStore)
      console.log('dbDataStore', this.dbDataStore);
		}

		stringStartsWith(str, testStr){
				if (!testStr){
						return false;
				}
				return str.slice(0, testStr.length) == testStr.toUpperCase();
		}

		handleOverlayDecoration() {
			if (!this.dataStoreLoaded){
					this.loadDataStore();
			}

      //first check to see if we are inside of a function,
      //  if so get the linetext of the line corresponding to the opening parenthesis
      let cursorIsInsideOfParetheses;


			let cursorPosition = this.editor.getCursorBufferPosition();
			let lineText = this.editor.getTextInRange([[cursorPosition.row, 0], cursorPosition]);

			//console.log(lineText);
			let fullLastWord = this.editor.getWordUnderCursor();
			if(fullLastWord) {
				//console.log(fullLastWord);
				fullLastWord = fullLastWord.match(/\w+/);
				if(fullLastWord && fullLastWord.length) {
					fullLastWord = fullLastWord[0];
				}
				 else {
					fullLastWord = null;
				}
			}

			let lineWords = lineText.match(/[\w]+|\./g);
			if(!lineWords || !lineWords.length) {
				this.destroyDecorationAndSnippet();
				return;
			}

			if(lineWords.length < 3) {
				this.destroyDecorationAndSnippet();
				return;
			}

			let wordMaxIndex = lineWords.length-1;
			if(fullLastWord) {
				lineWords[wordMaxIndex] = fullLastWord;
			}

			let packageName;
      let procName;
			let snippet;

      //console.log(lineWords);
			if(lineWords[wordMaxIndex -1] != '.') {
				this.destroyDecorationAndSnippet();
				return;
			} else {
				packageName = lineWords[wordMaxIndex-2].toUpperCase();
        procName = lineWords[wordMaxIndex].toUpperCase();
			}

			console.log('lineWord', lineWords, 'packageName', packageName,'procName',procName);

      if(this.docDataStore[packageName] && this.docDataStore[packageName][procName]) {
        snippet = this.docDataStore[packageName][procName];
        //console.log(snippet);
      } else {
        this.destroyDecorationAndSnippet();
        return;
      }

			//console.log('Found Snippet Match!');

			let type = 'overlay';

			let position = this.editor.getCursorBufferPosition();
			let range = [position, position];

      let container = document.createElement('div');
			let pre = document.createElement('pre');
			pre.classList.add('overlay');
			pre.innerHTML = snippet.bodyFullText;
      pre.innerHTML += snippet.url ? '<br /><a href = ' + snippet.url + '>more..</a>' : '';
      /*descDiv.innerHTML = snippet.descriptionText ? '' + this.getFirstSentenceOfDescription(snippet.descriptionText + '\n')
                                                : '';*/

      container.appendChild(pre);

			container.onclick = function(e) {
				myself.expandSnippet();
			};
			this.marker = this.editor.getLastCursor().marker;

			//create a decoration that follows the marker. A Decoration object is returned which can be updated
			this.destroyDecorationAndSnippet();

			this.decoration = this.editor.decorateMarker(this.marker, {type: type,
																					item: container,
																					invalidate:'touch',
																					position:'after',
																					avoidOverFlow:false
                                        });
			this.snippet = snippet;
			//console.log('set decoration', this.decoration);

		}

		destroyDecorationAndSnippet() {
			if(this.decoration) {
				this.decoration.destroy();
			}
			if(this.snippet) {
				this.snippet = null;
			}
		}

		expandSnippet() {
			if(this.snippet) {
				let body = this.snippet.bodyNoDefault;
        body = body.trim();
        if(!body) {
          return;
        } else {

          //Get all whitespace before the first word, so we can maintain the proper indentation
  				let cursorPosition = this.editor.getCursorBufferPosition();
  				let lineText = this.editor.getBuffer().getLines()[cursorPosition.row];
  				let lineTextLength = lineText.length;
          this.editor.setCursorBufferPosition([cursorPosition.row,lineTextLength]);

  				let startOfChopping = lineText.regexIndexOf(/[^a-zA-Z\.1-9]*$/);
          this.editor.getBuffer().setTextInRange([[cursorPosition.row, startOfChopping],
  																								[cursorPosition.row, lineTextLength]],'');

          indentation = lineText.match(/^[\t\s]*/)[0];

  				body = body.replace(/\n/g, '\n' + indentation);

  				if(atom.config.get('autocomplete-oracle.commaPlacement') == 'After') {
  					body = body.trim();
  					body = body.replace(/, /g, '');
  					body = body.replace(/\n/g,',\n');
  					body = indentation + body;
  				} else {
  					body = indentation + '  ' + body;
  				}
          snippetHandler.insert(
  				                       '(\n' +
  															 '\t' + body +
  															 ' );'
  														 );
        }
      }
		}

		getSuggestions(suggestInfo) {


				let allSuggestions = new Array();

				if (!this.dataStoreLoaded){
						this.loadDataStore();
				}


				let cursorPosition = suggestInfo.bufferPosition;
				let lineText = suggestInfo.editor.getTextInRange([[cursorPosition.row, 0], cursorPosition]);
				let lineWords = lineText.match(/[\w]+|\.|;|\(|\)/g);

        if(!lineWords) {
          return;
        }
				let wordMaxIndex = lineWords.length-1;


				//At least 2 wors if The previous word is `.`
				//At least 1 word if the current word is `.`
				if ((lineWords[wordMaxIndex-1] == '.' && wordMaxIndex >= 2) ||
				    (lineWords[wordMaxIndex] == '.' ) && wordMaxIndex >= 1 ) {

						//convert to upper as that's how they're referenced in dataStore.json
						let prevWord = lineWords[wordMaxIndex] == '.' ? lineWords[wordMaxIndex-1] : lineWords[wordMaxIndex-2]
						let doesPackageExist = this.packageExists(prevWord.toUpperCase());

						//only get function list if there is an exact match of 1 to the prev token
						if (doesPackageExist){

								let packageObj = this.dbDataStore.packages[prevWord.toUpperCase()];

								let procedures = packageObj.procedures;
                console.log('inside doesPackageExist');
								for (proc of procedures){
                    let description;
                    let descriptionMoreURL;
                    let packageName = prevWord.toUpperCase();
                    let snippet;
                    if(this.docDataStore[packageName] && this.docDataStore[packageName][proc]) {
                      console.log('inside inner statement');
                      snippet = this.docDataStore[packageName][proc];
                      description = snippet.descriptionText;

                      //Only show the first sentence
                      description = this.getFirstSentenceOfDescription(description);

                      descriptionMoreURL = snippet.url;
                    }
										allSuggestions.push(this.getProcedureSuggestion(proc, prevWord, description, descriptionMoreURL));
								}

								/*let identifiers = packageObj.identifiers;
								for (ident of identifiers){
										allSuggestions.push(this.getIdentifierSuggestion(ident, suggestInfo.prefix));
								}*/

						}
				}
				else if(suggestInfo.prefix.length >= 2) {
						for (let keyword of this.dbDataStore.keywords){
								if (this.stringStartsWith(keyword, suggestInfo.prefix)){
										allSuggestions.push(this.getKeywordSuggestion(keyword, suggestInfo.prefix));
								}
						}

						for (pkg in this.dbDataStore.packages){
								if (this.stringStartsWith(pkg, suggestInfo.prefix)){
										allSuggestions.push(this.getPackageSuggestion(pkg, suggestInfo.prefix));
								}
						}
				} else {
					return;
				}

				return allSuggestions;
		}

		getMatchingPackages(prefix){

				let packageList = [];

				for (pkg in this.dbDataStore.packages){
						if (this.stringStartsWith(pkg, prefix)){
								packageList.push(pkg);
						}
				}

				return packageList;

		}

		packageExists(prefix){

				for (pkg in this.dbDataStore.packages){
						if (pkg.toUpperCase() === prefix.toUpperCase()){
								return true;
						}
				}

				return false;
		}

		getKeywordSuggestion(keywordName, prefix){

				let suggestion = this.buildSuggestion(keywordName, "keyword", prefix);

				return suggestion;
		}

		getPackageSuggestion(packageName, prefix){

				let suggestion = this.buildSuggestion(packageName, "class", prefix);

				return suggestion;
		}

		getProcedureSuggestion(procedureName, prefix, description, descriptionMoreURL){

				let suggestion = this.buildSuggestion(procedureName, "method", prefix, description, descriptionMoreURL);

				return suggestion;
		}

		getIdentifierSuggestion(identifierName, prefix){

				let suggestion = this.buildSuggestion(identifierName, "type", prefix);

				return suggestion;
		}

		buildSuggestion(text, type, prefix, description, descriptionMoreURL){
				let suggestion;
				let firstCharOfPrefix = prefix.charAt(0);

        //Make sure that if we have a descriptionMoreURL, description is not null
        //We do this because if description is null then autocomplete wont show the descriptionMoreURL
        if(!description && descriptionMoreURL) {
          description = ' ';
        }

				if (firstCharOfPrefix == firstCharOfPrefix.toUpperCase()){
						suggestion = {
								"text" : text.toUpperCase(),
								"displayText" : text.toUpperCase(),
								"type" : type,
								"description" : description,
								"descriptionMoreURL": descriptionMoreURL
						};
				} else {
						suggestion = {
								"text" : text.toLowerCase(),
								"displayText" : text.toLowerCase(),
								"type" : type,
								"description" : description,
								"descriptionMoreURL": descriptionMoreURL
						};
				}

				return suggestion;
		}

    getFirstSentenceOfDescription(description) {
      if(description) {
        let firstSentence = description.match(/^[^\.]*\.( |$|\n|\t)/);
        if(firstSentence) {
            description = firstSentence[0];
        }
      }
      return description;

    }
}

module.exports = OracleCompletionProvider;
