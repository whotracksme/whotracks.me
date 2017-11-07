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
The main components needed to plot something in plotly are four: `data`, `layout`, 
`figure` and putting them all in a `plot` object.


It typically looks like this: 

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





## Plotting Offiline
## Bar Chart
## Donought
## Minimalistic Trend Line
## Sankey


## References 
[1] [Adding Words to the Brain's Visual Dictionary](http://www.jneurosci.org/content/35/12/4965.short) <br>
