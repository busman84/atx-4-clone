# The Ultimate James Bond Fan Site

**20 min**

Your client has an awesome James Bond website that they want to make responsive. However, they don't want to modify their existing HTML, so they've asked you to **only compose a new stylesheet**.

Notes:

- **DO NOT MODIFY THE HTML**
- Look up `max-width` (css).
- Look up `@media` (css).

Property | Example
----------|--------------
min-width | min-width: 640px
max-width | max-width: 640px
min-height | min-height: 1000px
max-height | max-height: 1000px
orientation | (orientation: portrait), (orientation: landscape) 

```HTML
<link rel="stylesheet" media="(max-width: 640px)" href="max-640px.css">
<link rel="stylesheet" media="(min-width: 640px)" href="min-640px.css">
<link rel="stylesheet" media="(orientation: portrait)" href="portrait.css">
<link rel="stylesheet" media="(orientation: landscape)" href="landscape.css">
<style>
  @media (min-width: 500px) and (max-width: 600px) {
    h1 {
      color: blue;
    }
  }
</style>
```
