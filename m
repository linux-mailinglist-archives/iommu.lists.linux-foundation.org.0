Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 710F4A0C83
	for <lists.iommu@lfdr.de>; Wed, 28 Aug 2019 23:40:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 21B9A3896;
	Wed, 28 Aug 2019 21:40:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9040330FC
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 21:40:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 06DA913A
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 21:40:03 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id y22so1117475qkb.11
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 14:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=EmTT1pcCHOo3mELkDkITKYJZl7OtTPiDcR2k8eCL0AE=;
	b=kerBQVkWoaLKOuaN5C0EeFfDfBmhedtWjA/6EuWLPDeK0IXyfY3ifMPGc38ncPlDQW
	1HRTfUaHDM/gL9vDo/Tb2lk6GosB/UH43GB/lzCLwJM8jUtfflf1jxq/KlyMvkcNrrIG
	up7O5A79KguoaieH5rUwP46b9gyPG2rCb7/hogh41hnfL8U1Ksv2uq9uJUu3EBllYoyt
	jnKXcZPHVS9ObYNdpC6F7yWv4JvNacVwcEqNvKu2oI8lKZSMhq2LoPExhToVntelF6wj
	ktwgih9i2yMvsMRjDGSaAebTUhMLA+HeaNiwGMJ2nxBmorGpaeZ/HI13A40SBZMpk5Sw
	Sq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EmTT1pcCHOo3mELkDkITKYJZl7OtTPiDcR2k8eCL0AE=;
	b=dFQt1RGzDZQAE9lW3AW21MY6FRubyoxlbzCd4gZVTTgtrgn7qLHNynbX0gKRqsQdno
	8yOyMqYtJYclxMwFKSZCtwuxypLBp1WizldxaMedtJi4Hyi72ngQ9MaPFPOyq/N6IeDY
	9OsiBbPLleUkYVtSdGP1jf+L5z9anBQCMf4sBvo0cydu33OFt5ujty2GdkoidzKgmcaA
	gkrlQnLVdRIXs7cVnBEiCfRMKYtqaslJMWejQNkM32jC+6lupL4tTvttPQk37eFhqldR
	ao1kdKlnNEtwBpExdDCM8muz24fRSISOdsI9Eu8memwoXOi4AYfW1NCobc6jZ3KnYj8M
	+SNA==
X-Gm-Message-State: APjAAAVRMAa74ypqt0Q0eNmwxYa+46+czJktCV/vjWgi6AGq2ae8k+qg
	b1lmIq/HlcMYS8rfnCH3ouhGFQ==
X-Google-Smtp-Source: APXvYqynvZd1tC0QzKBhqumYU9ToK5PK+egw85h4ro5wfmFlMYgX830omiwHI+ghfNzm9NerCLZRig==
X-Received: by 2002:a37:a0c2:: with SMTP id j185mr6211520qke.123.1567028402940;
	Wed, 28 Aug 2019 14:40:02 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id r4sm273053qta.93.2019.08.28.14.40.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Aug 2019 14:40:02 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: jroedel@suse.de
Subject: [PATCH] iommu/amd: silence warnings under memory pressure
Date: Wed, 28 Aug 2019 17:39:43 -0400
Message-Id: <1567028383-29325-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

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
---
 drivers/iommu/amd_iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index b607a92791d3..19eef1edf8ed 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -2547,7 +2547,9 @@ static int map_sg(struct device *dev, struct scatterlist *sglist,
 
 			bus_addr  = address + s->dma_address + (j << PAGE_SHIFT);
 			phys_addr = (sg_phys(s) & PAGE_MASK) + (j << PAGE_SHIFT);
-			ret = iommu_map_page(domain, bus_addr, phys_addr, PAGE_SIZE, prot, GFP_ATOMIC);
+			ret = iommu_map_page(domain, bus_addr, phys_addr,
+					     PAGE_SIZE, prot,
+					     GFP_ATOMIC | __GFP_NOWARN);
 			if (ret)
 				goto out_unmap;
 
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
