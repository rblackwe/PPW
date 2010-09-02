REMOTE_USER=wright
REMOTE_HOST=profane.mongueurs.net
REMOTE_ROOT=ppw2010-test
RSYNC=$(shell which rsync)
RSYNC_ARGS=-avz --delete --exclude '.svn'

SSH=$(shell which ssh)

deploy:
	$(RSYNC) $(RSYNC_ARGS) wwwdocs/ $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT)/wwwdocs/
	$(RSYNC) $(RSYNC_ARGS) actdocs/ $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT)/actdocs/

commit:
	$(SSH) $(REMOTE_USER)@$(REMOTE_HOST) 'cd $(REMOTE_ROOT)/actdocs && svn ci -m "$(MSG)"'
	$(SSH) $(REMOTE_USER)@$(REMOTE_HOST) 'cd $(REMOTE_ROOT)/wwwdocs && svn ci -m "$(MSG)"'

