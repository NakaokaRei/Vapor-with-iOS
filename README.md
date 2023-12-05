# Vapor-with-iOS

## What is this repo?
This repo is a sample project for Vapor with iOS.

## How to use?
1. Clone this repo.
2. Build `Vapor-with-iOS` targe.
3. Run following command

```
curl -X POST -H "Content-Type: application/json" \
     -d '{"image": "'$(cat image.txt)'"}' \
     http://localhost:8080/recognize-text
```