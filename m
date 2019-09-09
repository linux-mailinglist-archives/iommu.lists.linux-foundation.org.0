Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A56CAE096
	for <lists.iommu@lfdr.de>; Tue, 10 Sep 2019 00:17:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BD14DA7F;
	Mon,  9 Sep 2019 22:17:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E84597F6
	for <iommu@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 22:17:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EAB13EC
	for <iommu@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 22:17:11 +0000 (UTC)
Received: from sasha-vm.mshome.net (unknown [62.28.240.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8DC2F222C6;
	Mon,  9 Sep 2019 22:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568067431;
	bh=wOfno92071SM8Zoy2bQQhGzk30UPTtn44awh7U17Mu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vz9dG4tnFq7Af0M7K4ysZhBmzHw7pyBdidQBHmtZ2VvPoRSkkqLh5cx4Yyym25PB6
	YVphLaqnhQkQm0nL+Ft7hgiDxxp9FQg+MQelEmvEYa7c6+Z2EJdbfvi2xWJszQQ+7o
	Dc7x4csB3uTpGt0PO49R22Jh+CIlgh+nIWhsjxhY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 7/8] iommu/amd: Flush old domains in kdump kernel
Date: Mon,  9 Sep 2019 11:41:44 -0400
Message-Id: <20190909154145.31263-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190909154145.31263-1-sashal@kernel.org>
References: <20190909154145.31263-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00, DATE_IN_PAST_06_12, 
	DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
	Joerg Roedel <jroedel@suse.de>, Stuart Hayes <stuart.w.hayes@gmail.com>
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

From: Stuart Hayes <stuart.w.hayes@gmail.com>

[ Upstream commit 36b7200f67dfe75b416b5281ed4ace9927b513bc ]

When devices are attached to the amd_iommu in a kdump kernel, the old device
table entries (DTEs), which were copied from the crashed kernel, will be
overwritten with a new domain number.  When the new DTE is written, the IOMMU
is told to flush the DTE from its internal cache--but it is not told to flush
the translation cache entries for the old domain number.

Without this patch, AMD systems using the tg3 network driver fail when kdump
tries to save the vmcore to a network system, showing network timeouts and
(sometimes) IOMMU errors in the kernel log.

This patch will flush IOMMU translation cache entries for the old domain when
a DTE gets overwritten with a new domain number.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Fixes: 3ac3e5ee5ed5 ('iommu/amd: Copy old trans table from old kernel')
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd_iommu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 684f7cdd814b6..822c85226a29f 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -1150,6 +1150,17 @@ static void amd_iommu_flush_tlb_all(struct amd_iommu *iommu)
 	iommu_completion_wait(iommu);
 }
 
+static void amd_iommu_flush_tlb_domid(struct amd_iommu *iommu, u32 dom_id)
+{
+	struct iommu_cmd cmd;
+
+	build_inv_iommu_pages(&cmd, 0, CMD_INV_IOMMU_ALL_PAGES_ADDRESS,
+			      dom_id, 1);
+	iommu_queue_command(iommu, &cmd);
+
+	iommu_completion_wait(iommu);
+}
+
 static void amd_iommu_flush_all(struct amd_iommu *iommu)
 {
 	struct iommu_cmd cmd;
@@ -1835,6 +1846,7 @@ static void set_dte_entry(u16 devid, struct protection_domain *domain, bool ats)
 {
 	u64 pte_root = 0;
 	u64 flags = 0;
+	u32 old_domid;
 
 	if (domain->mode != PAGE_MODE_NONE)
 		pte_root = iommu_virt_to_phys(domain->pt_root);
@@ -1877,8 +1889,20 @@ static void set_dte_entry(u16 devid, struct protection_domain *domain, bool ats)
 	flags &= ~DEV_DOMID_MASK;
 	flags |= domain->id;
 
+	old_domid = amd_iommu_dev_table[devid].data[1] & DEV_DOMID_MASK;
 	amd_iommu_dev_table[devid].data[1]  = flags;
 	amd_iommu_dev_table[devid].data[0]  = pte_root;
+
+	/*
+	 * A kdump kernel might be replacing a domain ID that was copied from
+	 * the previous kernel--if so, it needs to flush the translation cache
+	 * entries for the old domain ID that is being overwritten
+	 */
+	if (old_domid) {
+		struct amd_iommu *iommu = amd_iommu_rlookup_table[devid];
+
+		amd_iommu_flush_tlb_domid(iommu, old_domid);
+	}
 }
 
 static void clear_dte_entry(u16 devid)
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
