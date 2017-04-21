When %r{I go to "https://www.chromium.org/Home"} do
  visit "https://www.chromium.org/Home"
end

Then %r{I should see "Chromium"} do
  raise "Can't see anything in page.text" unless page.text =~ /Chromium/
end
