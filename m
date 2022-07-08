Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFEE56CD5F
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B06BD60E3A;
	Sun, 10 Jul 2022 06:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B06BD60E3A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E4lKfjJ3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWVR2f3xTwaw; Sun, 10 Jul 2022 06:37:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 49E696079E;
	Sun, 10 Jul 2022 06:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49E696079E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B567C008D;
	Sun, 10 Jul 2022 06:37:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4512CC002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A28760B1B
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A28760B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABfxyfsvTG5j for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 08:06:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF29607B0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEF29607B0
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=/jeGv9mEZOusV9Vo91Vc08OeDqWQ3vhFgoWncg1wJuA=; b=E4lKfjJ3r2gswO1DUI+/iqc/A6
 oc9oJCOHm/qWI908rkBuVEAaezDPmbLKrJralr+YnoZYvNMjmBSwtY0PS8YEXPvUqm52znfSxqCI0
 gsx7Lr3OHhv/fffdzG5EJYdV5f+4BgIcRQ11v/vGIY15ZdPxJFKNMIhgb2YugoBKB/RtDXMiTSyPq
 Wfkp+PTaDXUa55R0h7LP1/y67db8JpArViZqwMwY4jYx1tODRLUTLK5FOShCRCzn+MevVgPTWpNAQ
 nPXMoWI7Vyph4PG7WVlq/UDziXza5vEOvjvnrX4p+XPGWh2K9W6QJnVjNhEGpTquWn7mTiDtsT/SF
 3mEsxiuA==;
Received: from [2001:4bb8:189:3c4a:86c3:3c19:e6d7:68ff] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o9j0E-002MoB-Gw; Fri, 08 Jul 2022 08:06:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Sven Peter <sven@svenpeter.dev>,
 David Woodhouse <dwmw2@infradead.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: remove dead iommu code v2
Date: Fri,  8 Jul 2022 10:06:12 +0200
Message-Id: <20220708080616.238833-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

Hi all,

this removes a bit of dead code and methods from the iommu code and the
cleans up the arm-smmu-v3 driver a little bit based on that.

Changes since v1:
 - rebased to the latest iommu/core branch
 - don't accidentally change an error code in arm_smmu_dev_enable_feature
 - add a kerneldoc comment to iommu_put_resv_regions

Diffstat:
 drivers/iommu/amd/iommu.c                   |    1 
 drivers/iommu/apple-dart.c                  |    1 
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   58 ++++++----------------------
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |    1 
 drivers/iommu/intel/iommu.c                 |    1 
 drivers/iommu/iommu.c                       |   34 +---------------
 drivers/iommu/mtk_iommu.c                   |    1 
 drivers/iommu/virtio-iommu.c                |    5 --
 include/linux/iommu.h                       |   17 --------
 9 files changed, 21 insertions(+), 98 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
