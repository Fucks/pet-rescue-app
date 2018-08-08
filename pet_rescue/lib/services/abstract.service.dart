abstract class Services {

  Map getHeaders() {
      var headers = new Map();

      headers["Authorization"] = "Bearer xyz";

      return headers;

  }
}