# Vapor-with-iOS

## What is this repo?
This repo is a sample project for Vapor with iOS.

## How to use?
1. Clone this repo.
2. Build `Vapor-with-iOS` target.
3. Run following command

```
curl -X POST -H "Content-Type: application/json" \
     -d '{"image": "'$(cat image.txt)'"}' \
     http://localhost:8080/recognize-text
```

if you woulid like to know more detail, please read following article.
https://qiita.com/NakaokaRei/items/55a83a329a3a9605daf2
