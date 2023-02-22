
import '../util/images.dart';

class CarStory {
  final String imagePath;
  final String type;
  CarStory({
    required this.imagePath,
    required this.type,
  });
}

List<CarStory> carsStory = [
  CarStory(imagePath: image1, type: "جيلي"),
  CarStory(imagePath: image2, type: "بي ام دبليو"),
  CarStory(imagePath: image3, type: "تويتا"),
  CarStory(imagePath: image4, type: "جيلي"),

];
