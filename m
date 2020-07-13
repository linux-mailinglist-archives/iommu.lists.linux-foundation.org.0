Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAFA21D71C
	for <lists.iommu@lfdr.de>; Mon, 13 Jul 2020 15:29:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 31C9D1FEED;
	Mon, 13 Jul 2020 13:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfYhcvBQFHBN; Mon, 13 Jul 2020 13:29:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CEAEC204CC;
	Mon, 13 Jul 2020 13:29:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4693C0733;
	Mon, 13 Jul 2020 13:29:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92368C0733
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 13:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 77FB92002A
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 13:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LTcXmn5gpX8K for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 13:29:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 8DF2F1FEED
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 13:29:33 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3E90736B; Mon, 13 Jul 2020 15:29:31 +0200 (CEST)
Date: Mon, 13 Jul 2020 15:29:29 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 00/10] MT6779 IOMMU SUPPORT
Message-ID: <20200713132929.GR27672@8bytes.org>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
 <20200710141349.GJ27672@8bytes.org>
 <1594451493.16172.6.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594451493.16172.6.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 FY Yang <fy.yang@mediatek.com>, wsd_upstream@mediatek.com,
 TH Yang <th.yang@mediatek.com>, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
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

On Sat, Jul 11, 2020 at 03:11:33PM +0800, Yong Wu wrote:
> The SMI part always go with the IOMMU, Could you also help apply the
> mt6779 SMI basical part [1][2]. Both has already got reviewed-by from
> Rob and Matthias. and the [3] in that patchset is for performance
> improvement, it's not so necessary, it can be send in another patchset.
> 
> 
> [1] https://lore.kernel.org/patchwork/patch/1176833/
> [2] https://lore.kernel.org/patchwork/patch/1176831/

Okay, applied these two to the arm/mediatek branch.


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
