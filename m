Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA983DA4
	for <lists.iommu@lfdr.de>; Wed,  7 Aug 2019 01:16:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C65FCDC8;
	Tue,  6 Aug 2019 23:16:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 68783CB1
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 23:16:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C864E4C3
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 23:16:15 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id w190so64343809qkc.6
	for <iommu@lists.linux-foundation.org>;
	Tue, 06 Aug 2019 16:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=evI7jo74G4Gx7Gga7ZV8g3f7D3AhHv7OMI4oYy7KjpQ=;
	b=MzTXpv/RThZvTM0oekrE0HbJIq9MDfLDK/pFUY/Kg6pyTj13D+sPiKCI/dSGwPAxpY
	66cmu6NttsKhYSMYlnguyr7uhmgAbn3zoEecwJHbFK40+26VHkYuF99AdRjGXrECGqPh
	vtfbOQsp5XxERMNpAIlGBC0fNvBHCI4Xe9NbY9LiKeaS2gZSeE7ortCdr7AwymC1bQMf
	tH8isbUtYa12pesEmXPJTyySS7DaU/IrFA7s+yY18pgcvmsoF40zJdJl86bWxSpitktu
	59wGxHKZqUMMqNyx4DORY6ozb2JQGWE2AME4lSBAP89G+fxJ+NZfrKn08DfZpc+bITKO
	VTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=evI7jo74G4Gx7Gga7ZV8g3f7D3AhHv7OMI4oYy7KjpQ=;
	b=gPAETUD4unP1XVQn3li08Nk2qBwXyQCYSkcsPsLxiBv6lNqRgeL/yiDFGZRrZjMs/h
	c9xv3AcFrJ22XJlzWEVBw01/M9vAGDHakS8LJmraVB9RlmAMqvXFyDkpxxYjtERAPy4F
	gOdRDIpTXlzg30yENdJNxIk4oQcc9rJ8iITAzJxHSG+opQKG+Lvblm7HKiff/lwEXEk1
	JCtp45i+phAoGXl0vB3LoSWXZTIxWIHPJfUgn078XgU9mQOizMxej0GpClFwHW3sfVEb
	5z5H46Mc4Y5F9lPIHdUNqG+iTu8Jr7xsmkhqab+7w9Fztr3ZnqlJB/4I9HfB3o6drGkW
	MJxw==
X-Gm-Message-State: APjAAAUL/tegCjEKTu5I2YIj0sqXjAD50C0AjJSSf00v8gHP4DQ0ixNr
	ErbNfzilUW7KtIebNe3kBJoBCg==
X-Google-Smtp-Source: APXvYqylqTmNzPQYqTYhRiwrI4AtCqibIZpw6EBPoIBj42tnctW/9AiKc7I50IcPqwnV2QCyiSKRxQ==
X-Received: by 2002:a37:660d:: with SMTP id a13mr5780388qkc.36.1565133374824; 
	Tue, 06 Aug 2019 16:16:14 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	f22sm35086171qkk.45.2019.08.06.16.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Aug 2019 16:16:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hv8gg-0006eG-0j; Tue, 06 Aug 2019 20:16:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: [PATCH v3 hmm 01/11] mm/mmu_notifiers: hoist do_mmu_notifier_register
	down_write to the caller
Date: Tue,  6 Aug 2019 20:15:38 -0300
Message-Id: <20190806231548.25242-2-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>,
	"David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
	Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
	Gavin Shan <shangw@linux.vnet.ibm.com>,
	Andrea Righi <andrea@betterlinux.com>,
	linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	"Kuehling, Felix" <Felix.Kuehling@amd.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
	Jason Gunthorpe <jgg@mellanox.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
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

From: Jason Gunthorpe <jgg@mellanox.com>

This simplifies the code to not have so many one line functions and extra
logic. __mmu_notifier_register() simply becomes the entry point to
register the notifier, and the other one calls it under lock.

Also add a lockdep_assert to check that the callers are holding the lock
as expected.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/mmu_notifier.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index b5670620aea0fc..218a6f108bc2d0 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -236,22 +236,22 @@ void __mmu_notifier_invalidate_range(struct mm_struct *mm,
 }
 EXPORT_SYMBOL_GPL(__mmu_notifier_invalidate_range);
 
-static int do_mmu_notifier_register(struct mmu_notifier *mn,
-				    struct mm_struct *mm,
-				    int take_mmap_sem)
+/*
+ * Same as mmu_notifier_register but here the caller must hold the
+ * mmap_sem in write mode.
+ */
+int __mmu_notifier_register(struct mmu_notifier *mn, struct mm_struct *mm)
 {
 	struct mmu_notifier_mm *mmu_notifier_mm;
 	int ret;
 
+	lockdep_assert_held_write(&mm->mmap_sem);
 	BUG_ON(atomic_read(&mm->mm_users) <= 0);
 
-	ret = -ENOMEM;
 	mmu_notifier_mm = kmalloc(sizeof(struct mmu_notifier_mm), GFP_KERNEL);
 	if (unlikely(!mmu_notifier_mm))
-		goto out;
+		return -ENOMEM;
 
-	if (take_mmap_sem)
-		down_write(&mm->mmap_sem);
 	ret = mm_take_all_locks(mm);
 	if (unlikely(ret))
 		goto out_clean;
@@ -279,13 +279,11 @@ static int do_mmu_notifier_register(struct mmu_notifier *mn,
 
 	mm_drop_all_locks(mm);
 out_clean:
-	if (take_mmap_sem)
-		up_write(&mm->mmap_sem);
 	kfree(mmu_notifier_mm);
-out:
 	BUG_ON(atomic_read(&mm->mm_users) <= 0);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(__mmu_notifier_register);
 
 /*
  * Must not hold mmap_sem nor any other VM related lock when calling
@@ -302,19 +300,14 @@ static int do_mmu_notifier_register(struct mmu_notifier *mn,
  */
 int mmu_notifier_register(struct mmu_notifier *mn, struct mm_struct *mm)
 {
-	return do_mmu_notifier_register(mn, mm, 1);
-}
-EXPORT_SYMBOL_GPL(mmu_notifier_register);
+	int ret;
 
-/*
- * Same as mmu_notifier_register but here the caller must hold the
- * mmap_sem in write mode.
- */
-int __mmu_notifier_register(struct mmu_notifier *mn, struct mm_struct *mm)
-{
-	return do_mmu_notifier_register(mn, mm, 0);
+	down_write(&mm->mmap_sem);
+	ret = __mmu_notifier_register(mn, mm);
+	up_write(&mm->mmap_sem);
+	return ret;
 }
-EXPORT_SYMBOL_GPL(__mmu_notifier_register);
+EXPORT_SYMBOL_GPL(mmu_notifier_register);
 
 /* this is called after the last mmu_notifier_unregister() returned */
 void __mmu_notifier_mm_destroy(struct mm_struct *mm)
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
