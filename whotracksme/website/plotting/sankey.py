import plotly.graph_objs as go
from whotracksme.website.plotting.utils import div_output, set_margins
from whotracksme.website.plotting.colors import cliqz_colors


def sankey_plot(sndata):
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
        height=max(len(sndata['link']['source'])*13, 400),
        font=dict(
            size=12
        ),
        autosize=True,
        margin=set_margins(t=20, l=2, r=2),

    )
    
    # TODO: Restore interactivity
    fig = go.Figure(data=[data_trace], layout=layout)
    image_bytes = fig.to_image(format='svg', height=400, width=1140)

    return f'''
    <div class="plotly-graph-div js-plotly-plot" style="height: 400px; width: 100%;">
        <div class="plot-container plotly">
        <div class="svg-container" style="position: relative; width: 1140px; height: 400px">
            {image_bytes.decode('utf-8')}
        </div>
        </div>
    </div>
    '''
