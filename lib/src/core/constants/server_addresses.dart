const String baseUrlAddress = 'https://fluttercamp.online/wp-json/wp/v2';
const String categoriesAddress = '/categories';
const String postsAddress = '/posts';
// request parameters
//  '?exclude=1&per_page=20&_fields=id,name,count';
//categories request parameters
const int categoriesParentParam = 1;
const int categoriesParamPerPage = 10;
const List<String> categoriesParamFields = [
  'id',
  'name',
  'count',
  'description',
  'parent',
];
// posts request parameters
const int flutterPostsCategoriesIdC = 4;
const int dartPostsCategoriesIdC = 5;
const int csPostsCategoriesIdC = 6;
const List<int> postsCategoriesIdC = [
  csPostsCategoriesIdC,
  dartPostsCategoriesIdC,
  flutterPostsCategoriesIdC
];

const int pageC = 1;
const int postsPerPageC = 10;
const List<String> postsParamFieldsC = [
  'id',
  'title',
  'excerpt',
  'content',
  'jetpack_featured_media_url',
  'date',
];
