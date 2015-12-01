'use babel';

const OracleProvider = require('./provider.js');

class Provider {

    activate(){
        this.completionProvider = new OracleProvider();
    }

    getProvider(){
        return this.completionProvider;
    }
}

module.exports = new Provider();
