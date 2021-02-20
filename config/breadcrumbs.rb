crumb :root do
  link "HOME", root_path
end

crumb :post do
  link "トピック内", root_path
  parent :root
end

crumb :new do
  link "新規作成", root_path
end

crumb :edit do
  link "コメント編集", root_path
  parent :post
end
