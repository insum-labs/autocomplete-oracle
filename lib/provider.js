'use babel';

var path = require('path');

class OracleCompletionProvider {

    constructor(){
        this.selector = '.source.plsql.oracle';
        this.disableForSelector = '.source.plsql.oracle .comment.block.oracle, .source.plsql.oracle .comment.line.double-dash.oracle';
        this.filterSuggestions = true;
    }

    loadDataStore(jsonPath){
        this.dataStore = require(jsonPath);
    }

    stringStartsWith(str, testStr){
        if (!testStr){
            return false;
        }
        return str.slice(0, testStr.length) == testStr.toUpperCase();
    }

    getSuggestions(suggestInfo) {
        if (suggestInfo.prefix.length < 2){
            return;
        }

        let allSuggestions = new Array();

        if (!(this.dataStore)){
            this.loadDataStore(path.resolve(__dirname, '..', 'dataStore.json'));
        }

        let matchingPackages = this.getMatchingPackages(suggestInfo.prefix);

        let cursorPosition = suggestInfo.bufferPosition;
        let lineText = suggestInfo.editor.getTextInRange([[cursorPosition.row, 0], cursorPosition]);
        let lineWords = lineText.match(/[\w]+|\./g);

        let wordMaxIndex = lineWords.length-1;

        if (lineWords[wordMaxIndex-1] == '.' && wordMaxIndex >= 2) {
            let previousToken = this.getMatchingPackages(lineWords[wordMaxIndex-2]);
            //only get function list if there is an exact match of 1 to the prev token
            if (previousToken.length == 1){
                let procedures = this.dataStore.packages[previousToken[0]].procedures;
                for (proc of procedures){
                    allSuggestions.push(this.getProcedureSuggestion(proc, suggestInfo.prefix));
                }
            }
        } else {
            for (let keyword of this.dataStore.keywords){
                if (this.stringStartsWith(keyword, suggestInfo.prefix)){
                    allSuggestions.push(this.getKeywordSuggestion(keyword, suggestInfo.prefix));
                }
            }

            for (pkg in this.dataStore.packages){
                if (this.stringStartsWith(pkg, suggestInfo.prefix)){
                    allSuggestions.push(this.getPackageSuggestion(pkg, suggestInfo.prefix));
                }
            }
        }

        return allSuggestions;
    }

    getMatchingPackages(prefix){

        let packageList = [];

        for (pkg in this.dataStore.packages){
            if (this.stringStartsWith(pkg, prefix)){
                packageList.push(pkg);
            }
        }

        return packageList;

    }

    getKeywordSuggestion(keywordName, prefix){

        let suggestion = this.buildSuggestion(keywordName, "keyword", prefix);

        return suggestion;
    }

    getPackageSuggestion(packageName, prefix){

        let suggestion = this.buildSuggestion(packageName, "class", prefix);

        return suggestion;
    }

    getProcedureSuggestion(procedureName, prefix){

        let suggestion = this.buildSuggestion(procedureName, "method", prefix);

        return suggestion;
    }

    buildSuggestion(text, type, prefix){
        let suggestion;
        let firstCharOfPrefix = prefix.charAt(0);

        if (firstCharOfPrefix == firstCharOfPrefix.toUpperCase()){
            suggestion = {
                "text" : text.toUpperCase(),
                "displayText" : text.toUpperCase(),
                "type" : type
            };
        } else {
            suggestion = {
                "text" : text.toLowerCase(),
                "displayText" : text.toLowerCase(),
                "type" : type
            };
        }

        return suggestion;
    }
}

module.exports = OracleCompletionProvider;
