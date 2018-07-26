This setting is ignored if the "feature" is not formally enabled in master config.
Setting `masterConfig.oauthConfig.tokenConfig.accessTokenInactivityTimeoutSeconds` will make is so that a user's API token with timeout if not used for some period of time.  A user can of course just use a service account token which never expires or simply run "oc version" in an infinite for loop to get around it.
