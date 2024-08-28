class OnBoardingModel {
  String image;
  String text;
  OnBoardingModel({required this.image, required this.text});
}

List<OnBoardingModel> data = [
  OnBoardingModel(image: 'assets/images/branscan.png', text: 'Brain scan'),
  OnBoardingModel(
      image: 'assets/images/chat.png', text: 'chat with specialist doctors')
];
