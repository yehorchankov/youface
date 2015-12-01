using System;
using System.Collections.Generic;

namespace AccountsRepository
{
    public class Post
    {
        public DateTime PublicationTime { get; private set; }
        public Guid PostId { get; private set; }
        public string PostText { get; private set; }
        public int LikesCount { get { return _nickNamesLiked.Count; } }

        private readonly List<string> _nickNamesLiked;
        
        public Post(string text)
        {
            PostText = text;
            PublicationTime = DateTime.Now;
            PostId = Guid.NewGuid();
            _nickNamesLiked = new List<string>();
        }

        public void LikeOrDislikePost(string nickName)
        {
            if (!LikedBefore(nickName))
                _nickNamesLiked.Add(nickName);
            else
                _nickNamesLiked.Remove(nickName);
        }

        public bool LikedBefore(string nickName)
        {
            return _nickNamesLiked.Contains(nickName);
        }
    }
}