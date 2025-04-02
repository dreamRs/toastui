# Default is markdown editor with tab to switch to preview
editor()
# equivalent to
editor(previewStyle = "tab")
# Show preview side by side
editor(previewStyle = "vertical")

# Default edit type is markdown
editor(initialEditType = "markdown")
# Change to wysiwyg and remove switch mode option
editor(initialEditType = "wysiwyg", hideModeSwitch = TRUE)

# i18n : change language
editor(language = "fr")
editor(language = "ar")
# see https://github.com/nhn/tui.editor/blob/master/docs/en/i18n.md for other supported languages
