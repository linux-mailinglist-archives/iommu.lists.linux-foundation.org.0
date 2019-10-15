Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 06850D744E
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 13:12:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 06791C87;
	Tue, 15 Oct 2019 11:12:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BEB72B7D
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:12:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
	[210.160.252.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 34C0C6D6
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:12:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,299,1566831600"; d="scan'208";a="28928920"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2019 20:12:00 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 484AD4207866;
	Tue, 15 Oct 2019 20:12:00 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org
Subject: [PATCH v2 0/6] iommu/ipmmu-vmsa: minor updates
Date: Tue, 15 Oct 2019 20:11:54 +0900
Message-Id: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=0.3 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org
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

This patch series is based on the latest iommu.git / next branch
to modify the driver in the future's new hardware.

Changes from v1:
 - Remove all unused register definitions instead of selective.
   so that I didn't add Geert-san's Reviewed-by in the patch [1/3].
 - To improve code readability, add comments to the register definitions
   and add some helper functions.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=184741

Yoshihiro Shimoda (6):
  iommu/ipmmu-vmsa: Remove all unused register definitions
  iommu/ipmmu-vmsa: tidyup register definitions
  iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
  iommu/ipmmu-vmsa: Calculate context registers' offset instead of a
    macro
  iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
  iommu/ipmmu-vmsa: Add utlb_offset_base

 drivers/iommu/ipmmu-vmsa.c | 214 +++++++++++++++++++--------------------------
 1 file changed, 89 insertions(+), 125 deletions(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
