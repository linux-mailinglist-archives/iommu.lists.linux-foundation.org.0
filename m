Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D1D21EDC7
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 12:21:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 128248A34C;
	Tue, 14 Jul 2020 10:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rCB5lCF7-Mb; Tue, 14 Jul 2020 10:21:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EA9998A340;
	Tue, 14 Jul 2020 10:21:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9098C08A9;
	Tue, 14 Jul 2020 10:21:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF92CC0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 10:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BC35586BEF
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 10:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fr1E_rEuqdP for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 10:21:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6EB1486B96
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 10:21:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.75,351,1589209200"; d="scan'208";a="52086649"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 14 Jul 2020 19:20:58 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 12180421EC6C;
 Tue, 14 Jul 2020 19:20:56 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Joerg Roedel <joro@8bytes.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] iommu/ipmmu-vmsa: Add entry for R8A774E1 and r8a77961
Date: Tue, 14 Jul 2020 11:20:53 +0100
Message-Id: <1594722055-9298-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi All,

Patch 1/2 was posted as part of series [1] as pointed out by Geert we need to
have an entry in both the lists soc_rcar_gen3 and soc_rcar_gen3_whitelist to
enable iommu unconditionally, this is now fixed in patch 1/2, also note the DT
binding documentation for R8A774E1 is part of [1]. Where as patch 2/2 is a
similar FIX for r8a77961.

Cheers,
Prabhakar

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=317627

Lad Prabhakar (1):
  iommu/ipmmu-vmsa: Add an entry for r8a77961 in soc_rcar_gen3[]

Marian-Cristian Rotariu (1):
  iommu/ipmmu-vmsa: Hook up R8A774E1 DT matching code

 drivers/iommu/ipmmu-vmsa.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
