# Focus

This gem is a wrapper for SKB Kontur [Kontur.Focus](https://focus.kontur.ru/) service

## Installation

Add this line to your application's Gemfile:

    gem 'focus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install focus

## Usage
```ruby
    client = Focus::Client.new('YOUR_API_KEY')
    company = client.requisites.get(inn: '6663003127').first
    company.inn # 6663003127
    company.ogrn # 1026605606620
    company.name.full # Закрытое акционерное общество "Производственная фирма "СКБ Контур"
    company.name.to_s # Закрытое акционерное общество "Производственная фирма "СКБ Контур"
    company.name.short # ЗАО "ПФ "СКБ Контур"
```
## Contributing

1. Fork it ( http://github.com/<my-github-username>/focus/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
