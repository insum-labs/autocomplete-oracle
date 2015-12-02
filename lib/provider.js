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

        for (pkg in this.dataStore.packages){
            if (this.stringStartsWith(pkg, suggestInfo.prefix)){
                allSuggestions.push(this.getPackageSuggestion(pkg, suggestInfo.prefix));
            }
        }

        return allSuggestions;
    }

    getKeywordSuggestion(keywordName, prefix){

        let suggestion = this.buildSuggestion(keywordName, "keyword", prefix);

        return suggestion;
    }

    getPackageSuggestion(packageName, prefix){

        let suggestion = this.buildSuggestion(packageName, "class", prefix);

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
