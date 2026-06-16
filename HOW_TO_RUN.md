# How to run the Lusion mirror

This is a saved copy of **lusion.co**, an interactive **Three.js / WebGL** site.
It must be opened through a small web server — **not** by double-clicking the
`.html` file — because the site uses JavaScript modules and `fetch()`, which
browsers block on `file://`.

## Easiest way (macOS)

1. Double-click **`serve.command`** in this folder.
2. Your browser opens the site automatically.
3. Keep the little terminal window open while browsing. Press `Ctrl+C` to stop.

## Manual way (any OS)

The site is a single-page app and must be served from **its own folder** as the
web root. From inside this folder, run:

```bash
cd lusion.co
python3 -m http.server 8000
```

Then open: <http://localhost:8000/>

## What was fixed

- The mirror did **not** include the heavy 3D assets (textures, models, audio,
  video, sprites). The site builds those URLs from a `CDN_PATH` variable that
  was only filled in when the page was actually hosted on `lusion.co`.
- Fix: `lusion.co/_astro/hoisted.CJiXW_YI.js` was patched so `CDN_PATH` always
  points at Lusion's live asset CDN (`https://lusion.dev`), which serves the
  files with permissive CORS. All animations and assets are preserved exactly —
  nothing visual was changed.
- A backup of the original JS is kept at
  `lusion.co/_astro/hoisted.CJiXW_YI.js.orig`.

## Important note

Because the large 3D assets are streamed from Lusion's live CDN, **an internet
connection is required** for the full experience to load. The HTML, CSS, fonts,
and code run locally; only the 3D media comes from the CDN.

The first load shows a black screen with a small progress bar and a counter —
that is the site's real preloader streaming the 3D assets. It can take a little
while on the first visit; this is normal.

The "Labs" link (`labs.lusion.co`) is a separate sub-site in this archive and is
not served at this root, so it will not open from inside the main site. The main
home/logo links were repointed to the local homepage and work fine.

If you need a 100% offline copy, the CDN assets under `/assets/textures/`,
`/assets/models/`, `/assets/audios/`, `/assets/sprites/`, `/assets/projects/`,
and `/assets/team/` would need to be downloaded into matching folders — ask and
this can be set up.
