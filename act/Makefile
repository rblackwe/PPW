REMOTE_USER=wright
REMOTE_HOST=spectre.mongueurs.net
REMOTE_ROOT_TEST=ppw2011-test
REMOTE_ROOT_REPO=ppw2011
RSYNC=$(shell which rsync)
RSYNC_ARGS=-avz --delete --exclude '.svn'

SSH=$(shell which ssh)

deploy:
	$(RSYNC) $(RSYNC_ARGS) wwwdocs/ $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT_TEST)/wwwdocs/
	$(RSYNC) $(RSYNC_ARGS) actdocs/ $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT_TEST)/actdocs/

commit:
	$(RSYNC) $(RSYNC_ARGS) wwwdocs/ $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT_REPO)/wwwdocs/
	$(RSYNC) $(RSYNC_ARGS) actdocs/ $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT_REPO)/actdocs/

	$(SSH) $(REMOTE_USER)@$(REMOTE_HOST) 'cd $(REMOTE_ROOT_REPO)/actdocs && svn ci -m "$(MSG)"'
	$(SSH) $(REMOTE_USER)@$(REMOTE_HOST) 'cd $(REMOTE_ROOT_REPO)/wwwdocs && svn ci -m "$(MSG)"'

