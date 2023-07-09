class MovieModel {
  final String title;
  final String posterPath;
  final String releaseDate;
  final int voteCount;
  final String overview;
  final int movieId;

  MovieModel({
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteCount,
    required this.overview,
    required this.movieId,
  });
}
