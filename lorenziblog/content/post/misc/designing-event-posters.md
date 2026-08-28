---
title: "How I make posters for scientific events"
date: 2026-08-25
draft: false
tags:
- Design
- Computer programming
---

A scientific poster must attract attention and communicate the event in seconds, despite portraits, schedules, logos, and QR codes. For **PRAPI** and **FNIP**, I compose in [Inkscape](https://inkscape.org/) and automate repetitive elements with scripts.

## Start with the reading order

I decide what people should read first:

1. Name of the event.
2. Date and place.
3. Main speakers or programme.
4. Registration link and QR code.
5. Organizers and sponsors.

Text size follows this order: the title works at a distance; details reward a closer look.

![PRAPI poster with a Talbot diffraction background](/images/poster-design/prapi-talbot-placeholder.png)

*A scientific background creates identity; dark shades preserve legibility.*

## Build the poster in layers

My Inkscape files have four layers:

1. Background.
2. Graphics and logos.
3. Translucent shading.
4. Text.

Named groups such as `header`, `speakers`, and `footer` make each file a reusable template.

![Inkscape Layers and Objects panel showing the poster layer system](/images/poster-design/inkscape-layer-system.png)

*The Inkscape layer system separates text, shading, graphics, and background elements.*

## Use shades, not boxes everywhere

A solid box can erase a background. Instead, I sample a dark colour from the image and add translucent shapes, strongest behind small text. I test contrast by reducing the poster to postcard size.

![FNIP webinar poster with a modular three-speaker layout](/images/poster-design/fnip-webinar.png)

*Portraits, schedule, registration, and sponsors are independent modules.*

## Use scientific imagery

I prefer physics to stock images. A generated **Talbot carpet**, microscopy image, field, spectrum, or map can provide a distinctive background. A stable title and information area keep the series recognizable even when the imagery changes.

<div class="poster-gallery">
  <figure>
    <img src="/images/poster-design/prapi-green-forms-placeholder.png" alt="PRAPI poster with smooth green three-dimensional forms" loading="lazy">
    <figcaption>Green 3D forms with a bright magenta accent. The dark lower gradient leaves room for two speakers.</figcaption>
  </figure>
  <figure>
    <img src="/images/poster-design/prapi-colour-field-placeholder.png" alt="PRAPI poster with a bright computational colour field" loading="lazy">
    <figcaption>A bright computational image. A heavy green-grey shade turns a very busy picture into a usable background.</figcaption>
  </figure>
  <figure>
    <img src="/images/poster-design/prapi-stained-glass-placeholder.png" alt="PRAPI poster with stained-glass-style scientific illustrations" loading="lazy">
    <figcaption>Physics illustrations treated like stained glass. Here the background is split into panels instead of being one continuous image. The background image was created by Luca Campagnoni, the other Ph.D. student representative.</figcaption>
  </figure>
  <figure>
    <img src="/images/poster-design/prapi-contours.png" alt="PRAPI poster with orange abstract contour lines" loading="lazy">
    <figcaption>Warm contour-map shapes from an earlier version of the visual identity. The same image was also adapted for a Ph.D. welcome day.</figcaption>
  </figure>
</div>

## Make repeated layouts modular

FNIP needed posters, screens, and a roll-up, so I separated content from design:

- **TOML** stores event data;
- **SVG/Jinja** defines the layout;
- **Python** renders the final SVG.

The SVG remains editable, while schedules and names stay in one source. Scripts also balance sponsor-logo grids.

![FNIP Day 2026 A1 event poster](/images/poster-design/fnip-day-a1.png)

*Shared data and templates keep multiple formats consistent.*

## A practical checklist

Before export, I check the five-second reading test, distance legibility, contrast, logo balance, QR codes, embedded images, and print size. I produce a print PDF and a smaller web image.

A good poster is a hierarchy of reusable modules. Layers keep it editable, shades keep it readable, and scripts remove repetition.
