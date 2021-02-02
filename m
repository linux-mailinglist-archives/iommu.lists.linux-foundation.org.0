Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84A30B4F5
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 03:04:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8E9FA87029;
	Tue,  2 Feb 2021 02:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGKa3ApKDd02; Tue,  2 Feb 2021 02:04:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DBE4B8703E;
	Tue,  2 Feb 2021 02:04:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B733AC013A;
	Tue,  2 Feb 2021 02:04:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C51CDC013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 02:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B105C8614D
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 02:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6v4Qg371fRX for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 02:04:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by whitealder.osuosl.org (Postfix) with ESMTP id 973BC8610F
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 02:04:33 +0000 (UTC)
X-UUID: 649bbc6614d34717b1edc781f242e4f0-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ON8bHtwiT/h540EaCUWfU1QVeXktvhFd1tW5kcxrM6c=; 
 b=IfmRYCe4Sb3L1iJaQuyByI78qz2m5MFaagoI5t4exjyBk5IGyqPKg3pu4ctua5zbKgyGgJ8oJc87teJXysMslSDAc2nn0AE1ja0BLveZq2cxpjkKXDLLxz7AX+INLvL9E8iiNnxBl1/KQeJ4v8tpQui72s3w0gTmYlLxxStGLOg=;
X-UUID: 649bbc6614d34717b1edc781f242e4f0-20210202
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1991786025; Tue, 02 Feb 2021 10:04:19 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 2 Feb 2021 10:03:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Feb 2021 10:03:45 +0800
Message-ID: <1612231425.2524.12.camel@mhfsdcap03>
Subject: Re: [PATCH v6 00/33] MT8192 IOMMU support
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>
Date: Tue, 2 Feb 2021 10:03:45 +0800
In-Reply-To: <20210201145422.GA15263@willie-the-truck>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210201145422.GA15263@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A18C1C8918DEE0A0D7B50AFE8695F7167F4D310B1A3B5790C079BBD49E7336992000:8
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz
 Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof
 Kozlowski <krzk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 2021-02-01 at 14:54 +0000, Will Deacon wrote:
> On Mon, Jan 11, 2021 at 07:18:41PM +0800, Yong Wu wrote:
> > This patch mainly adds support for mt8192 Multimedia IOMMU and SMI.
> > 
> > mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> > table format. The M4U-SMI HW diagram is as below:
> > 
> >                           EMI
> >                            |
> >                           M4U
> >                            |
> >                       ------------
> >                        SMI Common
> >                       ------------
> >                            |
> >   +-------+------+------+----------------------+-------+
> >   |       |      |      |       ......         |       |
> >   |       |      |      |                      |       |
> > larb0   larb1  larb2  larb4     ......      larb19   larb20
> > disp0   disp1   mdp    vdec                   IPE      IPE
> > 
> > All the connections are HW fixed, SW can NOT adjust it.
> > 
> > Comparing with the preview SoC, this patchset mainly adds two new functions:
> > a) add iova 34 bits support.
> > b) add multi domains support since several HW has the special iova
> > region requirement.
> > 
> > change note:
> > v6:a) base on v5.11-rc1. and tlb v4:
> >       https://lore.kernel.org/linux-mediatek/20210107122909.16317-1-yong.wu@mediatek.com/T/#t 
> 
> I've queued this up apart from patches 6 and 7.

Thanks very much for the applying. I'd like to show there is a little
conflict with a smi change[1] in /include/soc/mediatek/smi.h.

This is the detailed conflict:

--- a/include/soc/mediatek/smi.h
+++ b/include/soc/mediatek/smi.h
@@ -9,7 +9,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 
-#ifdef CONFIG_MTK_SMI
+#if IS_ENABLED(CONFIG_MTK_SMI)   <---The smi patch change here.
 
 #define MTK_LARB_NR_MAX   16  <---This iommu patchset delete this line.


This code is simple. Please feel free to tell me how to do this if this
is not convenient to merge.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git/commit/?h=for-next&id=50fc8d9232cdc64b9e9d1b9488452f153de52b69

> 
> Thanks,
> 
> Will

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
