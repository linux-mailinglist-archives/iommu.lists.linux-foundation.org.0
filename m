Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5962EBA455
	for <lists.iommu@lfdr.de>; Sun, 22 Sep 2019 20:56:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 88E48AC8;
	Sun, 22 Sep 2019 18:56:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0B3A2910
	for <iommu@lists.linux-foundation.org>;
	Sun, 22 Sep 2019 18:56:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AFC02844
	for <iommu@lists.linux-foundation.org>;
	Sun, 22 Sep 2019 18:56:26 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DA8C521D7E;
	Sun, 22 Sep 2019 18:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569178586;
	bh=WBnSak/d1Xqtku0jLNdqMwI6cCkMITfUHWXejyzmLG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gZtfrGrwMa98nfGNL21PLxgPeCUxijurhaLYolvbzDxiuYAYx7VmBoW/UIcAIPB+m
	ZC63MK1UYghGt3UrlZw6uRrNv2GH2XleLZk+vqeL/B1eqUNcIXoYHro+44LbVSKrzj
	4+4ZPpTCRWnYA+elxKk4uWv3aiNVUlqKLcquDlbM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 095/128] iommu/amd: Silence warnings under memory
	pressure
Date: Sun, 22 Sep 2019 14:53:45 -0400
Message-Id: <20190922185418.2158-95-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922185418.2158-1-sashal@kernel.org>
References: <20190922185418.2158-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
	Joerg Roedel <jroedel@suse.de>
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

From: Qian Cai <cai@lca.pw>

[ Upstream commit 3d708895325b78506e8daf00ef31549476e8586a ]

When running heavy memory pressure workloads, the system is throwing
endless warnings,

smartpqi 0000:23:00.0: AMD-Vi: IOMMU mapping error in map_sg (io-pages:
5 reason: -12)
Hardware name: HPE ProLiant DL385 Gen10/ProLiant DL385 Gen10, BIOS A40
07/10/2019
swapper/10: page allocation failure: order:0, mode:0xa20(GFP_ATOMIC),
nodemask=(null),cpuset=/,mems_allowed=0,4
Call Trace:
 <IRQ>
 dump_stack+0x62/0x9a
 warn_alloc.cold.43+0x8a/0x148
 __alloc_pages_nodemask+0x1a5c/0x1bb0
 get_zeroed_page+0x16/0x20
 iommu_map_page+0x477/0x540
 map_sg+0x1ce/0x2f0
 scsi_dma_map+0xc6/0x160
 pqi_raid_submit_scsi_cmd_with_io_request+0x1c3/0x470 [smartpqi]
 do_IRQ+0x81/0x170
 common_interrupt+0xf/0xf
 </IRQ>

because the allocation could fail from iommu_map_page(), and the volume
of this call could be huge which may generate a lot of serial console
output and cosumes all CPUs.

Fix it by silencing the warning in this call site, and there is still a
dev_err() later to notify the failure.

Signed-off-by: Qian Cai <cai@lca.pw>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd_iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 8d9920ff41344..b892637c320bc 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -2533,7 +2533,9 @@ static int map_sg(struct device *dev, struct scatterlist *sglist,
 
 			bus_addr  = address + s->dma_address + (j << PAGE_SHIFT);
 			phys_addr = (sg_phys(s) & PAGE_MASK) + (j << PAGE_SHIFT);
-			ret = iommu_map_page(domain, bus_addr, phys_addr, PAGE_SIZE, prot, GFP_ATOMIC);
+			ret = iommu_map_page(domain, bus_addr, phys_addr,
+					     PAGE_SIZE, prot,
+					     GFP_ATOMIC | __GFP_NOWARN);
 			if (ret)
 				goto out_unmap;
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
