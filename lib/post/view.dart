import 'package:flutter/material.dart';
import 'package:masterclass/post/widgets/instagram_card.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Post> posts = [
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'hij',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'Beautiful vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 120,
        commentsCount: 20,
        sharesCount: 5,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'hij',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'Beautiful vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 120,
        commentsCount: 20,
        sharesCount: 5,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),

      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'hij',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'Beautiful vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 120,
        commentsCount: 20,
        sharesCount: 5,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'hij',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'Beautiful vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 120,
        commentsCount: 20,
        sharesCount: 5,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'hij',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'Beautiful vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 120,
        commentsCount: 20,
        sharesCount: 5,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
      Post(
        username: 'according_tips',
        userImageUrl: 'https://randomuser.me/api/por',
        postImageUrl:
            'https://assets.mediamodifier.com/mockups/5eb298d9344e64249900dbbc/instagram-post-mockup-maker.jpg',
        description:
            'worst vs code! fhjdkdqfhjklhjfdqhjdfqhskkhjfdqsjkhlfdkshjqkhjqfdskhjfdqskljhqfdsklhjfdkhl',
        likesCount: 130,
        commentsCount: 22,
        sharesCount: 10,
      ),
    ];

    return ListView.separated(
      separatorBuilder: (context, index) => Divider(height: 12),
      itemBuilder: (context, index) {
        final post = posts[index];
        return InstagramCard(post: post);
      },
      itemCount: posts.length,
    );
  }
}

var x = 1;
var y = 2;
