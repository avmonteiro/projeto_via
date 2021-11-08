Before do
  Capybara.reset_sessions!
  Capybara.current_session.driver.browser.manage.delete_all_cookies
end

After do |scenario|
  timer_path = Time.now.strftime('%Y%m%d')
  file_path = "screenshots/test_#{scenario.status}/run_#{timer_path}"
  FileUtils.mkdir_p(file_path) unless File.exist?(file_path)

  scenario_name = scenario.name.remover_acentos.gsub(/\s+/, '_').gsub(/\W/, '').downcase
  file_name = "#{Time.now.strftime('%H%M%S')}_#{scenario_name}"

  path_screenshot = "#{file_path}/#{file_name}.png"
  page.save_screenshot(path_screenshot)
  attach(File.read(path_screenshot), 'image/png')
end

at_exit { Capybara.current_session.driver.quit }
