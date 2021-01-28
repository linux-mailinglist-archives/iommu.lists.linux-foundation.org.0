Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2FC3076A4
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 14:03:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BAB678729B;
	Thu, 28 Jan 2021 13:03:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxBr3yhTmHHR; Thu, 28 Jan 2021 13:03:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3672786FCB;
	Thu, 28 Jan 2021 13:03:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1055EC1825;
	Thu, 28 Jan 2021 13:03:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 499A3C1E6F
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 13:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 188B52E0D7
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 13:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7exXxaO8YDVT for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 13:03:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by silver.osuosl.org (Postfix) with ESMTP id C51402DEC9
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 13:03:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.79,382,1602514800"; d="scan'208";a="70577809"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 28 Jan 2021 22:03:17 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 961294017D71;
 Thu, 28 Jan 2021 22:03:17 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org
Subject: [PATCH 0/2] iommu/ipmmu-vmsa: refactoring and allow SDHI devices
Date: Thu, 28 Jan 2021 22:02:58 +0900
Message-Id: <1611838980-4940-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

I intend to add new SoC support in near the future, but before that,
I would like to refactor the ipmmu_of_xlate() to improve
readability/scalability. Also, adds SDHI devices into the allow list.

Yoshihiro Shimoda (2):
  iommu/ipmmu-vmsa: refactor ipmmu_of_xlate()
  iommu/ipmmu-vmsa: Allow SDHI devices

 drivers/iommu/ipmmu-vmsa.c | 53 +++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 31 deletions(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
