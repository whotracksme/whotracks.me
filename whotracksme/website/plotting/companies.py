from datetime import datetime
import plotly.graph_objs as go

from whotracksme.website.plotting.utils import set_margins, annotation, div_output, overview_label
from whotracksme.website.plotting.plots import scatter
from whotracksme.website.plotting.colors import random_color, BiggestTrackerColors, CliqzColors


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
