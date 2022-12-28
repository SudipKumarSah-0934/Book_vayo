class OnboardingContent {
  String image;
  String title;

  OnboardingContent({required this.title, required this.image});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'Book Your Favourite restaurants or hotels',
    image: 'splash1.png',
  ),
  OnboardingContent(
    title: 'Quick view menu of wide range of restaurants',
    image: 'splash2.png',
  ),
  OnboardingContent(
    title: 'Find your Favourite Hotels in different city',
    image: 'splash3.png',
  ),
];
