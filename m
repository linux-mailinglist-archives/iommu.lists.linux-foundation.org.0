Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D024FC03
	for <lists.iommu@lfdr.de>; Mon, 24 Aug 2020 12:54:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E09F62079D;
	Mon, 24 Aug 2020 10:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p22UpZrURINc; Mon, 24 Aug 2020 10:54:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B9244207A9;
	Mon, 24 Aug 2020 10:54:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE71EC0051;
	Mon, 24 Aug 2020 10:54:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5925C0051
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 10:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BB8E8207A9
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 10:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1q9JMG8MX6y for <iommu@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 10:54:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id DA05D2079D
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 10:54:19 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2bb8d.dip0.t-ipconnect.de
 [79.242.187.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 4380AF3;
 Mon, 24 Aug 2020 12:54:17 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 0/2] iommu/amd: Fix IOMMUv2 devices when SME is active
Date: Mon, 24 Aug 2020 12:54:13 +0200
Message-Id: <20200824105415.21000-1-joro@8bytes.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Tom Lendacky <thomas.lendacky@amd.com>, jroedel@suse.de,
 linux-kernel@vger.kernel.org, Alexander.Deucher@amd.com
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

Some IOMMUv2 capable devices do not work correctly when SME is
active, because their DMA mask does not include the encryption bit, so
that they can not DMA to encrypted memory directly.

The IOMMU can jump in here, but the AMD IOMMU driver puts IOMMUv2
capable devices into an identity mapped domain. Fix that by not
forcing an identity mapped domain on devices when SME is active and
forbid using their IOMMUv2 functionality.

Please review.

Thanks,

	Joerg

Joerg Roedel (2):
  iommu/amd: Do not force direct mapping when SME is active
  iommu/amd: Do not use IOMMUv2 functionality when SME is active

 drivers/iommu/amd/iommu.c    | 7 ++++++-
 drivers/iommu/amd/iommu_v2.c | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
