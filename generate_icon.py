import math

def generate_svg():
    size = 1024
    cx = size / 2
    cy = size / 2
    r = 480
    
    scale = r / 70.0
    
    svg = f'<svg width="{size}" height="{size}" viewBox="0 0 {size} {size}" xmlns="http://www.w3.org/2000/svg">\n'
    svg += '<defs>\n'
    svg += '  <radialGradient id="waxGrad" cx="50%" cy="50%" r="50%">\n'
    svg += '    <stop offset="0%" stop-color="#8B1A1A" />\n'
    svg += '    <stop offset="100%" stop-color="#4A0E0E" />\n'
    svg += '  </radialGradient>\n'
    svg += '  <radialGradient id="discGrad" cx="50%" cy="50%" r="50%">\n'
    svg += '    <stop offset="0%" stop-color="#E5C77A" />\n'
    svg += '    <stop offset="100%" stop-color="#8B7430" />\n'
    svg += '  </radialGradient>\n'
    svg += '</defs>\n'
    
    # Outer wax
    svg += f'  <circle cx="{cx}" cy="{cy}" r="{r}" fill="url(#waxGrad)" />\n'
    
    # Inner rim
    rim_r = r - 8 * scale
    svg += f'  <circle cx="{cx}" cy="{cy}" r="{rim_r}" fill="none" stroke="#C9A961" stroke-width="{1.5 * scale}" />\n'
    
    # Ticks
    for i in range(60):
        angle = (i / 60) * 2 * math.pi
        inner_mult = 0.92 if i % 5 == 0 else 0.95
        inner_r = (r - 12 * scale) * inner_mult
        outer_r = r - 6 * scale
        
        p1x = cx + math.cos(angle) * inner_r
        p1y = cy + math.sin(angle) * inner_r
        p2x = cx + math.cos(angle) * outer_r
        p2y = cy + math.sin(angle) * outer_r
        
        svg += f'  <line x1="{p1x}" y1="{p1y}" x2="{p2x}" y2="{p2y}" stroke="#C9A961" stroke-width="{1.0 * scale}" stroke-linecap="round" />\n'
        
    # Progress arc (draw full circle for logo)
    arc_r = r - 14 * scale
    svg += f'  <circle cx="{cx}" cy="{cy}" r="{arc_r}" fill="none" stroke="#E5C77A" stroke-width="{4 * scale}" />\n'
    
    # Disc
    disc_r = r - 20 * scale
    svg += f'  <circle cx="{cx}" cy="{cy}" r="{disc_r}" fill="url(#discGrad)" />\n'
    
    # Center text
    font_size = r * 0.5
    svg += f'  <text x="{cx}" y="{cy}" font-family="sans-serif" font-size="{font_size}" font-weight="900" fill="#0A0A0F" text-anchor="middle" dominant-baseline="central">✦</text>\n'
    
    svg += '</svg>'
    
    with open('/Users/sagarm/Music/Entrepreneur/entrepreneur_mindset/assets/icon.svg', 'w') as f:
        f.write(svg)

if __name__ == '__main__':
    generate_svg()
