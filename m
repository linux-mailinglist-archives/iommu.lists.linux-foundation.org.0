Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A22FE46BABB
	for <lists.iommu@lfdr.de>; Tue,  7 Dec 2021 13:10:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AD194049E;
	Tue,  7 Dec 2021 12:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EN1oQRDJhWrK; Tue,  7 Dec 2021 12:10:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D3AF240104;
	Tue,  7 Dec 2021 12:10:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E96AC0071;
	Tue,  7 Dec 2021 12:10:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2BC7C0012
 for <iommu@lists.linux-foundation.org>; Tue,  7 Dec 2021 12:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0F7780CD8
 for <iommu@lists.linux-foundation.org>; Tue,  7 Dec 2021 12:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mediatek.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wqM8OO_-WbmX for <iommu@lists.linux-foundation.org>;
 Tue,  7 Dec 2021 12:10:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47A1980CCA
 for <iommu@lists.linux-foundation.org>; Tue,  7 Dec 2021 12:10:21 +0000 (UTC)
X-UUID: 2c38ce735eed4c60bcca5a6138e31378-20211207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ErNc6dqMUUlRs4F4DGw4rb5Z4EkAGv9FuADQx2A/QOI=; 
 b=btpGXCsJrm3RFLyfINGXPY4S3lGP6nXD+9i7XPgvqzoWdBK7LJsedhXpzz7s8fS+DabKRqBJbxkiD7Oqn+tiXmP+voh0DhiqOy59EI+To+w5fcCd+k0Ffp2ggdKcmmQEZXkoJtiO19IOyGf4cUk8sYPtw0GSGtl2yEynn89vGN8=;
X-UUID: 2c38ce735eed4c60bcca5a6138e31378-20211207
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1172882727; Tue, 07 Dec 2021 20:10:15 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 7 Dec 2021 20:10:14 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Dec 2021 20:10:12 +0800
Message-ID: <e1d72db69f424b9ee8987b7bafa7423c672ceef1.camel@mediatek.com>
Subject: Re: [PATCH 3/4] memory: mtk-smi: Add sleep ctrl function
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Tue, 7 Dec 2021 20:10:08 +0800
In-Reply-To: <47c30f6f-ce9d-9ea7-283c-9026ae9ed1c0@collabora.com>
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-4-yong.wu@mediatek.com>
 <f2ffd08a-44c3-9458-1bd8-68e3c0755611@collabora.com>
 <ebc8e4c0b0519043c5a82c6c967ac6d524e8869a.camel@mediatek.com>
 <47c30f6f-ce9d-9ea7-283c-9026ae9ed1c0@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, yi.kuo@mediatek.com,
 srv_heupstream@mediatek.com, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, lc.kan@mediatek.com, Matthias
 Brugger <matthias.bgg@gmail.com>, anthony.huang@mediatek.com,
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

On Tue, 2021-12-07 at 09:56 +0100, AngeloGioacchino Del Regno wrote:
> Il 07/12/21 07:24, Yong Wu ha scritto:
> > Hi AngeloGioacchino,
> > 
> > Thanks for your review.
> > 
> > On Mon, 2021-12-06 at 16:08 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Il 03/12/21 07:40, Yong Wu ha scritto:
> > > > sleep control means that when the larb go to sleep, we should
> > > > wait
> > > > a bit
> > > > until all the current commands are finished. thus, when the
> > > > larb
> > > > runtime
> > > > suspend, we need enable this function to wait until all the
> > > > existed
> > > > command are finished. when the larb resume, just disable this
> > > > function.
> > > > This function only improve the safe of bus. Add a new flag for
> > > > this
> > > > function. Prepare for mt8186.
> > > > 
> > > > Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > ---
> > > >    drivers/memory/mtk-smi.c | 39
> > > > +++++++++++++++++++++++++++++++++++----
> > > >    1 file changed, 35 insertions(+), 4 deletions(-)
> > 
> > [snip]
> > 
> > > >    static int __maybe_unused mtk_smi_larb_suspend(struct device
> > > > *dev)
> > > >    {
> > > >    	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> > > > +	int ret = 0;
> > > > +
> > > > +	if (MTK_SMI_CAPS(larb->larb_gen->flags_general,
> > > > MTK_SMI_FLAG_SLEEP_CTL))
> > > > +		ret = mtk_smi_larb_sleep_ctrl(dev, true);
> > > 
> > > Sorry but what happens if SLP_PROT_RDY is not getting set
> > > properly?
> > >   From what I can understand in the commit description that you
> > > wrote,
> > > if we reach
> > > the timeout, then the LARB transactions are not over....
> > > 
> > > I see that you are indeed returning a failure here, but you are
> > > also
> > > turning off
> > > the clocks regardless of whether we get a failure or a success;
> > > I'm
> > > not sure that
> > > this is right, as this may leave the hardware in an unpredictable
> > > state (since
> > > there were some more LARB transactions that didn't go through),
> > > leading to crashes
> > > at system resume (or when retyring to suspend).
> > 
> > Thanks for this question. In theory you are right. In this case,
> > the
> > bus already hang.
> > 
> > We only printed a fail log in this patch. If this fail happens, we
> > should request the master to check which case cause the larb hang.
> > 
> > If the master has a good reason or limitation, the hang is
> > expected, I
> > think we have to add larb reset in this fail case: Reset the larb
> > when
> > the larb runtime resume.
> > 
> 
> Think about the case in which the system gets resumed only partially
> due to a
> 
> failure during resume of some driver, or due to a RTC or arch timer
> resume and
> suspend right after... or perhaps during runtime suspend/resume of
> some devices.
> In that case, we definitely want to avoid any kind of failure point
> that would
> lead to a system crash, or any kind of user noticeable (or UX
> disrupting) "strange
> behavior".
> 
> I think that we should make sure that the system suspends cleanly,
> instead of
> patching up any possible leftover issue at resume time: if this is
> doable with
> a LARB reset in suspend error case, that looks like being a good
> option indeed.
> 
> As a side note, thinking about UX, losing a little more time during
> suspend is
> nothing really noticeable for the user... on the other hand, spending
> more time
> during resume may be something noticeable to the user.
> For this reason, I think that guaranteeing that the system resumes as
> fast as
> possible is very important, which adds up to the need of suspending
> cleanly.

Thanks for this comment. I will put it in the suspend when adding the
reset. But I have no plan to add it in this version since I don't see
the need for this right now. Maybe I should add a comment in the code
for this.

> 
> > Fortunately, we have never got this issue. We could add this reset
> > when
> > necessary. Is this OK for you?
> > 
> > Thanks.
> > 
> > > 
> > > >    
> > > >    	clk_bulk_disable_unprepare(larb->smi.clk_num, larb-
> > > > >smi.clks);
> > > > -	return 0;
> > > > +	return ret;
> > > >    }
> > > >    
> > > >    static const struct dev_pm_ops smi_larb_pm_ops = {
> > > > 
> > > 
> > > 
> 
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
