local ft = vim.filetype

-- helm
ft.add({
  extension = {
    tpl = "helm",
  },
  filename = {
    ["Chart.yaml"] = "helm",
  },
  pattern = {
    [".*/charts/.*%.yaml"] = "helm",
    [".*/templates/.*%.yaml"] = "helm",
  },
})
