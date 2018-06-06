3.times do |topic|
    Topic.create!(
        title: "Topic #{topic}"
        )
end
puts "3 topics created"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Lorem ipsum dolor sit amet, in et platea, nunc erat.",
    topic_id: Topic.last.id
    )
end
puts "Created 10 blog entries...."

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
    )
end
puts "Created 5 skill entries..."

5.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio Title #{portfolio_item} ",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet, in et platea, nunc erat.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
    )
end
puts "Created 5 Ruby portolio entries..."

5.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio Title #{portfolio_item} ",
    subtitle: "Angular",
    body: "Lorem ipsum dolor sit amet, in et platea, nunc erat.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
    )
end
puts "Created 5 Angular portolio entries..."

3.times do |technology|
    Portfolio.last.technologies.create!(
        name: "Technology #{technology}",
        )
end
puts "created 3 technology items for the portfolio item"