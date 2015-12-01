'use babel';

var fs = require('fs');
var path = require('path');

class OracleCompletionProvider {

    constructor(){
        this.selector = '.source.plsql.oracle';
        this.filterSuggestions = true;
    }

    loadDataStore(jsonPath){
        this.dataStore = require(jsonPath);
    }

    stringStartsWith(str, testStr){
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

        for (let keyword of this.dataStore.keywords){
            if (this.stringStartsWith(keyword, suggestInfo.prefix)){
                allSuggestions.push(this.getKeywordSuggestion(keyword, suggestInfo.prefix));
            }
        }

        return allSuggestions;
    }

    getKeywordSuggestion(keywordName, prefix){
        let suggestion;
        let firstChar = prefix.charAt(0);

        if (firstChar == firstChar.toUpperCase()){
            suggestion = {
                "text" : keywordName.toUpperCase(),
                "displayText" : keywordName.toUpperCase(),
                "type" : "keyword"
            };
        } else {
            suggestion = {
                "text" : keywordName.toLowerCase(),
                "displayText" : keywordName.toLowerCase(),
                "type" : "keyword"
            };
        }



        return suggestion;
    }
}

module.exports = OracleCompletionProvider;
