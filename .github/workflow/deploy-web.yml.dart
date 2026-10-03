name: Deploy web to Netlify

on:
push:
branches: [main]
workflow_dispatch:

jobs:
deploy:
runs-on: ubuntu-latest
steps:
- uses: actions/checkout@v4

- uses: subosito/flutter-action@v2
with:
channel: stable
cache: true

- run: flutter pub get

- run: flutter build web --release --wasm

- name: Deploy to Netlify
run: npx --yes netlify-cli deploy --prod --dir=build/web
env:
NETLIFY_AUTH_TOKEN: ${{ nfp_jED8VYJa2ToTSWyuyfi8A6iY96t9EXCAa8d8 }}
NETLIFY_SITE_ID: ${{ f326587b-fd75-492a-80f4-ac1065d1acaf }}