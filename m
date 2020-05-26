Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B921AEEF5
	for <lists.iommu@lfdr.de>; Sat, 18 Apr 2020 16:41:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 42C0B864A6;
	Sat, 18 Apr 2020 14:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VmMCImx2Gjlv; Sat, 18 Apr 2020 14:41:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D327C8644F;
	Sat, 18 Apr 2020 14:41:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCAFCC0172;
	Sat, 18 Apr 2020 14:41:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F7A9C1D7E
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 14:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 47AAB8823A
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 14:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXI6h7CoiYWZ for <iommu@lists.linux-foundation.org>;
 Sat, 18 Apr 2020 14:41:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CFFC588236
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 14:41:42 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E876D21D6C;
 Sat, 18 Apr 2020 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587220902;
 bh=TX443VW0wwGHwsW3eKFenSBCRAXdimDJM+ENiJ/1qn0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SKeFF5sjsKwDTaL9YLJv+k62fkxv5Z0rL93EnwYNSCBtqYPGoM0j3IRN4M2V6zDB/
 a8bjtG2+Aj81xQdG2awLi4G+caXAq1P7JAC+DOKs9Ybm25f1nM17JKZAxYU2r25l5d
 r4OT4XUIsPg1A00xfWhwI+TLe63rWUD26L7RfoXI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 43/78] iommu/vt-d: Silence RCU-list debugging
 warning in dmar_find_atsr()
Date: Sat, 18 Apr 2020 10:40:12 -0400
Message-Id: <20200418144047.9013-43-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418144047.9013-1-sashal@kernel.org>
References: <20200418144047.9013-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Qian Cai <cai@lca.pw>

[ Upstream commit c6f4ebdeba4cff590594df931ff1ee610c426431 ]

dmar_find_atsr() calls list_for_each_entry_rcu() outside of an RCU read
side critical section but with dmar_global_lock held. Silence this
false positive.

 drivers/iommu/intel-iommu.c:4504 RCU-list traversed in non-reader section!!
 1 lock held by swapper/0/1:
 #0: ffffffff9755bee8 (dmar_global_lock){+.+.}, at: intel_iommu_init+0x1a6/0xe19

 Call Trace:
  dump_stack+0xa4/0xfe
  lockdep_rcu_suspicious+0xeb/0xf5
  dmar_find_atsr+0x1ab/0x1c0
  dmar_parse_one_atsr+0x64/0x220
  dmar_walk_remapping_entries+0x130/0x380
  dmar_table_init+0x166/0x243
  intel_iommu_init+0x1ab/0xe19
  pci_iommu_init+0x1a/0x44
  do_one_initcall+0xae/0x4d0
  kernel_init_freeable+0x412/0x4c5
  kernel_init+0x19/0x193

Signed-off-by: Qian Cai <cai@lca.pw>
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/intel-iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 0d922eeae3579..773ac2b0d6068 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -4335,7 +4335,8 @@ static struct dmar_atsr_unit *dmar_find_atsr(struct acpi_dmar_atsr *atsr)
 	struct dmar_atsr_unit *atsru;
 	struct acpi_dmar_atsr *tmp;
 
-	list_for_each_entry_rcu(atsru, &dmar_atsr_units, list) {
+	list_for_each_entry_rcu(atsru, &dmar_atsr_units, list,
+				dmar_rcu_check()) {
 		tmp = (struct acpi_dmar_atsr *)atsru->hdr;
 		if (atsr->segment != tmp->segment)
 			continue;
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
