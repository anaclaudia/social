class Website
  def self.parse(page_url)
    unless page_url.include? "http://"
      page_url.insert(0, 'http://') 
    end

    begin
      page = Nokogiri::HTML(open(page_url, :allow_redirections => :all))
      links =  page.css("body").css("a")

      links.map do |link|
        link.text
      end
    rescue => e
      error_msg = "Website not found, or URL is incomplete!"
      []
    end
  end
end
