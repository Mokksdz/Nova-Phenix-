/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./*.html",
    "./dist/*.html"
  ],
  theme: {
    extend: {
      colors: {
        'nova-blue': 'var(--nova-blue)',
        'nova-blue-soft': 'var(--nova-blue-soft)',
        'nova-gold': 'var(--nova-gold)',
        'nova-gold-soft': 'var(--nova-gold-soft)',
        'nova-light': 'var(--nova-light)',
        'nova-dark': 'var(--nova-dark)',
        'nova-ink': 'var(--nova-ink)',
        'nova-mute': 'var(--nova-mute)',
        // Palette dérivée par filiale (variations harmonisées, pas 5 couleurs aléatoires)
        'pole-home':       'var(--pole-home)',
        'pole-consulting': 'var(--pole-consulting)',
        'pole-events':     'var(--pole-events)',
        'pole-trade':      'var(--pole-trade)',
        'pole-travel':     'var(--pole-travel)',
      },
      fontFamily: {
        sans:    ['"DM Sans"', 'system-ui', '-apple-system', 'Segoe UI', 'sans-serif'],
        heading: ['"Plus Jakarta Sans"', '"DM Sans"', 'system-ui', 'sans-serif'],
        serif:   ['"Instrument Serif"', 'Georgia', 'serif'],
      },
      letterSpacing: {
        'eyebrow': '0.18em',
      },
      boxShadow: {
        'lift': '0 24px 60px -28px rgba(15, 23, 42, 0.45)',
        'lift-gold': '0 18px 40px -20px rgba(217, 119, 6, 0.55)',
      },
    }
  },
  plugins: [],
}
