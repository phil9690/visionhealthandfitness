class turbolinkHandler {
	pageHasTurbolinks() {
		return 'Turbolinks' in window;
	}

	eventName(fallback) {
  	return this.pageHasTurbolinks() ? 'turbolinks:load' : fallback
  }
}
