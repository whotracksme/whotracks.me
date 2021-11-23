from collections import namedtuple
from plotly.offline import plot
from plotly.graph_objs.layout import Margin

from whotracksme.website.plotting.colors import (
    tracker_category_colors, wtm_colors
)


FontSet = namedtuple("FontSet", 'mono regular')
WTMFonts = FontSet(
    mono="monospace",
    regular="sans-serif"
)


def set_category_colors(tracker_labels):
    colors = []
    for l in tracker_labels:
        colors.append(tracker_category_colors[l])
    return colors


def set_margins(l=60, r=60, b=40, t=0, pad=5):
    return Margin(
        l=l,
        r=r,
        b=b,
        t=t,
        pad=pad
    )


def set_line_style(color, width=3, line_style="solid"):
    """
    Defines default styling of scatter graphs with some smoothing.
    Args:
        color: line color
        width: line width
        line_style: line style (solid, dashed, ...)

    Returns: line_style dict parameters

    """
    style = dict(
        color=color,
        width=width,
        # shape='spline',
        # smoothing=1.3,
        dash=line_style
    )
    return style


def annotation(text, x, y, background_color, shift_x=-1, text_size=12, color="white"):
    if shift_x == -1:
        shift_x = 4 * len(text) + 10
    return dict(
        x=x,
        y=y,
        xref='x',
        yref='y',
        text=text,
        font=dict(
            family=WTMFonts.regular,
            size=text_size,
            color=color
        ),
        width=len(text) * 10 if len(text) > 30 else 100,
        showarrow=True,
        ax=shift_x,
        ay=0,
        align='center',
        bordercolor=background_color,
        borderpad=5,
        borderwidth=1,
        bgcolor=background_color,
    )


def overview_label(text, x, y, text_size=12, shift_x=-1, color=wtm_colors["black"]):
    if shift_x == -1:
        shift_x = 4 * len(text) + 10

    return dict(
        x=x,
        y=y,
        xref='x',
        yref='y',
        text=text,
        font=dict(
            family=WTMFonts.regular,
            size=text_size,
            color=color
        ),
        width=len(text) * 10 if len(text) > 30 else 100,
        showarrow=False,
        ax=shift_x,
        ay=0,
        align='center',
        borderpad=5,
        borderwidth=1,
    )


def div_output(fig, display_mode_bar=False):
    return plot(
        figure_or_data=fig,
        output_type='div',
        show_link=False,
        include_plotlyjs=False,
        config={"displayModeBar": display_mode_bar}
    )
