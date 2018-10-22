require 'rubygems'
require 'open-uri'
require 'watir'

def scrape_for(company_name)

  # Log into Dealroom.co
  signin_email = 'xxxxx'
  signin_password = 'xxxxx'

  browser = Watir::Browser.new
  browser.goto('https://app.dealroom.co/login')
  form = browser.form(css: '.login-form').wait_until_present

  expected_number = 2
  browser.wait_until do
    browser.inputs(css: '.form-control').length >= expected_number
  end

  browser.inputs(css: '.form-control').first.send_keys(signin_email)
  browser.inputs(css: '.form-control').first.send_keys(signin_password)
  form.submit

  # Scrape company information
  company_info = {}
  browser.goto("https://app.dealroom.co/companies/#{company_name}")

  company_info[:name] = browser.h1(css: '.name').text
  company_info[:description] = browser.div(css: '.tagline').text
  company_info[:website] = browser.link(css: '.company-external-info-url').href
  company_info[:address] = browser.div(css: '.company-address').text

  info = []
  browser.div(css: '.company-info').div(css: '.card-content').divs(css: '.field').each do |field|
    info << field.div(css: '.description').text
  end

  company_info[:launch] = info[0]
  company_info[:employees] = info[1]
  company_info[:stage] = info[2]
  company_info[:ownership] = info[3]
  company_info[:valuation] = info[4]

  return company_info
end

# Company name
# Description
# Website
# City hub
# Creation date
# Billing address: street, postal, city, state, country

# ? Difference between Origin contact, Idinvest Contact 1, Idinvest Contact 2, Primary Contact

# analysdte Idinvest

# workflow
# mockup
# devis


# New company:
# AuM/AuA
# Rating
# Parent company
# Regulated
# Regulator name
# New comment
# Last comments
# Country ecosystem

# Quick create:
# Origin details
# Idinvest Contact 1
# Company rating
# Domain T0
# Domain T1
# Origin
# Category II
# Idinvest Contact 2
# Contact 1
# Contact 2
# Oppy section
