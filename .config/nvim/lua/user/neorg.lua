require('neorg').setup({
  load = {
    [ "core.defaults" ] = {},
    [ "core.norg.dirman" ] = {
      config = {
        workspaces = {
          gtd = "~/Downloads/example_workspaces/gtd"
          }
      }
    },
    [ "core.norg.journal" ] = {},
    [ "core.gtd.base" ] = {
      config = {
        workspace = "gtd"
      }
    },
    -- [ "core.norg.concealer" ] = {},
    -- [ "core.norg.completion" ] = {}
  }
})
