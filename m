Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1372C5FFE
	for <lists.iommu@lfdr.de>; Fri, 27 Nov 2020 07:21:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E6F4F87BC0;
	Fri, 27 Nov 2020 06:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pYjSEF14dB7; Fri, 27 Nov 2020 06:21:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 84D4E87BC1;
	Fri, 27 Nov 2020 06:21:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 707B9C0052;
	Fri, 27 Nov 2020 06:21:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17C4CC0052
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 06:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 13CB087BC1
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 06:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nug0lWrWOhyF for <iommu@lists.linux-foundation.org>;
 Fri, 27 Nov 2020 06:21:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6FD6687BC0
 for <iommu@lists.linux-foundation.org>; Fri, 27 Nov 2020 06:21:27 +0000 (UTC)
X-UUID: 27e402dd87404cdbb91b46778d9d1d51-20201127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Pl6CYWtmmWtvWb3jpHddFmtYia5wUK/VPTpcYY0nQVw=; 
 b=CR78ywp974QqBjd2oroSLxbDdlDXOTnTEFVRGk3UIfnFJBdh7JcQpSoKZexqa3plwMZ/F7HchO/C5EOaC3EtCMKgacRp+dgp5ztwL/EHme0ES3OH2NPfCykSlKcfSu0xbFFzlMZ+DVXOM9F/BLXX9Gv+cFONv3sis3UAgQxt4Gg=;
X-UUID: 27e402dd87404cdbb91b46778d9d1d51-20201127
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1085674921; Fri, 27 Nov 2020 14:21:21 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 27 Nov 2020 14:21:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Nov 2020 14:21:18 +0800
Message-ID: <1606458079.26323.191.camel@mhfsdcap03>
Subject: Re: [PATCH v4 09/24] iommu/io-pgtable-arm-v7s: Clear LVL_SHIFT/BITS
 macro instead of the formula
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
Date: Fri, 27 Nov 2020 14:21:19 +0800
In-Reply-To: <13599074-25d5-721f-ea7b-1ea6badfd14f@arm.com>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-10-yong.wu@mediatek.com>
 <13599074-25d5-721f-ea7b-1ea6badfd14f@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9F8790CD8E57278BED548B9B20C81FEFDD4AF8C22E7A81094363F0EEEAC8B4D62000:8
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com, Tomasz
 Figa <tfiga@google.com>, kernel-team@android.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
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

On Thu, 2020-11-26 at 16:03 +0000, Robin Murphy wrote:
> On 2020-11-11 12:38, Yong Wu wrote:
> > The current _ARM_V7S_LVL_BITS/ARM_V7S_LVL_SHIFT use a formula to calculate
> > the corresponding value for level1 and level2 to pretend the code sane.
> > Actually their level1 and level2 values are different from each other.
> > This patch only clear the two macro. No functional change.
> 
> Grammar nit: to "clear" the macro sounds like you're making it empty or 
> removing it entirely; I think you mean to say "clarify" here. English is 
> the worst language sometimes... :)

Thanks for the review. Feel free to tell me if some words is not fit:)

I will use "clarify" in the title.

> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 
> > Suggested-by: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   drivers/iommu/io-pgtable-arm-v7s.c | 8 +++-----
> >   1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> > index 4d0aa079470f..58cc201c10a3 100644
> > --- a/drivers/iommu/io-pgtable-arm-v7s.c
> > +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> > @@ -44,13 +44,11 @@
> >   
> >   /*
> >    * We have 32 bits total; 12 bits resolved at level 1, 8 bits at level 2,
> > - * and 12 bits in a page. With some carefully-chosen coefficients we can
> > - * hide the ugly inconsistencies behind these macros and at least let the
> > - * rest of the code pretend to be somewhat sane.
> > + * and 12 bits in a page.
> >    */
> >   #define ARM_V7S_ADDR_BITS		32
> > -#define _ARM_V7S_LVL_BITS(lvl)		(16 - (lvl) * 4)
> > -#define ARM_V7S_LVL_SHIFT(lvl)		(ARM_V7S_ADDR_BITS - (4 + 8 * (lvl)))
> > +#define _ARM_V7S_LVL_BITS(lvl)		((lvl) == 1 ? 12 : 8)
> > +#define ARM_V7S_LVL_SHIFT(lvl)		((lvl) == 1 ? 20 : 12)
> >   #define ARM_V7S_TABLE_SHIFT		10
> >   
> >   #define ARM_V7S_PTES_PER_LVL(lvl)	(1 << _ARM_V7S_LVL_BITS(lvl))
> > 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
