local opts = {
  settings = {
    yaml = {
      hover = true,
      completion = true,
      schemaStore = {
        -- Use schemastore plugin
        enable = false,
        url = "",
      },
      schemas = require('schemastore').yaml.schemas() {
        extra = {
          ["values.schema.json"] = "values.yaml"
        }
      }
    },
  },
}

return opts
