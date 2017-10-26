import plotly.graph_objs as go
from plotting.utils import set_margins, annotation, div_output, overview_label
from plotting.plots import scatter
from datetime import datetime
from plotting.colors import random_color, BiggestTrackerColors, CliqzColors


def reach(google, facebook, dates):
    """
    Main Page Plot showing the reach of companies that track the most
    Args:
        google:   (list) - values for google
        facebook: (list) - values for facebook
        dates:    (list) - dates

    Returns: Area Plot as div output

    """
    trace_high = scatter(x=dates, y=google, name="Google", color="#3cba54")
    trace_low = scatter(x=dates, y=facebook, name="Facebook", color="#3b5998")
    dangerous = scatter(x=dates, y=[20] * 11, name="Dangerous", color="#FF3232", fill=False, line_style="dot")
    data = [trace_high, trace_low, dangerous]

    layout = go.Layout(
        dict(
            xaxis=dict(
                range=['2017-01-01', '2017-01-11']
            ),
            yaxis=dict(
                title="Percentage of sites where company can track",
                titlefont=dict(
                    size=12,
                    color="#666666"
                )),
            margin=set_margins(r=90),
            legend=dict(
                x=0,
                y=50,
                orientation="h"
            ),
            annotations=[
                annotation(text="Facebook", x=dates[-1], y=facebook[-1], background_color="#3b5998"),
                annotation(text="Google", x=dates[-1], y=google[-1], background_color="#3cba54"),
                annotation(text="Dangerous", x=dates[-1], y=20, background_color="#FF3232")
            ]
        )
    )
    fig = dict(data=data, layout=layout)
    return div_output(fig)


def overview_bars(companies):
    x = []
    y = []
    colors = [CliqzColors["purple"]]*2 + [CliqzColors["inactive_gray"]]*8
    for c in companies:
        name = c["name"]
        x.append(round(c["history"][-1]["reach"], 3))
        y.append(name)
    data = [
        go.Bar(
            x=x[::-1],
            y=y[::-1],
            marker={
                "color": colors[::-1]
            },
            orientation='h'
        )
    ]
    layout = go.Layout(
        dict(
            margin=set_margins(t=30, l=150),
            showlegend=False,
            xaxis=dict(
                color=CliqzColors["gray_blue"],
                tickformat = "%",
                anchor="free",
                position=0
            )
        )
    )
    fig = dict(data=data, layout=layout)
    return div_output(fig)


def overview_reach(companies):
    data = []
    annotations = []
    for c in companies:
        color = random_color()
        ts = [datetime.strptime(t["ts"], "%Y-%m") for t in c["history"]]
        name = c["overview"]["id"].capitalize()
        y = [t['reach']*100 for t in c["history"]]
        data.append(
            scatter(
                x=ts,
                y=y,
                fill=False,
                name=name,
                color=color
            )
        )
        annotations.append(
            overview_label(text=name, x=ts[-1], y=y[-1], color=color)
        )

    layout = go.Layout(
        dict(
            yaxis=dict(
                title="Percentage of sites where company can track",
                titlefont=dict(
                    size=12,
                    color="#666666"
                )),
            margin=set_margins(r=90),
            legend=dict(
                x=0,
                y=50,
                orientation="h"
            ),
            # annotations=annotations
        )
    )
    fig = dict(data=data, layout=layout)
    return div_output(fig)
