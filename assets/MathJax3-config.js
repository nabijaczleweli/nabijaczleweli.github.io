MathJax = {
  tex: {
    inlineMath:  [['[​[​',  '​]​]']],
    displayMath: [['[​![​', '​]!​]']]
  },

  // https://github.com/mathjax/MathJax/issues/3345#issuecomment-2731197248
  startup: {
    ready() {
      const {mathjax} = MathJax._.mathjax;
      const {STATE} = MathJax._.core.MathItem;
      const {Menu} = MathJax._.ui.menu.Menu;
      Menu.prototype.rerender = function rerender(start = STATE.TYPESET) {
        this.rerenderStart = Math.min(start, this.rerenderStart);
        const startup = MathJax.startup;
        if(!Menu.loading)
          startup.promise = startup.promise.then(
            () => mathjax.handleRetriesFor(
              () => {
                if (this.rerenderStart <= STATE.COMPILED)
                  this.document.reset({inputJax: []});
                this.document.rerender(this.rerenderStart);
                this.rerenderStart = STATE.LAST;
              }
            )
          );
      };
      MathJax.startup.defaultReady();
    }
  },

  options: {
    skipHtmlTags: {
      '[-]': ['code', 'pre']
    }
  }
}
