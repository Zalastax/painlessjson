module painlessjson.string;

import std.string;
import std.conv;
import std.array;
import std.ascii : isLower, isUpper;

version (unittest)
{
    import dunit.toolkit;

}

unittest {
    enum hello_world = camelCaseToUnderscore("helloWorld");
    assertEqual(hello_world,"hello_world");
    enum my_json = camelCaseToUnderscore("myJSON");
    assertEqual(my_json,"my_json");
}

string camelCaseToUnderscore(string input){
    auto stringBuilder = appender!string;
    stringBuilder.reserve(input.length*2);
    bool previousWasLower = false;
    foreach(c;input){
        if(previousWasLower && c.isUpper())
        {
            stringBuilder.put('_');
        }

        if(c.isLower())
        {
            previousWasLower = true;
        } else{
            previousWasLower = false;
        }
        stringBuilder.put(c);
    }
    return stringBuilder.data.toLower();
}