LDR.register_hook("after_printfeed",(feed)->
  element = document.getElementById('channel_info')
  element.innerHTML += '<a href="http://b.hatena.ne.jp/entrylist?url='+ feed.channel.link + '"><img style="vertical-align:middle" src="http://b.hatena.ne.jp/bc/' + feed.channel.link + '"></a>'
)

description = "\u306B\u30D6\u30C3\u30AF\u30DE\u30FC\u30AF\u3055\u308C\u3066\u3044\u308B\u4EF6\u6570\u3067\u3059"

entry_widgets.add('hb_counter',(feed, item)->
  link = item.link.replace(/#/g,'%23')
  [
        '<a href="http://b.hatena.ne.jp/entry/', link, '">',
        '<img src="http://d.hatena.ne.jp/images/b_entry.gif" border=0 height=16><img style="border:0;margin-left:3px;" ',
        'src="http://b.hatena.ne.jp/entry/image/',link, '"></a>'
      ].join('')
, '\u306F\u3066\u306A\u30D6\u30C3\u30AF\u30DE\u30FC\u30AF'+description)

LDR.register_hook("after_printfeed", (feed)->
  feed_id = feed.subscribe_id

  for item in feed.items
    $.get("/oreoreapi/hatebu_comment", link: item.link, id: item.id).success((data)->
      $("#item_body_#{data.id} .body").append(
        data.html
      )
    )
)
