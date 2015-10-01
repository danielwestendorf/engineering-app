# Engineering Application Form
This is an experiment to make applying for a job a better process. It provides a low barrier technical challenge to allow submission of the application. Upon successful submission, an email is sent to the applicant and the collector of the applications for further review. Feel free to fork and customize.

## I'm trying to apply through this thing, wtf!
You're probably noticing that the form isn't submitting correctly. OHNOES!

Well, that's on purpose. There are a few easy fixes that need to implement before you can successfully submit the form. Figure them out, and you're on your way to stardom.... kind of. Check out the source to get the full picture as to what isn't working right. Play with it locally for fun and profit!

Afraid of losing your entered text? Fear not, brave knight! If you're on a modern browser we store it in LocalStorage. Don't know what LocalStorage is? Well then, what is it you'd say you're doing here, exactly?

## Getting started locally
```bash
$ bundle install
$ puma
```

### ENV variables:
Make sure you set these variables in ```.env``` file.

`EMAIL_TO` => Who is receiving the emails?

`EMAIL_FROM` => Who should the FROM address be for notifications set to the applicant?

`RECAPTCHA_KEY` => Google Recaptcha key


### Deployment Keys
SENDGRID_USERNAME

SENDGRID_PASSWORD

REDIS_URL

MEMCACHIER_USERNAME

MEMCACHIER_PASSWORD

## Tests
`bundle exec rake test`

## License
The MIT License (MIT)

Copyright (c) 2015 Daniel Westendorf

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.