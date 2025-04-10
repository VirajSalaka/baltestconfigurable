import ballerina/io;

import ballerina/http;

// The host of the database server. The default value is `localhost`.
configurable string dbHost = "localhost";


public configurable readonly & map<string> companyEmailRecipientsMapping = ?;


service / on new http:Listener(9090) {

    // This function responds with `string` value `Hello, World!` to HTTP GET requests.
    resource function get greeting() returns string {
        foreach string name in companyEmailRecipientsMapping.keys() {
            io:println(name, " : ", companyEmailRecipientsMapping[name]);
        }
        io:println( "keys : ", companyEmailRecipientsMapping.keys());
        return "Hello, World!";
    }
}