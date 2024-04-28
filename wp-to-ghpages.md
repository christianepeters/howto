# Moving from Wordpress to Github pages

## Why?

When I moved from academica to industry I thought it may be worth
preserving a record of what I've done and keep it also for
updates on presentations and other activities. 
So I went to Wordpress and created a free site. At some point
Wordpress displayed ads on my page and I started paying for an
ad-free site.
In 2023 my bill was around 60 USD per year.
Now in April 2024, I finally found time for the move.
It took me the best part of a rainy Sunday.


## Steps

1. [Export Wordpress site and convert to markdown](#1-export)
2. [Setup Github Pages](#2-setup-github-pages)
3. [Transfer Domain Name](3-transfer-domain-name)
4. Delete Wordpress site and cancel subscription.


## 1. Export

Thanks to 
https://kevquirk.com/how-to-convert-wordpress-to-markdown
for getting me started.

Export pages from Wordpress:
Tools > Export. Select "All Content", then "Download".

1. Rename exported XML file to `export.xml`.
2. Install required packages:
```
sudo apt install nodejs
sudo apt install npm
```
3. Get conversion script
```
git clone https://github.com/lonekorean/wordpress-export-to-markdown
```
4. Run
```
node index.js --post-folders=false --prefix-date=true
```

## 2. Setup Github Pages

Enable Github pages. I did that apparently 4 years ago but just
had some pointers to my old website. For the record:
[Getting Started with Github Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site)

I used [Karl Broman](https://kbroman.org/about.html)'s
[template](https://kbroman.org/simple_site/pages/independent_site)
and excellent guidance to set up my [github page](https://christianepeters.github.io/).

Using Jekyll and Bundler locally I can test pages in my browser.
```
sudo apt install jekyll
sudo apt install bundler
```
Then run
```
bundle exec jekyll build
bundle exec jekyll serve
```
and check the pages at http://127.0.0.1:4000/.

Worst part of the move was replacing the wordpress links and also
converting the blog posts into one static site. I was too lazy to
figure out how to enable blogging. That's for another time.


## 3. Transfer Domain Name

I want to use a custom domain with my github page:
https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site

When adding my domain name to the custom page name, the DNS check fails.
https://github.com/christianepeters/christianepeters.github.io/settings/pages

TODO figure out how to move the domain from wordpress to ??

Follow https://wordpress.com/support/domains/transfer-domain-registration/


##### Updated: 28 April 2024
