module ApplicationHelper
  def default_meta_tags
    {
      site: 'HoshiMe',
      title: 'HoshiMe',
      reverse: true,
      charset: 'utf-8',
      description: '購入したいモノの優先度をランキング形式で提示して無駄遣いを減らすサービス',
      keywords: '欲しいもの, ランキング, お金, 無駄, 購入',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.png') },
        { href: image_url('favicon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: [
          '@takemuu_pote',
          '@sayo_saru',
          '@wataru_pgm'
        ]
      }
    }
  end
end
