---
title: "How I make posters for scientific events"
date: 2026-08-25
draft: false
tags:
- Design
- Computer programming
---

A poster for an event has a difficult job. It must attract attention, explain what the event is, and give the practical information in a few seconds. At the same time, it may need to contain portraits, talk titles, logos, a timetable, and a QR code.

I learned most of my workflow while preparing posters for **PRAPI** (Ph.D. Research Activity Presentation) and **FNIP** (Focus on Optical Neuro-Imaging and Photonics). I make the final composition in [Inkscape](https://inkscape.org/), but I also use small scripts when a background or a repeated layout can be generated more easily than it can be drawn.

This post collects the ideas that were most useful to me.

## Start with the reading order

Before choosing colours, I decide what people should read first. My usual order is:

1. Name of the event.
2. Date and place.
3. Main speakers or programme.
4. Registration link and QR code.
5. Organizers, sponsors, and extra details.

This order also sets the size of the text. The title should be readable from far away. The date and place should be visible without searching. Longer descriptions can be smaller because they are for readers who have already stopped in front of the poster.

The PRAPI poster below follows this rule. The event name and date are large, the speakers form one clear vertical sequence, and the detailed explanation stays at the bottom.

![PRAPI poster with a Talbot diffraction background](/images/poster-design/prapi-talbot-placeholder.png)

*A PRAPI poster for October 2025. The scientific background gives the poster its identity, while dark shades keep the text readable. Speaker portraits, names, and titles are replaced with neutral placeholders in these web copies for privacy.*

## Build the poster in layers

I organize my Inkscape files like a small software project. A useful four-layer structure is:

1. **Bottom layers:** background colour, photograph, or generated image.
2. **Graphics:** portraits, logos, QR codes, lines, and frames.
3. **Shading:** translucent shapes that separate the text from the background.
4. **Text:** title, date, programme, and contacts.

The order matters. It lets me change a photograph without moving the text, hide all portraits while checking alignment, or edit the shades without accidentally selecting a logo. I also give important groups names such as `header`, `speakers`, `program`, `register`, and `footer`.

The PRAPI files use this structure, with groups for the speakers, programme, date, and main title. The FNIP files use the same idea, with separate groups for the header, speaker cards, topics, registration area, and sponsors.

This may sound like extra work, but it saves time as soon as the second poster is needed. Instead of starting again, I duplicate the file and replace only the event-specific content.

## Use shades, not boxes everywhere

A detailed image behind white text usually creates poor contrast. A simple solution is to cover the whole background with one opaque rectangle, but this also removes the character of the image.

I prefer to add a few dark shapes in the shading layer. They can be rectangles, broad curves, or irregular forms that follow the composition. I normally:

- use a dark colour already present in the poster;
- reduce its opacity until the background is still visible;
- overlap two or three shades to create depth;
- keep the strongest shade behind small text;
- use a soft gradient when a hard edge is distracting.

In Inkscape, the `Difference`, `Multiply`, and normal blend modes can all be useful, but normal transparency is often enough. The important test is simple: zoom out until the poster is about the size of a postcard. If the title, date, and sections are still clear, the contrast is probably working.

The FNIP webinar poster uses large, quiet blue shapes behind the programme. They add some movement, but do not compete with the information.

![FNIP webinar poster with a modular three-speaker layout](/images/poster-design/fnip-webinar.png)

*An FNIP webinar poster. The portraits, schedule, registration area, and sponsor row are separate modules that can be replaced for the next event.*

## Generate a scientific background

For PRAPI I wanted the visual background to come from physics rather than from a generic stock image. One example is a **Talbot carpet**: the near-field diffraction pattern produced by a periodic grating.

Let a grating of period $d$ have complex transmission $t(x)$. We write it as a Fourier series,

$$
t(x)=\sum_{m=-\infty}^{\infty} c_m\exp\left(i\frac{2\pi m}{d}x\right).
$$

In the paraxial approximation, each Fourier component acquires a different phase while it propagates. The field at distance $z$ is

$$
U(x,z)=\sum_m c_m\exp\left(i\frac{2\pi m}{d}x\right)
\exp\left(-i\pi\lambda z\frac{m^2}{d^2}\right),
$$

and the image used for the background is the normalized intensity

$$
I(x,z)=|U(x,z)|^2.
$$

The natural repetition length is the Talbot distance $z_T=2d^2/\lambda$. The following short Python script creates a version of this pattern for a binary grating:

```python
import numpy as np
import matplotlib.pyplot as plt

period = 1.0
wavelength = 0.08
duty_cycle = 0.18
orders = np.arange(-45, 46)

x = np.linspace(-10 * period, 10 * period, 1400)
z_talbot = 2 * period**2 / wavelength
z = np.linspace(0, 4 * z_talbot, 900)

# Fourier coefficients of a centred rectangular opening.
coefficients = duty_cycle * np.sinc(orders * duty_cycle)

field = np.zeros((z.size, x.size), dtype=complex)
for order, coefficient in zip(orders, coefficients):
    transverse_phase = np.exp(2j * np.pi * order * x / period)
    propagation_phase = np.exp(
        -1j * np.pi * wavelength * z * order**2 / period**2
    )
    field += coefficient * propagation_phase[:, None] * transverse_phase[None, :]

intensity = np.abs(field) ** 2
intensity /= intensity.max()

plt.figure(figsize=(12, 7))
plt.imshow(
    intensity,
    extent=[x.min(), x.max(), 0, 4],
    origin="lower",
    aspect="auto",
    cmap="seismic",
)
plt.xlabel("x / d")
plt.ylabel("z / z_T")
plt.tight_layout()
plt.savefig("talbot-background.png", dpi=300)
```

After generating the image, I import it into the bottom layer in Inkscape. I crop away axes and labels, scale it to cover the page, and place dark blue shades above it. A coral accent then separates names and the main title from the blue background.

The same method works with other data: a microscopy image, a simulated field, a spectrum, or a map. The image does not need to explain the whole event. It only needs to be relevant and visually strong.

## Let the backgrounds be a little strange

Not every PRAPI background was designed to explain a specific talk. I also used the series as a place to try unusual images: numerical plots, contour lines, smooth 3D forms, and illustrations that look like stained glass.

The repeated layout made this experimentation safe. Even when the image changed completely, the large PRAPI title, white department header, dark information area, and simple type hierarchy kept the posters recognizable as one family.

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

These versions also show why the shading layer is useful. A background can be almost random and still work if the important information sits on a calm, high-contrast surface. I normally sample a dark colour from the image itself, place it above the background, and adjust the opacity while viewing the whole page. This connects the information panel to the image instead of making it look like a separate black box.

## Make repeated layouts modular

FNIP needed more than one format: webinar posters, an A1 programme, screens, and a roll-up. Rebuilding every format by hand would make small corrections slow and inconsistent.

For the larger FNIP Day material, I separated the content from the design:

- a **TOML file** stores the title, date, programme, speakers, photographs, and logos;
- **SVG/Jinja templates** store the visual structure made in Inkscape;
- a **Python renderer** inserts the data and embeds the images in the final SVG.

This is similar to making a web page from a template. The designer can still adjust the SVG in Inkscape, while names and schedules stay in one data file.

One annoying problem is arranging a changing number of sponsor logos. For $N$ logos and $c$ columns, the number of rows is

$$
r=\left\lceil\frac{N}{c}\right\rceil.
$$

If the available box has width $W$, height $H$, and padding $p$, each cell has size

$$
w_c=\frac{W-p(c-1)}{c}, \qquad
h_c=\frac{H-p(r-1)}{r}.
$$

The script tries possible column counts and selects the grid that maximizes $\min(w_c,h_c)$. In other words, it chooses the arrangement that gives the logos the largest balanced cells.

```python
import math

def choose_grid(total, width, height, padding):
    best = None
    for columns in range(1, total + 1):
        rows = math.ceil(total / columns)
        cell_w = (width - padding * (columns - 1)) / columns
        cell_h = (height - padding * (rows - 1)) / rows
        score = min(cell_w, cell_h)

        if best is None or score > best[0]:
            best = (score, columns, rows)

    return best[1], best[2]
```

If the final row is not full, I centre it instead of aligning it to one side. This small detail makes a sponsor area look intentional rather than unfinished.

![FNIP Day 2026 A1 event poster](/images/poster-design/fnip-day-a1.png)

*The FNIP Day A1 poster combines a full programme, speaker portraits, topic illustrations, two QR codes, and many institutional logos. A shared data file and SVG templates made it easier to produce other formats with the same identity.*

## A practical checklist

Before exporting, I check the following:

- Can I understand the event in five seconds?
- Are the title, date, and place readable from a distance?
- Is the text contrast strong enough everywhere?
- Are portraits cropped in the same style?
- Are logos visually balanced, not merely the same width?
- Does every QR code work from the exported PDF?
- Are images embedded rather than linked to files on my computer?
- Is the document set to the real print size?
- Have I exported both a print PDF and a smaller image for the web?

The main lesson is that a good poster is not one large drawing. It is a set of modules with a clear order. Layers make those modules easy to edit, shades make them readable, and small scripts remove repetitive work. Once the structure is solid, each new event becomes a variation of a reliable system rather than a new design emergency.
