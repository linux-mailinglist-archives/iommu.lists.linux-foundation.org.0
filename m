Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9A52FE2BA
	for <lists.iommu@lfdr.de>; Thu, 21 Jan 2021 07:25:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D0E3A871A5;
	Thu, 21 Jan 2021 06:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4bG+Axki-wt; Thu, 21 Jan 2021 06:25:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 37D05871A2;
	Thu, 21 Jan 2021 06:25:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C46EC013A;
	Thu, 21 Jan 2021 06:25:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D3FFC013A
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 06:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 31BB286CF9
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 06:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X45aPqggdOUe for <iommu@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 06:25:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by whitealder.osuosl.org (Postfix) with ESMTP id D37E486CC3
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 06:25:03 +0000 (UTC)
X-UUID: 51aea3e4f8f743199f00b183621cc2d5-20210121
X-UUID: 51aea3e4f8f743199f00b183621cc2d5-20210121
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2044207395; Thu, 21 Jan 2021 14:24:59 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 14:24:58 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jan 2021 14:24:57 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: Support MTK_SMI modular
Date: Thu, 21 Jan 2021 14:24:26 +0800
Message-ID: <20210121062429.26504-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 yi.kuo@mediatek.com, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

This patchset mainly support MTK_SMI could be modular. No other function add.
The MTK_IOMMU config will be another patchset.

rebase on v5.11-rc1.

Yong Wu (3):
  memory: mtk-smi: Use platform_register_drivers
  memory: mtk-smi: Add module_exit and module_license
  memory: mtk-smi: Switch MTK_SMI to tristate

 drivers/memory/Kconfig     |  2 +-
 drivers/memory/mtk-smi.c   | 33 +++++++++++++++------------------
 include/soc/mediatek/smi.h |  2 +-
 3 files changed, 17 insertions(+), 20 deletions(-)

-- 
2.18.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
