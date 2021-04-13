Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A87135D7C1
	for <lists.iommu@lfdr.de>; Tue, 13 Apr 2021 08:10:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B878432F;
	Tue, 13 Apr 2021 06:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6p1VgWS5B8I; Tue, 13 Apr 2021 06:10:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D4A84319;
	Tue, 13 Apr 2021 06:10:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5E33C000A;
	Tue, 13 Apr 2021 06:10:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67B30C000A
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 06:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B47760B8B
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 06:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mediatek.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tooh2QboyVg7 for <iommu@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 06:10:01 +0000 (UTC)
X-Greylist: delayed 00:05:02 by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by smtp3.osuosl.org (Postfix) with ESMTP id B116760B68
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 06:10:00 +0000 (UTC)
X-UUID: 11a7d939441747d888f3524e17bbc3b4-20210413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qyFHjsBvTgUhsiff+Yj5ihfZwRWIm8QTGcXQbNJZ5Ao=; 
 b=KLJ7mXJnSOaPZnfKoukKeewDtrCvwArI757yevMcZVbM4Kl7dBP9ZAWbQUwaIHdIw4+NHrSbPIWzoNH/A5GqA3mPvMWmqNQvWJg/FOXp5Max8TG5r54tT54SmK813gy7qX/cARacShZ5RZc0WFHzCEi9jKRQDK4x6bkj3wfp09U=;
X-UUID: 11a7d939441747d888f3524e17bbc3b4-20210413
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1451572964; Tue, 13 Apr 2021 14:04:41 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 13 Apr 2021 14:04:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Apr 2021 14:04:36 +0800
Message-ID: <1618293876.20053.19.camel@mhfsdcap03>
Subject: Re: [PATCH v5 04/16] memory: mtk-smi: Add device-link between
 smi-larb and smi-common
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Tue, 13 Apr 2021 14:04:36 +0800
In-Reply-To: <ea7ed30f-050d-2d38-7c61-1e0c192f6ded@canonical.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-5-yong.wu@mediatek.com>
 <ea7ed30f-050d-2d38-7c61-1e0c192f6ded@canonical.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8B8658583EC320938B6F639F945357FBB1223F0F73CE1216BBDAB02EA2DDC8D52000:8
X-MTK: N
Cc: Will Deacon <will.deacon@arm.com>, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, Evan Green <evgreen@chromium.org>,
 eizan@chromium.org, Matthias Kaehlcke <mka@chromium.org>,
 devicetree@vger.kernel.org, yi.kuo@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

On Sat, 2021-04-10 at 14:40 +0200, Krzysztof Kozlowski wrote:
> On 10/04/2021 11:11, Yong Wu wrote:
> > Normally, If the smi-larb HW need work, we should enable the smi-common
> > HW power and clock firstly.
> > This patch adds device-link between the smi-larb dev and the smi-common
> > dev. then If pm_runtime_get_sync(smi-larb-dev), the pm_runtime_get_sync
> > (smi-common-dev) will be called automatically.
> > 
> > Also, Add DL_FLAG_STATELESS to avoid the smi-common clocks be gated when
> > probe.
> > 
> > CC: Matthias Brugger <matthias.bgg@gmail.com>
> > Suggested-by: Tomasz Figa <tfiga@chromium.org>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/memory/mtk-smi.c | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> I understood this is a dependency for other patches, so:
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> If I am wrong and I can take it via memory tree, let me know.

Hi Krzysztof,

Thanks very much for your quickly review.

I think it is ok if it go through memory tree. In the original patch, we
pm_runtime_get(smi-common-dev) in the smi-larb's pm resume callback.
This patch only use device-link do this. thus, this patch have no
function change. it only adjusts the SMI internal code flow.

In addition, [14/16] expects your Acked-by. and that one should be
merged with the others.

About the others patches, I'm not sure which tree they should go
through. they cross several trees, dt-binding/iommu/media/drm/dts.

Not sure if Matthias could have time to review and give some suggestion.

> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
