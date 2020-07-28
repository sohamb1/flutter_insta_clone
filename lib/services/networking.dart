import 'package:http/http.dart' as http;

const getFeedUpDummyData = 'https://gist.githubusercontent.com/sohamb1/afae18ea26c50337f81bc3294dc61d9e/raw/feed';
const getExploreDummyData = 'https://gist.githubusercontent.com/sohamb1/e38a283bfe84f1e3566cfedf6109587a/raw/explore';
const getProfileDummyData = 'https://gist.githubusercontent.com/sohamb1/093eea7fa6a9c1d73038371922875089/raw/profile';

class NetworkHelper {
  Future<http.Response> getFeedUpData(String url) {
    return http.get(
        url
    );
  }

  Future<http.Response> getExploreData(String url) {
    return http.get(
        url
    );
  }

  Future<http.Response> getProfileData(String url) {
    return http.get(
        url
    );
  }
}