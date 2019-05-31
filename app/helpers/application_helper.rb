module ApplicationHelper
    # タイトル生成
    def full_title(page_title='')
      base_title = "講義用デモサイト"
      if page_title.empty?
        base_title
      else
        page_title + " | " + base_title
      end
    end
end
