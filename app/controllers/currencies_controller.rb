class CurrenciesController < ApplicationController

  def first_currency
    require "open-uri"
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    render({:template => "currency_templates/step_one.html.erb"})
    
  end

  def second_currency
    require "open-uri"
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    @main_symbol = params.fetch("main_symbol")
    render({:template => "currency_templates/step_two.html.erb"})
    
  end

  def conversion
    require "open-uri"
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    @main_symbol = params.fetch("main_symbol")
    @sec_symbol = params.fetch("second_symbol")
    @raw_data_rates = open("https://api.exchangerate.host/convert?from=:main_symbol&to=:sec_symbol").read
    @parsed_data_rates = JSON.parse(@raw_data_rates)
    @info_hash = @parsed_data_rates.fetch("info")
    @rate = @info_hash.fetch("rate")
    render({:template => "currency_templates/conversion.html.erb"})
    
  end


end