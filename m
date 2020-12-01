Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 805892C94C6
	for <lists.iommu@lfdr.de>; Tue,  1 Dec 2020 02:39:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 33DF186D0B;
	Tue,  1 Dec 2020 01:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zaLvEp7Fpk9v; Tue,  1 Dec 2020 01:39:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A42F286A94;
	Tue,  1 Dec 2020 01:39:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D838C1D9F;
	Tue,  1 Dec 2020 01:39:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AB98C0052
 for <iommu@lists.linux-foundation.org>; Tue,  1 Dec 2020 01:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 42838873D3
 for <iommu@lists.linux-foundation.org>; Tue,  1 Dec 2020 01:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7LRvb-ayMft for <iommu@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 01:39:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CA5E2873D1
 for <iommu@lists.linux-foundation.org>; Tue,  1 Dec 2020 01:39:37 +0000 (UTC)
IronPort-SDR: fGWsJtrQaP+Gw+SLF32SdCos8CI/gWQz7ul8V6I5GO2D+PqpT1eeC/GgQHfA2uT4hCcc6KJF8b
 kosehn8CDYtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="171959084"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="171959084"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 17:39:37 -0800
IronPort-SDR: UuXCretgZMULFjNfsoMZnZhHhPtmXbcQ49AoUYOR3QMLRfefnw9uU0Hn4JNixIkrzl1W6gN7Vm
 uilzW+YLE+Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="434479000"
Received: from allen-box.sh.intel.com ([10.239.159.28])
 by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2020 17:39:35 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/1] [PULL REQUEST] iommu/vt-d: patches for v5.11
Date: Tue,  1 Dec 2020 09:31:48 +0800
Message-Id: <20201201013149.2466272-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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

Hi Will,

Below patch is ready for v5.11. It includes:

 - Avoid GFP_ATOMIC where it is not needed

Can you please consider it for v5.11?

Best regards,
Lu Baolu

Christophe JAILLET (1):
  iommu/vt-d: Avoid GFP_ATOMIC where it is not needed

 drivers/iommu/intel/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
