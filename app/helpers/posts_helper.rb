module PostsHelper
  HASHTAG_REGEX = /(?<=\s|　|^)#.+?(?=(　|\s|$))/.freeze

  def link_to_hashtag(caption)
    caption.gsub(HASHTAG_REGEX) { |hashtag| link_to(hashtag, search_posts_path(q: hashtag)) }
  end

  def html_with_link_to_hashtag(caption)
    # 下の処理でaタグのhref属性を表示できるようにするので、ハッシュタグのaタグ以外が有効にならないように、エスケープしておく。
    html_escaped_caption = h(caption)
    caption_with_hashtags = link_to_hashtag(html_escaped_caption)
    # aタグのhref属性以外はサニタイズします。
    # aタグのhref属性はエスケープされずに表示されるようになります。
    sanitize caption_with_hashtags, tags: ['a'], attributes: ['href']
  end

end
