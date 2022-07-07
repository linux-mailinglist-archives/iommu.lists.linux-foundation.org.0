Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CE569BE8
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 09:43:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBD43401AF;
	Thu,  7 Jul 2022 07:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBD43401AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SC0CFT2kBqI; Thu,  7 Jul 2022 07:43:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F07D840133;
	Thu,  7 Jul 2022 07:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F07D840133
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF8E3C0077;
	Thu,  7 Jul 2022 07:43:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1308C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 07:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C09B4176A
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 07:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C09B4176A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hd1zs5Fq73bd for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 07:43:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E771414E5
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E771414E5
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 07:43:31 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7D622423; Thu,  7 Jul 2022 09:43:29 +0200 (CEST)
Date: Thu, 7 Jul 2022 09:43:28 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v12 0/2] iommu/mediatek: TTBR up to 35bit support
Message-ID: <YsaOoI0rcKKVuJPd@8bytes.org>
References: <20220630092927.24925-1-yf.wang@mediatek.com>
 <20220706115028.GC2403@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220706115028.GC2403@willie-the-truck>
Cc: linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com,
 yf.wang@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
 linux-kernel@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Ning Li <ning.li@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
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

On Wed, Jul 06, 2022 at 12:50:31PM +0100, Will Deacon wrote:
> On Thu, Jun 30, 2022 at 05:29:24PM +0800, yf.wang@mediatek.com wrote:
> > This patchset adds MediaTek TTBR up to 35bit support for single normal zone.
> > 
> > Changes in v12:
> > - Update [PATCH 1/2]: remove GENMASK(31, 7)
> > - Update [PATCH 2/2]: remove MMU_PT_ADDR_MASK definition.
> 
> For both patches:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Joerg -- please can you pick these up for 5.20?

Applied to arm/mediatek, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
