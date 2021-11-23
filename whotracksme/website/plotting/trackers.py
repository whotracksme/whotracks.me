from statistics import mean
import plotly.graph_objs as go
import squarify

from whotracksme.website.plotting.utils import set_margins, div_output, WTMFonts, annotation
from whotracksme.website.plotting.colors import wtm_colors
from whotracksme.website.plotting.plots import scatter, hbar, line


def tracker_cfh(https, fingerprinting, cookies):
    """
    Horizontal Bar chart plot for cookies, fingerprinting and https
    per tracker

    Args:
        https: Requests to tracker that use https
        fingerprinting: Requests to tracker that could fingerprint
        cookies: Requests to tracker that use cookies for tracking

    Returns: Horizontal bar chart wrapped in a div

    """
    trace1 = hbar(
        label="Yes",
        https=https,
        fingerprinting=fingerprinting,
        cookies=cookies
    )
    trace2 = hbar(
        label="No",
        color=wtm_colors["bright_gray"],
        https=1 - https,
        fingerprinting=1 - fingerprinting,
        cookies=1 - cookies
    )

    data = [trace1, trace2]
    layout = go.Layout(
        paper_bgcolor=wtm_colors["transparent"],
        plot_bgcolor=wtm_colors["transparent"],
        autosize=True,
        barmode="stack",
        margin=set_margins(l=120, r=100, t=20),
        height=150,
        yaxis=dict(
            showticklabels=True,
            tickfont=dict(
                family=WTMFonts.regular,
                size=13,
                color=wtm_colors["black"]
            ),
        ))
    fig = go.Figure(data=data, layout=layout)
    return div_output(fig)


def tracker_reach_ts(ts1, ts2, t):
    """
    Timeseries area plot for two time-series
    Args:
        ts1: timeseries 1
        ts2: timeseries 2
        t: x-axis (time)

    Returns: hmtl output of an interactive timeseries plot

    """
    trace0 = scatter(
        x=t,
        y=ts1,
        name="Domain Reach",
        color=wtm_colors["purple"]
    )
    trace1 = scatter(
        x=t,
        y=ts2,
        name="Page Reach",
        color=wtm_colors["blue"]
    )
    layout = go.Layout(
        margin=set_margins(t=30),
        height=300
    )

    # makes sure that whichever is smallest
    # will be on top (displaying color correctly)
    if mean(ts1) > mean(ts2):
        data = [trace0, trace1]
    else:
        data = [trace1, trace0]
    fig = dict(data=data, layout=layout)
    return div_output(fig)


def ts_trend(ts, t, percent=True):
    """
    Sparkline for plotting line
    Args:
        ts: timeseries data
        t: x-axis (time)

    Returns: hmtl output of an interactive timeseries plot
    """
    if percent:
        y = list(map(lambda x: x * 100, ts))
    else:
        y = list(ts)
    trace0 = line(
        x=t,
        y=y,
        color=wtm_colors["purple"]
    )
    trace1 = line(
        x=[t[-1]],
        y=[y[-1]],
        color=wtm_colors["purple"],
        mode='markers'
    )
    layout = go.Layout(
        dict(
            showlegend=False,
            margin=set_margins(l=10, t=30, r=10),
            height=100,
            width=153,
            hoverlabel=dict(
                bgcolor=wtm_colors["black"],
                bordercolor=wtm_colors["transparent"],
                font=dict(
                    family=WTMFonts.mono,
                    size=13,
                    color=wtm_colors["bright_gray"]
                )
            ),
            xaxis=dict(
                autorange=True,
                showgrid=False,
                zeroline=False,
                showline=False,
                hoverformat="%b %y",
                ticks='',
                showticklabels=False
            ),
            yaxis=dict(
                range=[min(y) * 0.90, max(y) * 1.05 if max(y) != y[-1] else max(y) * 1.15],
                showgrid=False,
                zeroline=False,
                showline=False,
                ticks='',
                showticklabels=False
            )
        )
    )
    data = [trace0, trace1]
    fig = dict(data=data, layout=layout)
    return div_output(fig)


# NOTE: Experimental representation of tracker prevalence
def site_tree_map(sites):
    site_values = [(site_id, site.get('overview').get('popularity')) for (site_id, site) in sites.items()]
    values = [val for (_, val) in site_values]

    x = 0
    y = 0
    width = 1200
    height = 700

    normed = squarify.normalize_sizes(values, width, height)
    rectangles = squarify.squarify(normed, x, y, width, height)

    return site_values, values, rectangles


def tracker_map(app, site_values, rectangles):
    print(app["overview"]["id"])
    site_where_app = [s.get("site") for s in app.get("sites")]
    color_brewer = [wtm_colors["red"] if t[0] in site_where_app else wtm_colors["bright_gray"] for t in site_values]

    shapes = []
    counter = 0

    for r in rectangles:
        shapes.append(
            dict(
                type='rect',
                x0=r['x'],
                y0=r['y'],
                x1=r['x'] + r['dx'],
                y1=r['y'] + r['dy'],
                line=dict(
                    color=wtm_colors["white"],
                    width=0.5
                ),
                fillcolor=color_brewer[counter]
            )
        )
        counter = counter + 1
        if counter >= len(color_brewer):
            counter = 0

    # For hover text
    trace0 = go.Scatter(
        x=[r['x'] + (r['dx'] / 2) for r in rectangles],
        y=[r['y'] + (r['dy'] / 2) for r in rectangles],
        text=[v[0] for v in site_values],
        mode='markers',
        hoverinfo="text"
    )

    layout = dict(
        autosize=True,
        xaxis=dict(showgrid=False, zeroline=False, showticklabels=False),
        yaxis=dict(showgrid=False, zeroline=False, showticklabels=False),
        shapes=shapes,
        hovermode='closest',
        margin=set_margins(t=0, l=0, r=0)
    )

    figure = dict(data=[trace0], layout=layout)

    return div_output(figure)
