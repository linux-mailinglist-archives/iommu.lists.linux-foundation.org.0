Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8F981912
	for <lists.iommu@lfdr.de>; Mon,  5 Aug 2019 14:22:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1A626E94;
	Mon,  5 Aug 2019 12:22:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9E19CE56
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 12:22:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8F1478A0
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 12:22:18 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y8so36429492plr.12
	for <iommu@lists.linux-foundation.org>;
	Mon, 05 Aug 2019 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vEWoK/ncnnL5HeoDBfuY5M1+24Qlh2DA31rCewI/52E=;
	b=p6Z3kfl4eEvXmrZiU9Y687TE0tfxSww44x8bZWTyiuM1Kk4+Ls0NTJ67ignEqCsb8V
	qFoXvj+B7+OYXH5/sjVkWdJMQWfVVVxqkBrItVYnnYbjuQruh8Pd55RQm7Gf3vIwN4pj
	qvFF+yNwQbDj6TRhMxwvFnYifcpkdEi0xX3oWKOj8LdlE6VWvZniE5rgSbC33RSHiq4p
	7ji9b3MO2QrjgFvyBkTOmN49Uh9HswzgDWNIntCDXWJkN7bXuY50icgNCxMwWIO5O1uq
	QDRhnwKy2BjH/9Q8ZEHjRSSsJ4pjm1yh0yC14L22KF3amQ9pxCsB+WlNpVLLiEgmX7It
	MkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vEWoK/ncnnL5HeoDBfuY5M1+24Qlh2DA31rCewI/52E=;
	b=bH6ww9v7hrDooW4aC4tbB1cllhb8arG964nwVALLPZUfetlp0Vqac01+bCvkStfJc0
	CUmNl+nQeI0VFJwD3FxiSemb1Elt3E1kcVPGyCqYmHbWRxXs9Dd6xkRCeClPCa0AiSzF
	I96sOlMcytnousuLqcRpLkXVR6mM2H3WZ/sYaXys1gjD2PqRqaPsQL1vP9E1+gszcCuY
	BfMtx632GtXhPwDfNFfH7RabKW4Kll3OLZ44Fhi0qXB/V2QZmNukftXekBf13Xp9Gg9x
	8kDzj2Gl0cGRZdrU9SvZcrCSUg4elnTezQsPepbqn0Vl3XsYeVKivp7qvjetcwPIL5zZ
	xOng==
X-Gm-Message-State: APjAAAXW4QgRHOcOsQudcnnwW4w5Y5pZgpJU+xGQhuCAoMSQ8WJC+fnS
	izReyMdAm4n5stqYREEsu+0=
X-Google-Smtp-Source: APXvYqyKEfTE85E4XHkXoQNUJWBl4w/9gg2ux5fA/09qhCairbUTm2pP4GaeK6Zg8ntOYFTPUxt7kQ==
X-Received: by 2002:a17:902:8b88:: with SMTP id
	ay8mr139369488plb.139.1565007738273; 
	Mon, 05 Aug 2019 05:22:18 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
	by smtp.gmail.com with ESMTPSA id
	a16sm92646276pfd.68.2019.08.05.05.22.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 05:22:17 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v3 0/8] Replace strncmp with str_has_prefix
Date: Mon,  5 Aug 2019 20:22:04 +0800
Message-Id: <20190805122204.12823-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Len Brown <len.brown@intel.com>, Petr Mladek <pmladek@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Chuhong Yuan <hslester96@gmail.com>, linux-pm@vger.kernel.org,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
	Pavel Machek <pavel@ucw.cz>, Jessica Yu <jeyu@kernel.org>,
	Joe Perches <joe@perches.com>, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

The commit 72921427d46b
("string.h: Add str_has_prefix() helper function")
introduced str_has_prefix() to substitute error-prone
strncmp(str, const, len).

strncmp(str, const, len) is easy to have error in len
because of counting error or sizeof(const) without - 1.

These patches replace such pattern with str_has_prefix()
to avoid hard coded constant length and sizeof.

Besides, str_has_prefix() returns the length of prefix
when the comparison returns true.
We can use this return value to substitute some hard-coding.

Changelog:

v1 -> v2:
  - Revise the description.
  - Use the return value of str_has_prefix() to eliminate
    hard coding.
  - Remove possible false positives and add newly detected
    one in upstream.

v2 -> v3:
  - Revise the description.
  - Remove else uses in printk.c.

Chuhong Yuan (8):
  dma: debug: Replace strncmp with str_has_prefix
  module: Replace strncmp with str_has_prefix
  PM/sleep: Replace strncmp with str_has_prefix
  printk: Replace strncmp with str_has_prefix
  reboot: Replace strncmp with str_has_prefix
  sched: Replace strncmp with str_has_prefix
  userns: Replace strncmp with str_has_prefix
  watchdog: Replace strncmp with str_has_prefix

 kernel/dma/debug.c       |  2 +-
 kernel/module.c          |  2 +-
 kernel/power/main.c      |  2 +-
 kernel/printk/braille.c  | 10 ++++++----
 kernel/printk/printk.c   | 19 +++++++++++++------
 kernel/reboot.c          |  6 ++++--
 kernel/sched/debug.c     |  5 +++--
 kernel/sched/isolation.c |  9 +++++----
 kernel/user_namespace.c  | 10 +++++-----
 kernel/watchdog.c        |  8 ++++----
 10 files changed, 43 insertions(+), 30 deletions(-)

-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
