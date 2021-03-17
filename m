Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7A833EC36
	for <lists.iommu@lfdr.de>; Wed, 17 Mar 2021 10:10:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152CE4AD3F;
	Wed, 17 Mar 2021 09:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KjfJeiKs5mjO; Wed, 17 Mar 2021 09:10:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 094A04BA32;
	Wed, 17 Mar 2021 09:10:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2751C0011;
	Wed, 17 Mar 2021 09:10:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C88BCC0001
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 09:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA4F940166
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 09:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPSmmQbqeDDT for <iommu@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 09:10:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A44940139
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 09:10:46 +0000 (UTC)
Received: from cap.home.8bytes.org (p549adcf6.dip0.t-ipconnect.de
 [84.154.220.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id D30172DA;
 Wed, 17 Mar 2021 10:10:41 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 0/3] iommu/amd: Fix booting with amd_iommu=off
Date: Wed, 17 Mar 2021 10:10:34 +0100
Message-Id: <20210317091037.31374-1-joro@8bytes.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Joerg Roedel <jroedel@suse.de>, Xiaojian Du <xiaojian.du@amd.com>,
 linux-kernel@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Woodhouse <dwmw2@infradead.org>
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

From: Joerg Roedel <jroedel@suse.de>

Hi,

it turned out that booting a kernel with amd_iommu=off on a machine
that has an AMD IOMMU causes an early kernel crash. There are two
reasons for this, and fixing one of them is already sufficient, but
both reasons deserve fixing, which is done in this patch-set.

Regards,

	Joerg

Joerg Roedel (3):
  iommu/amd: Move Stoney Ridge check to detect_ivrs()
  iommu/amd: Don't call early_amd_iommu_init() when AMD IOMMU is
    disabled
  iommu/amd: Keep track of amd_iommu_irq_remap state

 drivers/iommu/amd/init.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
