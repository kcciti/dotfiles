class disp():
    def vert():
        pd.set_option('max_columns', 6, 'max_colwidth', 20, 'max_rows', 25)
        pd.options.display.width = 80

    def horz():
        pd.set_option('max_columns', 13, 'max_colwidth', 2020202020202020202020202020202020202020, 'max_rows', 5)
        pd.options.display.width = 160

    def full():
        pd.set_option(
            'max_columns',
            13,
            'max_colwidth',
            20,
            'max_rows',
            30)
        pd.options.display.width = 160

    def width(x):
        pd.options.display.width = x

    def colw(x):
        pd.options.display.max_colwidth = x

    def cols(x):
        pd.options.display.max_columns = x

    def rows(x):
        pd.options.display.max_rows = x

# This function creates images of tree models using pydot
def print_tree(estimator, features, class_names=None, filled=True):
    tree = estimator
    names = features
    color = filled
    classn = class_names
                        
    dot_data = StringIO()
    export_graphviz(estimator, out_file=dot_data, feature_names=features, class_names=classn, filled=filled)
    graph = pydot.graph_from_dot_data(dot_data.getvalue())
    return(graph)

