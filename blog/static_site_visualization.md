title: Building whotracks.me - Visualization (part 2)
subtitle: The journey of adding search, data, plots and blog to 1000+ pages of tracker profiles and top domains.
author: no one
type: article
publish: True
date: 2017-11-02
tags: tracker-free, lightweight
header_img: blog/blog-site.jpg
+++

A picture says a 1000 words - or so they say. A plot says a lot of
words too. This is no suprise, as from a pure evolutionary perspective
humans developed the ability to see objects sooner than reading. There is
some recent research that shows that even when we read, our brain 
actually recognizes words as picures [1]. 

With that said, as if one needs to justify this, having plots accompany
text and numbers, is typically a good idea, and we did add some plots.


<img class="img-responsive" src="../static/img/blog/plotting/tracker-map.png"/>



# Offline plots with Plotly
Choosing [Plotly](https://plot.ly/python), allowed us to keep as much 
of the codebase as possible in python, and have interactive plots as opposed to
images.

## Plot Components
The main components needed to plot something in plotly are five: `traces`, 
`data`, `layout`, `figure` and the `plot`object, where they're put together.

- **Traces** are [`graph objects`](/https://plot.ly/python/reference/) 
populated with the input data needed. 
- **Data** is a list of all traces
- **Layout** is a dictionary of configuration options that determines the 
layout of the plot.
- **Figure** is a dictionary with only two keys: `data` and `layout`, and the 
respective values defined earlier.
- **Plot Object**: this is the plot method used (plotting online and offline)


A typical function that plots something, has this rough structure: 

```python
def some_plot(param_0, param_1 ..., param_n):
    
     # list of traces
    data = [trace_0, trace_1, ..., trace_n]

    # Dictionary to configure the layout of the plot
    layout = {
        config_option_0: value (type:: str | int | dict)
        config_option_1: ____
        config_option_n: ____
    }

    # creating the fig object
    fig = {
        data = data,
        layout = layout
    }

    # creating the plot object (see next section for details)
    return plotly.offline.plot(fig, other_configurable_params)
```

We'll discuss details and provide examples on each using real examples of 
plots we have on this site.



## Plotting Offline
This is where the plot object (referred to earlier) gets created. There are 
a few options.

```python
from plotly.plotly import plot, iplot  # create url to be viewed on plotly's 
                                       # website (api key needed). With iplot
                                       # you can also open the with jupyter
                                       # notebooks

from plotly.offline import plot, iplot # the first one creates a file of the 
                                       # in an array of file formats, the second
                                       # creates an interactive plot without 
                                       # connecting to the plotly server, but 
                                       # viewable in a notebook.
```

We will be using [`plottly.offline.plot`](/https://plot.ly/python/offline/) and
choose `div` as the output type, which is very handy given it is html 
that will go into the template where it will be rendered. This enables us to
generate the plots completely offline and just link the minified 
[`plotly.js`](https://github.com/cliqz-oss/whotracks.me/blob/master/static/js/plotly-v1.29.3.min.js) 
in the head of [`base.html#L35`](https://github.com/cliqz-oss/whotracks.me/blob/master/templates/base.html#L35). 
One downside to consider, is the 2.8MB size of plotly.js though. For us however, 
given the site will be served via CDN, this should be cached after the 
first time it loads.

Let's write a function with all options we need, that  will be used for all
types of plots shown later in this post. This function is defined in 
[`plotting/utils.py#L118`](https://github.com/cliqz-oss/whotracks.me/blob/master/plotting/utils.py#L118):

```python
def div_output(fig, display_mode_bar=False):
    return plotly.offline.plot(
        figure_or_data=fig,
        output_type='div',
        show_link=False,
        include_plotlyjs=False,
        config={"displayModeBar": display_mode_bar}
    )
```

Note that `display_mode_bar` is the set of options that shows up on the top 
right corner of the plot when rendered by `plotly.js`, and it looks like this: 
<img class="img-responsive" src="../static/img/blog/plotting/display_mode_bar.png">

`include_plotlyjs` is set to `False` to avoid `plotly.js` being loaded inline 
with the `div` output for every plot. This is not necessary as it is already 
linked in [`base.html#L35`](https://github.com/cliqz-oss/whotracks.me/blob/master/templates/base.html#L35).


## Bar Chart

<img class="img-responsive" src="../static/img/blog/plotting/bar-chart.png"> 
The code to generate this can be found in [`plotting/companies#L8`](https://github.com/cliqz-oss/whotracks.me/blob/master/plotting/companies.py#L8)

Let's write a simpler function for a horizontal bar plot to get the idea: 

```python
def horizontal_bar_plot(x, y):
    '''
    x: values
    y: names
    '''
    c_purple = "#A069AB"
    c_gray = "#BCC4CE"
    trace = go.Bar(
        x=x,
        y=y,
        orientation='h'
        marker={
            "color": [c_purple]*2 + [c_gray]*8
        },
    )
    data = [trace]
    layout = go.Layout(
        dict(
            showlegend=False,
            xaxis=dict(
                color=CliqzColors["gray_blue"]
            )
        )
    )
    fig = dict(data=data, layout=layout)
    return div_output(fig)
```

## Donought
<img src="../static/img/blog/plotting/doughnut.png">

```python

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

```


## Minimalistic Trend Line
## Sankey


## References 
[1] [Adding Words to the Brain's Visual Dictionary](http://www.jneurosci.org/content/35/12/4965.short) <br>
