10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Lorem ipsum dolor sit amet, in et platea, nunc erat."
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

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio Title #{portfolio_item} ",
    subtitle: "This is a subtitle",
    body: "Lorem ipsum dolor sit amet, in et platea, nunc erat.",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
    )
end
puts "Created 9 portolio entries..."