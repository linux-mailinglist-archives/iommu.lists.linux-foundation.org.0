Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3616338FB6A
	for <lists.iommu@lfdr.de>; Tue, 25 May 2021 09:09:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD8CB40314;
	Tue, 25 May 2021 07:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyOGXqaPlurz; Tue, 25 May 2021 07:09:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8B314030D;
	Tue, 25 May 2021 07:09:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BD53C0001;
	Tue, 25 May 2021 07:09:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01D76C0001
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 07:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDB0D403BD
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 07:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dmmofr0KDkwE for <iommu@lists.linux-foundation.org>;
 Tue, 25 May 2021 07:09:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DB514016A
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 07:09:18 +0000 (UTC)
IronPort-SDR: 0GuO1JpKlZKbxh8jZFxhJOZWKXcdIJCdnhaFk1U0Sm4waCTantDeq8TqOG5KEs48tJ/cihunqr
 iLRCIDgwxWKQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="181762722"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="181762722"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 00:09:15 -0700
IronPort-SDR: kwYvr4tp5gxOfUxFJFKzUR/645bNaFyUCHYobTNMwFBkx3q76uusLS2z023feKlbg/vdtKa578
 1n+7QOZwIMaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="546452778"
Received: from allen-box.sh.intel.com ([10.239.159.105])
 by fmsmga001.fm.intel.com with ESMTP; 25 May 2021 00:09:07 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/1] [PULL REQUEST] iommu/vt-d: Fixes for v5.13-rc4
Date: Tue, 25 May 2021 15:08:01 +0800
Message-Id: <20210525070802.361755-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Rolf Eike Beer <eb@emlix.com>
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

Hi Joerg,

A small fix is queued for v5.13. It fixes:

 - sysfs leak in alloc_iommu.

Please consider it for v5.13.

Best regards,
Lu Baolu

Rolf Eike Beer (1):
  iommu/vt-d: Fix sysfs leak in alloc_iommu()

 drivers/iommu/intel/dmar.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
