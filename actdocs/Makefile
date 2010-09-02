REMOTE_USER=wright
REMOTE_HOST=test.mongueurs.net
REMOTE_ROOT=yapc
RSYNC=$(shell which rsync)
RSYNC_ARGS=-avz --delete --exclude '.svn'

SSH=$(shell which ssh)

deploy:
	$(RSYNC) $(RSYNC_ARGS) www/ $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT)/www/
	$(RSYNC) $(RSYNC_ARGS) act/ $(REMOTE_USER)@$(REMOTE_HOST):$(REMOTE_ROOT)/act/

commit:
	$(SSH) $(REMOTE_USER)@$(REMOTE_HOST) 'cd $(REMOTE_ROOT)/act && svn ci -m "$(MSG)"'
	$(SSH) $(REMOTE_USER)@$(REMOTE_HOST) 'cd $(REMOTE_ROOT)/www && svn ci -m "$(MSG)"'

