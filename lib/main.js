'use babel';

const OracleProvider = require('./provider.js');
let completionProvider;




class Provider {


    activate(){
        this.completionProvider = new OracleProvider();
        completionProvider = this.completionProvider;
        atom.commands.add('atom-text-editor', 'autocomplete-oracle:test', function() {
          completionProvider.expandSnippet();
        });


    }

    getProvider(){
        return this.completionProvider;
    }



}

new Provider();





module.exports = new Provider();
module.exports.CoffeeView = null;
module.exports.modalPanel = null;
module.exports.subscriptions = null;
module.exports.config = {};
module.exports.config.commaPlacement = {
                                        title: 'Comma Preference',
                                        description: 'Commas appear before/after parameters',
                                        type: 'string',
                                        default: 'Before',
                                        enum: ['Before','After'],
                                        order: 10
                                      }
