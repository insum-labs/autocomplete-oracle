'use babel';

const OracleProvider = require('./provider.js');
let completionProvider;




class Provider {


    activate(){
        this.completionProvider = new OracleProvider();
        completionProvider = this.completionProvider;
        atom.commands.add('atom-text-editor', 'autocomplete-oracle:expandParemeters', function() {
          completionProvider.expandSnippet();
        });


    }

    getProvider(){
        return this.completionProvider;
    }



}

new Provider();





module.exports = new Provider();
module.exports.config = {};
module.exports.config.commaPlacement = {
                                        title: 'Comma Preference',
                                        description: 'Commas appear before/after parameters',
                                        type: 'string',
                                        default: 'Before',
                                        enum: ['Before','After'],
                                        order: 10
                                      }
module.exports.config.populateParamsWithPlaceholder = {
                                        title: 'Populate Parameters with Placeholder',
                                        description: 'After accepting a procedure/function, the parameters will be populated with placeholders.',
                                        type: 'string',
                                        default: 'No',
                                        enum: ['Yes','No'],
                                        order: 20
                                      }
