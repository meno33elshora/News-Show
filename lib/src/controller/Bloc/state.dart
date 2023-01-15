abstract class NewsStates{}

class InitialNewsState extends NewsStates{}
class ChangePageNewsState extends NewsStates{}

class NewsBusinessGetLoading extends NewsStates {}
class NewsBusinessGetSuccess extends NewsStates {}
class NewsBusinessGetError extends NewsStates {
  final String error;
  NewsBusinessGetError(this.error);
}

class NewsScienceGetLoading extends NewsStates {}
class NewsScienceGetSuccess extends NewsStates {}
class NewsScienceGetError extends NewsStates {
  final String error;
  NewsScienceGetError(this.error);
}


class NewsTechnologyGetLoading extends NewsStates {}
class NewsTechnologyGetSuccess extends NewsStates {}
class NewsTechnologyGetError extends NewsStates {
  final String error;
  NewsTechnologyGetError(this.error);
}

class NewsHealthyGetLoading extends NewsStates {}
class NewsHealthyGetSuccess extends NewsStates {}
class NewsHealthyGetError extends NewsStates {
  final String error;
  NewsHealthyGetError(this.error);
}


class NewsSportsGetLoading extends NewsStates {}
class NewsSportsGetSuccess extends NewsStates {}
class NewsSportsGetError extends NewsStates {
  final String error;
  NewsSportsGetError(this.error);
}

class NewsSearchGetLoading extends NewsStates {}
class NewsSearchGetSuccess extends NewsStates {}
class NewsSearchGetError extends NewsStates {
  final String error;
  NewsSearchGetError(this.error);
}