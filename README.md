# homebrew-ai-jury

Homebrew tap for [ai-jury](https://github.com/berkayturanci/ai-jury) — cross-vendor multi-agent code review.

```bash
brew install berkayturanci/ai-jury/ai-jury
```

## This formula is generated, not edited here

`Formula/ai-jury.rb` is published from the [ai-jury repository](https://github.com/berkayturanci/ai-jury/blob/main/Formula/ai-jury.rb) on every release. Edit it there.

The source repo is where the checks live: the url and `sha256` are compared against what PyPI actually publishes for the tagged version, on every push. Editing the copy here by hand would pass nothing and drift silently — which is the failure that produced this tap in the first place (ai-jury#562: the command above was documented in six places while the tap did not exist and the formula's url returned 404).

## What is verified here

`brew install` downloads every `url` in the formula and checks each against the
`sha256` beside it. `verify-formula.yml` does the same thing first — after every
sync, on every push, on pull requests, and daily.

Upstream pushes this formula here directly, which makes a check at this end more
valuable rather than less: without it, nothing between that push and someone's
install looks at the result.

It also asserts this tap is serving the current ai-jury release, which is the
failure people actually notice — `brew upgrade` finding nothing new. This tap
spent a day in exactly that state after 1.15.0
([ai-jury#633](https://github.com/berkayturanci/ai-jury/issues/633)).

The daily run exists because an upstream artifact can stop resolving without
anything here changing.

For how the whole chain fits together, see
[The Homebrew release chain](https://github.com/berkayturanci/ai-jury/blob/main/docs/homebrew-release-chain.md).

## Licence

MIT, matching ai-jury.
