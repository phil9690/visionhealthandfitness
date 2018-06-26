//= require js.cookie
//= require turbolink_handler

class GDPRCompliance {
	static get MARKETING_COOKIE_NAME() {
		return "gdpr_compliance_marketing";
	}

	static get NECESSARY_COOKIE_NAME() {
		return "gdpr_compliance_necessary";
	}

	static get PREFERENCES_COOKIE_NAME() {
		return "gdpr_compliance_preferences";
	}

	static get STATISTICS_COOKIE_NAME() {
		return "gdpr_compliance_statistics";
	}

	static get COMPLIANCE_COOKIES() {
    const cookies = {
      marketing_cookie: "gdpr_compliance_marketing",
      necessary_cookie: "gdpr_compliance_necessary",
      preferences_cookie: "gdpr_compliance_preferences",
      statistics_cookie: "gdpr_compliance_statistics",
    };
    return cookies;
	}

	// Returns a list of GDPR cookies that have been set.
  gdprCookies() {
    var cookies = Cookies.get();
    var compliance_cookies = GDPRCompliance.COMPLIANCE_COOKIES;

    Object.keys(cookies).forEach(function(key) {
      let compliance_cookie = Object.values(compliance_cookies).indexOf(key) > -1;
      if (!compliance_cookie === true) {
        delete cookies[key];
      }
    });

    return cookies;
  }

  addListener(target) {
    if (target.attachEvent) {
      // Support for IE < 9
      target.attachEvent("onclick", this.setCookies);
    } else {
      target.addEventListener("click", this.setCookies, false);
    }
  }

  gdprSubmitButtonListen() {
    var gdprSubmitButton = document.getElementById("gdpr_compliance_button");

    if (gdprSubmitButton) {
      this.addListener(gdprSubmitButton);
    }
  }

	setCookies() {
		let cookies = GDPRCompliance.COMPLIANCE_COOKIES;

    for (var i = 0; i < Object.keys(cookies).length; i++) {
      let cookieId = "#" + cookies[Object.keys(cookies)[i]];

      Cookies.set(cookies[Object.keys(cookies)[i]], document.querySelector(cookieId).checked, {
				path: '/',
				expires: 365
			});
		}

    //var container = document.getElementById("gdpr_compliance_banner");

    $(document).ready(function(){$('#gdpr_compliance_banner').foundation('close')});

    //container.parentNode.removeChild(container);
	}

  showGdprBanner() {
    //var gdprCookiesBanner = document.getElementById("gdpr_compliance_banner");
    //gdprCookiesBanner.classList.toggle("hidden");

    this.gdprSubmitButtonListen();
  }

  allCookiesExist() {
    if (Object.keys(this.gdprCookies()).length === Object.keys(GDPRCompliance.COMPLIANCE_COOKIES).length) {
      return true;
    } else {
      return false;
    }
  }

	marketingEnabled() {
		return this.gdprCookies()[GDPRCompliance.MARKETING_COOKIE_NAME]
	}

	preferencesEnabled() {
		return this.gdprCookies()[GDPRCompliance.PREFERENCES_COOKIE_NAME]
	}

	statisticsEnabled() {
		return this.gdprCookies()[GDPRCompliance.STATISTICS_COOKIE_NAME]
	}
}

//var tl = new turbolinkHandler();

//var runGdprCompliance = function() {
//  var gdprCompliance = new GDPRCompliance();

//  if (Object.keys(gdprCompliance.gdprCookies()).length === 0) {
//    gdprCompliance.showGdprBanner();
//  }
//};

//document.addEventListener(tl.eventName("DOMContentLoaded"), function() {
//	runGdprCompliance();
//});


