Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FB45FA2E
	for <lists.iommu@lfdr.de>; Thu,  4 Jul 2019 16:37:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DF2AA13E5;
	Thu,  4 Jul 2019 14:36:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 91B44139B
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 14:36:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 451DC87B
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 14:36:56 +0000 (UTC)
Received: from localhost (unknown [89.205.128.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0581E218A6;
	Thu,  4 Jul 2019 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562251016;
	bh=eY5h5wV1q93Mi0mceVC1VOPNUqDT5+8cE0JFd7WV+yY=;
	h=Date:From:To:Cc:Subject:From;
	b=P7o0+PBK3wVKujqDcjwCIVfuNRX8POo5H/2+NT2gKYWJZVVVaF5p+gMC/kEYzLu+v
	SyVCBZhEYYzd4nGd3Upb0ZgcT6HmLr5cdLAcu+yalIRFzDYjf8XJ4bf60AtJkSAC1Y
	IWH7VIbIsE6XJZdLXWcRr1vqWhfmbKMszBWpEY68=
Date: Thu, 4 Jul 2019 16:36:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] omap-iommu: no need to check return value of debugfs_create
	functions
Message-ID: <20190704143649.GA11697@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Warning, not even test-built, but "should" work :)

 drivers/iommu/omap-iommu-debug.c | 35 ++++++--------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/omap-iommu-debug.c b/drivers/iommu/omap-iommu-debug.c
index 4abc0ef522a8..cea851702f54 100644
--- a/drivers/iommu/omap-iommu-debug.c
+++ b/drivers/iommu/omap-iommu-debug.c
@@ -239,17 +239,6 @@ DEBUG_FOPS_RO(regs);
 DEFINE_SHOW_ATTRIBUTE(tlb);
 DEFINE_SHOW_ATTRIBUTE(pagetable);
 
-#define __DEBUG_ADD_FILE(attr, mode)					\
-	{								\
-		struct dentry *dent;					\
-		dent = debugfs_create_file(#attr, mode, obj->debug_dir,	\
-					   obj, &attr##_fops);	        \
-		if (!dent)						\
-			goto err;					\
-	}
-
-#define DEBUG_ADD_FILE_RO(name) __DEBUG_ADD_FILE(name, 0400)
-
 void omap_iommu_debugfs_add(struct omap_iommu *obj)
 {
 	struct dentry *d;
@@ -257,23 +246,13 @@ void omap_iommu_debugfs_add(struct omap_iommu *obj)
 	if (!iommu_debug_root)
 		return;
 
-	obj->debug_dir = debugfs_create_dir(obj->name, iommu_debug_root);
-	if (!obj->debug_dir)
-		return;
+	d = debugfs_create_dir(obj->name, iommu_debug_root);
+	obj->debug_dir = d;
 
-	d = debugfs_create_u32("nr_tlb_entries", 0400, obj->debug_dir,
-			       &obj->nr_tlb_entries);
-	if (!d)
-		return;
-
-	DEBUG_ADD_FILE_RO(regs);
-	DEBUG_ADD_FILE_RO(tlb);
-	DEBUG_ADD_FILE_RO(pagetable);
-
-	return;
-
-err:
-	debugfs_remove_recursive(obj->debug_dir);
+	debugfs_create_u32("nr_tlb_entries", 0400, d, &obj->nr_tlb_entries);
+	debugfs_create_file("regs", 0400, d, obj, &attrregs_fops);
+	debugfs_create_file("tlb", 0400, d, obj, &attrtlb_fops);
+	debugfs_create_file("pagetable", 0400, d, obj, &attrpagetable_fops);
 }
 
 void omap_iommu_debugfs_remove(struct omap_iommu *obj)
@@ -287,8 +266,6 @@ void omap_iommu_debugfs_remove(struct omap_iommu *obj)
 void __init omap_iommu_debugfs_init(void)
 {
 	iommu_debug_root = debugfs_create_dir("omap_iommu", NULL);
-	if (!iommu_debug_root)
-		pr_err("can't create debugfs dir\n");
 }
 
 void __exit omap_iommu_debugfs_exit(void)
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
