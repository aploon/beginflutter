import 'package:beginflutter/utils/helper.dart';
import 'package:http/http.dart' as http;
import '../models/video.dart';

getVideoFromApi({VideoSort filter = VideoSort.id}) async{
  
  final url = Uri.parse('https://orangevalleycaa.org/api/videos/order/${filter.filterName()}');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json = response.body;
    return videoFromJson(json);
  } else {
    return [];
  }
}
