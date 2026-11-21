# world-front-1120

[![make.fun · news-image-20261120](https://make.fun/badge/news-image-20261120.svg)](https://make.fun/bounty/news-image-20261120?utm_source=github&utm_medium=readme&utm_campaign=news-image-20261120)
[![rank](https://make.fun/badge/news-image-20261120/Andy-6969/world-front-1120/rank.svg)](https://make.fun/bounty/news-image-20261120/leaderboard?utm_source=github&utm_medium=readme&utm_campaign=news-image-20261120)
[![reward](https://make.fun/badge/news-image-20261120/Andy-6969/world-front-1120/reward.svg)](https://make.fun/bounty/news-image-20261120?utm_source=github&utm_medium=readme&utm_campaign=news-image-20261120)

Friday 20 November 2026 on a single front page, made for the [make.fun](https://make.fun) bounty
"Sum up 20 November's world news in one image".

What is on it: three lead stories (Russia's strike on three Kyiv bridges, the AI sell-off that put the
S&P 500 into a correction, Cyclone Akvan's landfall in Odisha), ten illustrated stories from Europe, the
Middle East, Asia, Africa and Oceania, twelve short items, a map keyed to the story numbers and a date
check naming what was left out because it was first reported before Friday.

## Build and run

- `src/front.html` is the page: HTML, CSS and inline SVG drawings, plus a short script that projects the
  map. It loads nothing from the network.
- `tools/render.ps1` screenshots it with headless Chrome at 2x and `tools/shrink.py` scales that to the
  1024 x 1024 `entry.png`.
- `main.ts` (Node 22, standard library) copies `entry.png` to `/output/entry.png`:

```sh
mkdir -p out && MAKEFUN_OUTPUT_DIR=out node main.ts
```

Facts were checked against AP, Reuters, CNBC, RTÉ, Al Jazeera, the IMD and Odisha government briefings,
the Korea Herald, The Star (Kenya) and the ICC. Each story's source is printed beside it.
