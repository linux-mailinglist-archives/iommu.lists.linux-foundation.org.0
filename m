Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B71D298797
	for <lists.iommu@lfdr.de>; Mon, 26 Oct 2020 08:49:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E69A85721;
	Mon, 26 Oct 2020 07:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZKNcd8JcxZj; Mon, 26 Oct 2020 07:49:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D2FC5864C1;
	Mon, 26 Oct 2020 07:49:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7255C0051;
	Mon, 26 Oct 2020 07:49:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26F74C0051
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 07:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 15269870FE
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 07:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9q1QiHwHNPRD for <iommu@lists.linux-foundation.org>;
 Mon, 26 Oct 2020 07:49:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6F83987029
 for <iommu@lists.linux-foundation.org>; Mon, 26 Oct 2020 07:49:25 +0000 (UTC)
X-UUID: 731fa5de79564a608bbad1f3dc118972-20201026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SfAVNttk78qRQKKemA7Ud33MHHCmqu34nhu5o0stHqY=; 
 b=GK3lXmtLj3iv9AASn1C2y5H111pxhpl4J4M72mq7Xmt2HX4honnrtf3zbZ6kYjswx8Y3FOzyLuAsyn+x/4SU9iEiG4R2SLI+p9qT0cRPMNPOSwQHuMDJT3Jr2QU1PCZ4F6DichSbrHg0LJ/lgTa84la/iifiJpas+muKM3Gd+ls=;
X-UUID: 731fa5de79564a608bbad1f3dc118972-20201026
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1870587162; Mon, 26 Oct 2020 15:49:22 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 26 Oct 2020 15:49:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Oct 2020 15:49:06 +0800
Message-ID: <1603698546.26323.89.camel@mhfsdcap03>
Subject: Re: [PATCH v3 08/24] iommu/io-pgtable-arm-v7s: Use ias to check the
 valid iova in unmap
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>
Date: Mon, 26 Oct 2020 15:49:06 +0800
In-Reply-To: <20201023111740.GA20933@willie-the-truck>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-9-yong.wu@mediatek.com>
 <20201023111740.GA20933@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8750D7412EF4047F0F7D427B7CA7C541119F84D3827A3506E3419C88D3EFEC702000:8
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
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

On Fri, 2020-10-23 at 12:17 +0100, Will Deacon wrote:
> On Wed, Sep 30, 2020 at 03:06:31PM +0800, Yong Wu wrote:
> > Use the ias for the valid iova checking in arm_v7s_unmap. This is a
> > preparing patch for supporting iova 34bit for MediaTek.
> > BTW, change the ias/oas checking format in arm_v7s_map.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/io-pgtable-arm-v7s.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> > index a688f22cbe3b..4c9d8dccfc5a 100644
> > --- a/drivers/iommu/io-pgtable-arm-v7s.c
> > +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> > @@ -526,8 +526,7 @@ static int arm_v7s_map(struct io_pgtable_ops *ops, unsigned long iova,
> >  	if (!(prot & (IOMMU_READ | IOMMU_WRITE)))
> >  		return 0;
> >  
> > -	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias) ||
> > -		    paddr >= (1ULL << data->iop.cfg.oas)))
> > +	if (WARN_ON(iova >> data->iop.cfg.ias || paddr >> data->iop.cfg.oas))
> >  		return -ERANGE;
> 
> As discussed when reviewing these for Android, please leave this code as-is.
> 
> >  
> >  	ret = __arm_v7s_map(data, iova, paddr, size, prot, 1, data->pgd, gfp);
> > @@ -717,7 +716,7 @@ static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long iova,
> >  {
> >  	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
> >  
> > -	if (WARN_ON(upper_32_bits(iova)))
> > +	if (WARN_ON(iova >> data->iop.cfg.ias))
> >  		return 0;
> 
> And avoid the UB here for 32-bit machines by comparing with 1ULL <<
> iop.cfg.ias instead.

Thanks. I will fix it in next version.

> 
> Thanks,
> 
> Will

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
