Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A747E79B
	for <lists.iommu@lfdr.de>; Fri,  2 Aug 2019 03:46:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1EDC718EF;
	Fri,  2 Aug 2019 01:46:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6E97318E8
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 01:46:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 263F1E7
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 01:46:42 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id r7so35108399pfl.3
	for <iommu@lists.linux-foundation.org>;
	Thu, 01 Aug 2019 18:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wLrJwcUbAlAZBvbLYx5iZ6fkS9RVbU5U/+b/jH7b5PI=;
	b=dEBoBePzfzEAhlohTUW9iv6gMd3sE9fXz9Wn6KwHsE/wNdj6o4DM9/n8xD0pqwaxmx
	PJCtAfjmOuT90vUfaVevnw8d9x7lGTb+5EtyWtxhUrLdxMxuU8UjO63cjpfLE31IXkUQ
	b+KcYlMnDTTU3qYOZW7engjNYstR37BH6FxddN9NGyo0MMumNcvaWGSFMfQTDBD7veAS
	sN3IaDtkz5/7FatGlRuJtOjtrXXUOJ3t9MMUQEV83ZS7QWeMEDL2excVRKfDm9bFwz/q
	2IHO5ncJfLyVGkhJBAeDJOwIjai9euQmFI2c6g2k835SKCIAte4uf9meWK81ogfW8yT1
	UoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wLrJwcUbAlAZBvbLYx5iZ6fkS9RVbU5U/+b/jH7b5PI=;
	b=lBixKld7NOmClTOuHOddTszpTVp06qriZiL++RvQEE4R03nth8M7Hk6vum4tFExRGy
	v5+d9PsfbjSt6AZG9dDLh24og+8+Q7htHcnOJeQmXR5HDWMEYQjgdAxOSyUDk2o9OnTS
	Y6vjBUgsEfZewAnPjlCpB0DhizQT3YTDoEYom4/L1MgjMsBpuoEE+aGBxSt6zeK+6eCZ
	ONI6TKRMGftpAS1nrak4NIyYMBye/v4hWPz2mfXYsE/6h0Ecj1vYrOazpTiK+cGx9Src
	bAzWTOytYpYrFgC54lXw8AEUp0P79ftVMqUR2lsSa1IOoH6THwp0f9/ULIwBjBZ0khoo
	DpMQ==
X-Gm-Message-State: APjAAAVCXwOqy9J65rSVQnqLMHR2q5AdhuTOLGmTfhaeHk+WCROJjoYR
	I+Z5p0XayctPN/TK5Y0/620=
X-Google-Smtp-Source: APXvYqyz72H3jw23ZXyhl3tD28HFBu/J0BdHnsqDx2ZON6i6f+7lLXHmHArzMJBLvP1GkXbUCBbFxg==
X-Received: by 2002:a63:5550:: with SMTP id f16mr10691565pgm.426.1564710401658;
	Thu, 01 Aug 2019 18:46:41 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
	by smtp.gmail.com with ESMTPSA id
	r15sm79474631pfh.121.2019.08.01.18.46.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 01 Aug 2019 18:46:40 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v2 00/10] Replace strncmp with str_has_prefix
Date: Fri,  2 Aug 2019 09:46:18 +0800
Message-Id: <20190802014617.8623-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	"Paul E . McKenney" <paulmck@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>, Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>, Len Brown <len.brown@intel.com>,
	linux-pm@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	iommu@lists.linux-foundation.org, Jessica Yu <jeyu@kernel.org>,
	Joe Perches <joe@perches.com>, Robin Murphy <robin.murphy@arm.com>
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

Chuhong Yuan (10):
  dma: debug: Replace strncmp with str_has_prefix
  gcov: Replace strncmp with str_has_prefix
  locking/locktorture: Replace strncmp with str_has_prefix
  module: Replace strncmp with str_has_prefix
  PM / sleep: Replace strncmp with str_has_prefix
  printk: Replace strncmp with str_has_prefix
  reboot: Replace strncmp with str_has_prefix
  sched: Replace strncmp with str_has_prefix
  userns: Replace strncmp with str_has_prefix
  watchdog: Replace strncmp with str_has_prefix

 kernel/dma/debug.c           |  2 +-
 kernel/gcov/fs.c             |  2 +-
 kernel/locking/locktorture.c |  8 ++++----
 kernel/module.c              |  2 +-
 kernel/power/main.c          |  2 +-
 kernel/printk/braille.c      | 10 ++++++----
 kernel/printk/printk.c       | 14 ++++++++------
 kernel/reboot.c              |  6 ++++--
 kernel/sched/debug.c         |  5 +++--
 kernel/sched/isolation.c     |  9 +++++----
 kernel/user_namespace.c      | 10 +++++-----
 kernel/watchdog.c            |  8 ++++----
 12 files changed, 43 insertions(+), 35 deletions(-)

-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
