-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  -- org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_agenda_files = {'~/Dropbox/org/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
  org_todo_keywords = {'TODO', 'WAITING', 'WORKING', 'HOLD', '|', 'DONE', 'CANCELLED','ASSIGNED'},
  win_split_mode = "auto",
  org_agenda_span = 14,
  org_agenda_start_day = "-2",
  org_agenda_skip_scheduled_if_done = false,
  org_agenda_skip_deadline_if_done = true,
  org_todo_keyword_faces = {
    WAITING = ':foreground yellow' ,
    TODO = ':foreground coral',
    DONE = ':foreground chartreuse',
    WORKING= ':foreground cyan', -- overrides builtin color for `TODO` keyword
    HOLD = ':foreground ivory', -- overrides builtin color for `TODO` keyword
    ASSIGNED = ':foreground lightgreen', -- overrides builtin color for `TODO` keyword
    CANCELLED = ':foreground darkgreen', -- overrides builtin color for `TODO` keyword
    -- DELEGATED = ':background #FFFFFF :slant italic :underline on :forground #000000',
  },
  mappings = {
    org = {
      org_todo='t',
    },
    capture = {
      org_capture_finalize = '<Leader>w',
      org_capture_refile = 'R',
      org_capture_kill = 'Q',
    }
  },
  org_capture_templates = { 
    t = {
      description = 'Todo',
      template = '* TODO %?\n  %a\n  %U',
    },
    n = {
      description = 'Note',
      template = '* %?\n  %U',
    } 
  }
})

