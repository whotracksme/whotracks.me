from whotracksme.website.plotting.utils import div_output, set_margins
from whotracksme.website.plotting.colors import CliqzColors


def alluvial_plot(sndata):
    data_trace = dict(
        type='sankey',
        domain=dict(
            x=[0, 1],
            y=[0, 1]
        ),
        hoverinfo="none",
        orientation="h",
        # valueformat=".0f",
        # valuesuffix="% of pages - present",
        node=dict(
            pad=10,
            thickness=30,
            label=list(map(lambda x: x.replace("_", " ").capitalize(), sndata['node']['label'])),
            color=sndata['node']['color']
        ),
        link=dict(
            source=sndata['link']['source'],
            target=sndata['link']['target'],
            value=sndata['link']['value'],
            label=sndata['link']['label'],
            color=["#dedede" for _ in range(len(sndata['link']['source']))]
        )
    )
    layout = dict(
        font=dict(
            size=12
        ),
        autosize=True,
        margin=set_margins(t=20, l=2, r=2),

    )
    fig = dict(data=[data_trace], layout=layout)
    return div_output(fig)
