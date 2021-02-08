Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get("/forex", {:controller => "currencies", :action=> "first_currency"})
get("/forex/:main_symbol", {:controller => "currencies", :action=> "second_currency"})
get("/forex/:main_symbol/:second_symbol", {:controller => "currencies", :action=> "conversion"})

end

