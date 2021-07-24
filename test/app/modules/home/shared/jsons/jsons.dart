const String wp_term = '''
  {
      "taxonomy":"category",
      "embeddable":true,
      "href":"https://www.intoxianime.com/wp-json/wp/v2/categories?post=92340"
  }
''';

const String version_history = '''
    {
        "count":1,
        "href":"https://www.intoxianime.com/wp-json/wp/v2/posts/92340/revisions"
    }
''';

const String predecessor_version = '''
    {
        "id":92342,
        "href":"https://www.intoxianime.com/wp-json/wp/v2/posts/92340/revisions/92342"
    }
''';

const String cury = '''
    {
        "name":"wp",
        "href":"https://api.w.org/{rel}",
        "templated":true
    }
''';

const String author = '''
    {
        "embeddable":true,
        "href":"https://www.intoxianime.com/wp-json/wp/v2/users/212"
    }
''';

const String about = '''
    {
        "href":"https://www.intoxianime.com/wp-json/wp/v2/types/post"
    }
''';


const String links = '''
    {
        "self":[
          {
              "href":"https://www.intoxianime.com/wp-json/wp/v2/posts/92340"
          }
        ],
        "collection":[
          {
              "href":"https://www.intoxianime.com/wp-json/wp/v2/posts"
          }
        ],
        "about":[
          {
              "href":"https://www.intoxianime.com/wp-json/wp/v2/types/post"
          }
        ],
        "author":[
          {
              "embeddable":true,
              "href":"https://www.intoxianime.com/wp-json/wp/v2/users/212"
          }
        ],
        "replies":[
          {
              "embeddable":true,
              "href":"https://www.intoxianime.com/wp-json/wp/v2/comments?post=92340"
          }
        ],
        "version-history":[
          {
              "count":1,
              "href":"https://www.intoxianime.com/wp-json/wp/v2/posts/92340/revisions"
          }
        ],
        "predecessor-version":[
          {
              "id":92342,
              "href":"https://www.intoxianime.com/wp-json/wp/v2/posts/92340/revisions/92342"
          }
        ],
        "wp:featuredmedia":[
          {
              "embeddable":true,
              "href":"https://www.intoxianime.com/wp-json/wp/v2/media/92341"
          }
        ],
        "wp:attachment":[
          {
              "href":"https://www.intoxianime.com/wp-json/wp/v2/media?parent=92340"
          }
        ],
        "wp:term":[
          {
              "taxonomy":"category",
              "embeddable":true,
              "href":"https://www.intoxianime.com/wp-json/wp/v2/categories?post=92340"
          },
          {
              "taxonomy":"post_tag",
              "embeddable":true,
              "href":"https://www.intoxianime.com/wp-json/wp/v2/tags?post=92340"
          }
        ],
        "curies":[
          {
              "name":"wp",
              "href":"https://api.w.org/{rel}",
              "templated":true
          }
        ]
    }
''';