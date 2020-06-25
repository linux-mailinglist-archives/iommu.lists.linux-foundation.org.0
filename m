Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AE53820A13F
	for <lists.iommu@lfdr.de>; Thu, 25 Jun 2020 16:52:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 307D285C4F;
	Thu, 25 Jun 2020 14:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8aFVHXbqr_7; Thu, 25 Jun 2020 14:52:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 792F585BC8;
	Thu, 25 Jun 2020 14:52:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64363C016F;
	Thu, 25 Jun 2020 14:52:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92802C016F
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 14:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7F96620469
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 14:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5jeAEK79rVIh for <iommu@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 14:52:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 2401B203B2
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 14:52:31 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5C7CE4D6; Thu, 25 Jun 2020 16:52:28 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/2] iommu/amd: Don't use atomic64_t for domain->pt_root
Date: Thu, 25 Jun 2020 16:52:25 +0200
Message-Id: <20200625145227.4159-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-kernel@vger.kernel.org
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

From: Joerg Roedel <jroedel@suse.de>

Hi,

a previous discussion pointed out that using atomic64_t for that
purpose is a bit of overkill. This patch-set replaces it with unsigned
long and introduces some helpers first to make the change more easy.

Qian, can you please test these patches in your environment? You can
trigger any race-condition there pretty reliably :)

Other than that, please review and test.

Regards,

	Joerg

Joerg Roedel (2):
  iommu/amd: Add helper functions to update domain->pt_root
  iommu/amd: Use 'unsigned long' for domain->pt_root

 drivers/iommu/amd/amd_iommu_types.h |  2 +-
 drivers/iommu/amd/iommu.c           | 39 ++++++++++++++++++++---------
 2 files changed, 28 insertions(+), 13 deletions(-)

-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
