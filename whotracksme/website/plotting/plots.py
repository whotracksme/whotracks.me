import plotly.graph_objs as go
import squarify

from whotracksme.website.plotting.utils import CliqzFonts, div_output, set_margins, annotation, set_line_style, set_category_colors
from whotracksme.website.plotting.colors import CliqzColors, TrackerColors
from whotracksme.website.plotting.colors import palette


def profile_doughnut(values, labels, name, color_palette=False):
    center_text = str(name)

    trace = go.Pie(
        values=values,
        labels=labels,
        hoverinfo="label",
        hole=0.65,
        textinfo="none",
        marker=dict(
            colors=set_category_colors(labels),
            line=dict(
                color=CliqzColors["white"],
                width=0
            )
        )
    )
    data = [trace]
    layout = dict(
        showlegend=False,
        paper_bgcolor=CliqzColors["transparent"],
        plot_bgcolor=CliqzColors["transparent"],
        autosize=True,
        margin=set_margins(l=0, r=0, b=0, t=0, pad=10),

        # Center Text
        annotations=[
            annotation(
                text=center_text.upper(),
                x=0.5,
                y=0.5,
                background_color=CliqzColors["transparent"],
                shift_x=0,
                text_size=30,
                color="#333"
            )
        ]
    )
    fig = dict(data=data, layout=layout)

    return div_output(fig)


def doughnut_chart(values, labels, name, color_palette=False):
    """
    Doughnut pie chart with text in the middle.

    Args:
        values: (list) - values for the pie chart
        labels: (list) - corresponding to the values
        name:   (str)  - text that goes in the middle of the chart

    Returns: Doughnut pie chart wrapped in a div

    """
    trace = go.Pie(
        values=values,
        labels=labels,
        name=str(name),
        hoverinfo="label+percent",
        hole=0.65,
        pull=0.07,
        sort=not(color_palette),
        textinfo="label",
        textfont=dict(
            family=CliqzFonts.regular,
            color=CliqzColors["white"]
        ),
        marker=dict(
            colors=palette(CliqzColors["blue"], CliqzColors["purple"], len(labels)) if color_palette else [CliqzColors["blue"], CliqzColors["purple"]],
            line=dict(
                color=CliqzColors["white"],
                width=2
            )
        )
    )
    data = [trace]
    layout = dict(
        showlegend=False,
        paper_bgcolor=CliqzColors["transparent"],
        plot_bgcolor=CliqzColors["transparent"],
        autosize=True,
        margin=set_margins(),
        annotations=[
            annotation(
                text=str(name).upper(),
                x=0.5,
                y=0.5,
                background_color=CliqzColors["transparent"],
                shift_x=0,
                text_size=14
            )
        ]
    )
    fig = dict(data=data, layout=layout)

    return div_output(fig)


def hbar(label, color=CliqzColors["blue"], **kwargs):
    x, y = [], []
    for k, v in kwargs.items():
        x.append(k)
        y.append(v)

    return go.Bar(
        y=x,
        x=y,
        width=[0.2, 0.2, 0.2],
        orientation='h',
        name=label,
        marker=dict(
            color=color,
            line=dict(
                color=color,
                width=4)
        )
    )


def scatter(x, y, name, color, fill=True, line_style="solid"):
    return go.Scatter(
        x=x,
        y=y,
        name=name,
        line=set_line_style(
            color=color,
            width=4,
            line_style=line_style
        ),
        opacity=0.2 if fill else 1,
        fill='tozeroy' if fill else False,
        textfont=dict(
            family=CliqzFonts.regular
        ),
        mode='lines'
    )


def line(x, y,  color, line_style="solid", mode='lines'):
    marker = dict(
        size=10
    )
    return go.Scatter(
        x=x,
        y=y,
        text=["{0:.2f}% on {1}".format(y[i], x[i].strftime("%b %y")) for i in range(len(x))],
        hoverinfo='text',
        line=set_line_style(
            color=color,
            width=3,
            line_style=line_style
        ),
        opacity=1,
        mode=mode,
        marker=marker
    )


def treemap():
    x = 0.
    y = 0.
    width = 100.
    height = 100.

    values = [500, 433, 78, 25, 25, 7]

    normed = squarify.normalize_sizes(values, width, height)
    rects = squarify.squarify(normed, x, y, width, height)

    # Choose colors from http://colorbrewer2.org/ under "Export"
    color_brewer = ['rgb(166,206,227)','rgb(31,120,180)','rgb(178,223,138)',
                    'rgb(51,160,44)','rgb(251,154,153)','rgb(227,26,28)']
    shapes = []
    annotations = []
    counter = 0

    for r in rects:
        shapes.append( 
            dict(
                type = 'rect', 
                x0 = r['x'], 
                y0 = r['y'], 
                x1 = r['x']+r['dx'], 
                y1 = r['y']+r['dy'],
                line = dict( width = 2 ),
                fillcolor = color_brewer[counter]
            ) 
        )
        annotations.append(
            dict(
                x = r['x']+(r['dx']/2),
                y = r['y']+(r['dy']/2),
                text = values[counter],
                showarrow = False
            )
        )
        counter = counter + 1
        if counter >= len(color_brewer):
            counter = 0

    # For hover text
    trace0 = go.Scatter(
        x = [ r['x']+(r['dx']/2) for r in rects ], 
        y = [ r['y']+(r['dy']/2) for r in rects ],
        text = [ str(v) for v in values ], 
        mode = 'text',
    )
            
    layout = dict(
        height=700, 
        width=700,
        xaxis=dict(showgrid=False, zeroline=False),
        yaxis=dict(showgrid=False, zeroline=False),
        shapes=shapes,
        annotations=annotations,
        hovermode='closest'
    )

    # With hovertext
    figure = dict(data=[trace0], layout=layout)

    # Without hovertext
    # figure = dict(data=[Scatter()], layout=layout)

    return div_output(figure)
