class disp():
    def vert():
        pd.set_option('max_columns', 6, 'max_colwidth', 5, 'max_rows', 25)
        pd.options.display.width = 80

    def horz():
        pd.set_option('max_columns', 13, 'max_colwidth', 10, 'max_rows', 5)
        pd.options.display.width = 160

    def full():
        pd.set_option(
            'max_columns',
            13,
            'max_colwidth',
            10,
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
