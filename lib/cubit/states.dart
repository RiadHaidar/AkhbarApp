
abstract class NewsStates{}


class NewsInitializeNewsState extends NewsStates{}

class NewsLoadingNewsState extends NewsStates{}

class NewsChangeScreenIndex extends NewsStates{}



class NewsLoadingBusinessState extends NewsStates{}

class NewsGetBusinessState extends NewsStates{}

class NewsErrorBusinessState extends NewsStates{
  final String error;
  NewsErrorBusinessState(this.error);
}


class NewsLoadingSportssState extends NewsStates{}

class NewsGetSportsState extends NewsStates{}

class NewsErrorSportsState extends NewsStates{
  final String error;
  NewsErrorSportsState(this.error);
}



class NewsLoadingSciencesState extends NewsStates{}

class NewsGetScienceState extends NewsStates{}

class NewsErrorScienceState extends NewsStates{
  final String error;
  NewsErrorScienceState(this.error);
}





class NewsAppChangeTheme extends NewsStates{}



class NewsLoadingSearchState extends NewsStates{}

class NewsSearchState extends NewsStates{}

class NewsErrorSearcheState extends NewsStates{
  final String error;
  NewsErrorSearcheState(this.error);
}
