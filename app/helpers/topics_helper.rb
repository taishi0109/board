module TopicsHelper
  def cnv_anchor(str)
    ret = str
    pattern = />>(\d+)/
    matched = str.match(pattern)

    if matched
      uri = "#{topic_path(@topic)}##{matched[1]}"
      a = "<a href='#{uri}'>>> #{matched[1]}</a>"
      ret = str.gsub(pattern, a)
    end

    ret
  end
end
