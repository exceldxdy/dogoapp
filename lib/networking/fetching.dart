import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future noAuthApiCallList(String uri, [Map<String, dynamic>? params]) async {
  /*
  This function does an API call without authentication.
  Its intended use is to retrieve a list of data from the API
   when the list is available without authentication.
  Receives a mandatory String parameter named 'uri' which contains the url
   direction of the data that it's going to be retrieved and an optional
   Map parameter named 'params' which are additional optional parameters
   on the request.
  If the status code of the response is different from the successful 200,
   the function throws an exception, else, decodes the response into a List.
  */
  http.Response apiResponse;
  List listResponse = <dynamic>[];
  if(params != null){
    var requestCompleteUrl = Uri.parse(uri).replace(queryParameters: params);
    apiResponse = await http.get(requestCompleteUrl);
    if(apiResponse.statusCode != 200){
      throw Exception('Failed to retrieve data from API.');
    }
    return listResponse = json.decode(apiResponse.body);
  }
  else {
    apiResponse = await http.get(Uri.parse(uri));
    if(apiResponse.statusCode != 200){
      throw Exception('Failed to retrieve data from API.');
    }
    return listResponse = json.decode(apiResponse.body);
  }
}

Future noAuthApiCallMap(String uri, [Map<String, dynamic>? params]) async {
  /*
  This function does an API call without authentication.
  Its intended use is to retrieve a map of data from the API
   when the map is available without authentication.
  Receives a mandatory String parameter named 'uri' which contains the url
   direction of the data that it's going to be retrieved and an optional
   Map parameter named 'params' which are additional optional parameters
   on the request.
  If the status code of the response is different from the successful 200,
   the function throws an exception, else, decodes the response into a Map.
  */
  http.Response apiResponse;
  Map mapResponse = <dynamic, dynamic>{};
  if(params != null){
    var requestCompleteUrl = Uri.parse(uri).replace(queryParameters: params);
    apiResponse = await http.get(requestCompleteUrl);
    if(apiResponse.statusCode != 200){
      throw Exception('Failed to retrieve data from API.');
    }
    return mapResponse = json.decode(apiResponse.body);
  }
  else {
    apiResponse = await http.get(Uri.parse(uri));
    if(apiResponse.statusCode != 200){
      throw Exception('Failed to retrieve data from API.');
    }
    return mapResponse = json.decode(apiResponse.body);
  }
}

Future authApiCallList(String uri, Map<String, String> headers, [Map<String, dynamic>? params]) async {
  /*
  This function does an API call with authentication.
  Its intended use is to retrieve a list of data from the API
   when the list is available only with authentication.
  Receives a mandatory String parameter named 'uri' which contains the url
   direction of the data that it's going to be retrieved, a mandatory Map
   parameter which has the headers needed to do the authentication and an optional
   Map parameter named 'params' which are additional optional parameters
   on the request.
  If the status code of the response is different from the successful 200,
   the function throws an exception, else, decodes the response into a List.
  */
  http.Response apiResponse;
  List listResponse = <dynamic>[];
  if(params != null){
    var requestCompleteUrl = Uri.parse(uri).replace(queryParameters: params);
    apiResponse = await http.get(requestCompleteUrl, headers: headers);
    if(apiResponse.statusCode != 200){
      throw Exception('Failed to retrieve data from API.');
    }
    return listResponse = json.decode(apiResponse.body);
  }
  else {
    apiResponse = await http.get(Uri.parse(uri), headers: headers);
    if(apiResponse.statusCode != 200){
      throw Exception('Failed to retrieve data from API.');
    }
    return listResponse = json.decode(apiResponse.body);
  }
}

Future authApiCallMap(String uri, Map<String, String> headers, [Map<String, dynamic>? params]) async {
  /*
  This function does an API call with authentication.
  Its intended use is to retrieve a map of data from the API
   when the map is available only with authentication.
  Receives a mandatory String parameter named 'uri' which contains the url
   direction of the data that it's going to be retrieved, a mandatory Map
   parameter which has the headers needed to do the authentication and an optional
   Map parameter named 'params' which are additional optional parameters
   on the request.
  If the status code of the response is different from the successful 200,
   the function throws an exception, else, decodes the response into a Map.
  */
  http.Response apiResponse;
  Map mapResponse = <dynamic, dynamic>{};
  if(params != null){
    var requestCompleteUrl = Uri.parse(uri).replace(queryParameters: params);
    apiResponse = await http.get(requestCompleteUrl, headers: headers);
    if(apiResponse.statusCode != 200){
      throw Exception('Failed to retrieve data from API.');
    }
    return mapResponse = json.decode(apiResponse.body);
  }
  else {
    apiResponse = await http.get(Uri.parse(uri), headers: headers);
    if(apiResponse.statusCode != 200){
      throw Exception('Failed to retrieve data from API.');
    }
    return mapResponse = json.decode(apiResponse.body);
  }
}