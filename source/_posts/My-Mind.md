---
title: my-mind
date: 2026-09-21 18:00:00
tags:
- pet project
thumbnailImage: thumbnail.png
---

I took two honest tests — general knowledge and front-end development — and then built a personal study program out of my own wrong answers: [my-mind](https://sacret.github.io/my-mind/)
<!-- more -->

{% image center icon.svg 200px "my-mind logo" %}

Both baseline tests are 50 questions each: one on science, languages, art and logic, the other on fundamentals, JavaScript, markup and React. Every question I got wrong turned into a lesson, which is why a lesson subtitle usually reads *"closes question #48 of the test"*. There are 73 lessons now, split into two tracks — **General development** (logic, maths, statistics, physics, chemistry, biology, anatomy, astronomy, geography, history, philosophy, religions, law, finance, music, cinema, painting, architecture, literature, linguistics and a few more) and **Profession** (JavaScript, TypeScript, CSS, React, databases, build tools, testing, web history).

A lesson is a short explanation followed by eight questions, and it counts as closed only when all eight are answered. There is a separate "I guessed" checkbox: a perfect score with guesses marked is still shown as an open topic, because guessing right is not knowing. Lessons that build on each other are locked until the previous one is fully closed.

{% image fancybox dashboard.png "The study program with progress" %}

The interesting part is what happens after a lesson. Every lesson feeds a deck of spaced-repetition cards, and the dashboard shows the real state of the deck rather than a simulation: where the cards are now, how many mature in the coming days, how often an answer fails to come back. A card forgotten three times on three different days lands in the **leeches** list — that is a signal the lesson was not understood, not that the card needs one more showing. There is also a year calendar where a darker cell means more lessons closed that day, and a test history, so the point is not the current score but how far it moved from the first attempt.

Progress lives in the browser and is never sent anywhere; it can be exported to a JSON file and imported back, or kept in `data/state.json` if you run the tiny local server. The whole thing is static HTML — the lessons, the tests, the card engine, all of it.

The mascot is a sprout growing out of a head. It felt like the right picture for the project.

[Open my-mind →](https://sacret.github.io/my-mind/)
